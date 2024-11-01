<?php

namespace App\Console\Commands;

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Automation;
use App\Models\Winner;
use App\Models\Ticket;

class RunDraws extends Command
{
    // Signature de la commande
    protected $signature = 'draws:run';

    // Description de la commande
    protected $description = 'Exécute le tirage au sort pour les automatisations actives';

    public function handle()
    {
        \Log::info('Début de l\'exécution des tirages...');

        // Récupérer les automatisations actives
        $automations = Automation::with('campaign', 'prize')->where('status', 'Actif')->get();

        \Log::info('Automatisations récupérées : ' . $automations->count());

        foreach ($automations as $automation) {
            if ($this->shouldRunDraw($automation)) {
                $tickets = Ticket::where('campaign_id', $automation->campaign_id)->get();
                \Log::info('Tickets récupérés pour la campagne : ' . $automation->campaign_id);

                if ($tickets->isNotEmpty()) {
                    for ($i = 0; $i < $automation->number_of_winners; $i++) {
                        $this->drawWinner($automation, $tickets);
                    }
                }
            }
        }

        \Log::info('Tous les tirages ont été exécutés avec succès.');
    }


    private function shouldRunDraw($automation)
    {
        // Récupérer la fréquence de l'automatisation
        $frequency = $automation->frequency;

        // Récupérer la date de création de l'automatisation
        $createdAt = $automation->created_at;

        // Obtenir la date actuelle
        $now = now();

        // Calculer la différence de temps depuis la création
        $differenceInDays = $createdAt->diffInDays($now);

        // Vérifier si la fréquence est hebdomadaire
        if ($frequency === 'weekly') {
            return $differenceInDays >= 7;
        }

        // Vérifier si la fréquence est mensuelle
        if ($frequency === 'monthly') {
            return $differenceInDays >= 30;
        }

        // Vérifier si la fréquence est journalière
        if ($frequency === 'daily') {
            return $differenceInDays >= 1;
        }

        // Par défaut, ne pas effectuer de tirage
        return false;
    }

    private function drawWinner($automation, $tickets)
    {
        // Compter le nombre de tickets par numéro de téléphone
        $ticketCounts = $tickets->groupBy('phone')->map(function ($group) {
            return $group->count();
        });

        // Créer un tableau pour stocker les tickets avec leurs poids
        $weightedTickets = [];
        foreach ($ticketCounts as $phone => $count) {
            // Ajouter le numéro de téléphone plusieurs fois selon le nombre de tickets
            for ($j = 0; $j < $count; $j++) {
                $weightedTickets[] = $phone;
            }
        }

        // Tirage aléatoire d'un gagnant parmi les tickets
        $winnerPhone = $weightedTickets[array_rand($weightedTickets)];

        // Enregistrer le gagnant
        Winner::create([
            'prize_id' => $automation->prize_id,
            'phone' => $winnerPhone,
            'date' => now(),
        ]);
    }
}
