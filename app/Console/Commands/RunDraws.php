<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Automation;
use App\Models\Winner;
use App\Models\Ticket;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
use DB;

class RunDraws extends Command
{
    protected $signature = 'draws:run';
    protected $description = 'Exécute le tirage au sort pour les automatisations actives';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        Log::info('Début de l\'exécution des tirages...');

        // Récupérer toutes les automatisations associées à une campagne "en cours" et non stoppées
        $automations = Automation::with('campaign', 'prize')
            ->whereHas('campaign', function($query) {
                $query->where('status', 'en cours'); // Vérifie que la campagne est "en cours"
            })
            ->where('is_stopped', false) // Vérifie que l'automatisation n'est pas stoppée
            ->get();

        Log::info('Automatisations récupérées : ' . $automations->count());

        foreach ($automations as $automation) {
            Log::info('Traitement de l\'automatisation ID : ' . $automation->id);

            $lastRun = $automation->last_run_at ?? $automation->created_at;
            $now = Carbon::now();

            if ($this->shouldRun($automation->frequency, $lastRun, $now)) {
                Log::info('Condition de fréquence remplie pour l\'automatisation ID : ' . $automation->id);

                // Récupération des tickets pour le tirage
                $tickets = Ticket::where('campaign_id', $automation->campaign_id)->get();
                Log::info('Tickets récupérés pour la campagne ID : ' . $automation->campaign_id . ', Nombre de tickets : ' . $tickets->count());

                if ($tickets->isNotEmpty()) {
                    Log::info('Nombre de gagnants à sélectionner : ' . $automation->number_of_winners);
                    for ($i = 0; $i < $automation->number_of_winners; $i++) {
                        $this->drawWinner($automation, $tickets);
                    }
                } else {
                    Log::warning('Aucun ticket disponible pour la campagne ID : ' . $automation->campaign_id);
                }

                // Mettre à jour le timestamp du dernier tirage
                $automation->update(['last_run_at' => $now]);
            } else {
                Log::info('La condition de fréquence n\'est pas remplie pour l\'automatisation ID : ' . $automation->id);
            }
        }

        Log::info('Tous les tirages ont été exécutés avec succès.');
    }

    protected function shouldRun($frequency, $lastRun, $now)
    {
        $diffInMinutes = $lastRun->diffInMinutes($now);
        $diffInDays = $lastRun->diffInDays($now);

        switch ($frequency) {
            case 'every-30-minutes':
                return $diffInMinutes >= 30;
            case 'hourly':
                return $diffInMinutes >= 60;
            case 'daily':
                return $diffInDays >= 1;
            case 'every-2-days':
                return $diffInDays >= 2;
            case 'weekly':
                return $diffInDays >= 7;
            case 'bi-weekly':
                return $diffInDays >= 14;
            case 'tri-weekly':
                return $diffInDays >= 21;
            case 'monthly':
                return $diffInDays >= 30;
            default:
                return false;
        }
    }

    protected function drawWinner($automation, $tickets)
    {
        // Group tickets by phone and count occurrences
        $ticketCounts = $tickets->groupBy('phone')->map(function ($group) {
            return $group->count();
        });

        // Weighted random selection based on ticket counts
        $weightedTickets = [];
        foreach ($ticketCounts as $phone => $count) {
            for ($j = 0; $j < $count; $j++) {
                $weightedTickets[] = $phone;
            }
        }

        $winnerPhone = $weightedTickets[array_rand($weightedTickets)];
        Log::info('Gagnant sélectionné pour la campagne ID : ' . $automation->campaign_id . ', Téléphone : ' . $winnerPhone);

        // Enregistrement du gagnant dans la base de données
        Winner::create([
            'prize_id' => $automation->prize_id,
            'phone' => $winnerPhone,
            'campaign_id' => $automation->campaign_id,  // Ajout de campaign_id ici
            'automation_id'=>$automation->id,
            'date' => now(),
        ]);

        Log::info('Gagnant enregistré dans la base de données : Téléphone : ' . $winnerPhone);
    }
}
