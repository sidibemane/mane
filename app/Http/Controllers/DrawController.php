<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Campaign;
use App\Models\Prize;
use App\Models\Ticket;
use App\Models\Winner;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class DrawController extends Controller
{
    /**
     * Affiche la page de tirage avec la sélection de la campagne et des prix.
     */
    public function showDrawForm()
    {
        $campaigns = Campaign::all();
        return view('draw.form', compact('campaigns'));
    }
    public function create()
    {
        // Récupérer toutes les campagnes
        $campaigns = Campaign::all();

        // Retourner la vue avec les campagnes
        return view('draw.page', compact('campaigns'));
    }
    /**
     * Récupère les prix associés à une campagne via AJAX.
     */
    public function getPrizesByCampaign(Request $request)
    {
        $prizes = Prize::where('campaign_id', $request->campaign_id)->get();
        return response()->json($prizes);
    }
    public function perform(Request $request)
    {
        // Validation des entrées
        $request->validate([
            'campaign_id' => 'required|exists:campaigns,id',
            'prize_id' => 'required|exists:prizes,id',
        ]);

        // Logique du tirage
        // Vous pouvez personnaliser cette partie selon vos besoins

        // Exemple simple : sélectionner un ticket aléatoire
        $ticket = Ticket::where('campaign_id', $request->campaign_id)
            ->inRandomOrder()
            ->first();

        if ($ticket) {
            // Créer une entrée pour le gagnant
            $winner = Winner::create([
                'prize_id' => $request->prize_id,
                'phone' => $ticket->phone,
                'date' => now(),
            ]);

            return redirect()->back()->with('success', 'Tirage effectué avec succès !');
        } else {
            return redirect()->back()->with('error', 'Aucun ticket trouvé pour cette campagne.');
        }
    }
    /**
     * Effectue le tirage au sort.
     */
    public function performDraw(Request $request)
    {
        $request->validate([
            'campaign_id' => 'required|exists:campaigns,id',
            'prize_id' => 'required|exists:prizes,id',
        ]);

        // Récupérer tous les tickets de la campagne sélectionnée
        $tickets = Ticket::where('campaign_id', $request->campaign_id)->get();

        if ($tickets->isEmpty()) {
            return redirect()->back()->with('error', 'Aucun ticket disponible pour cette campagne.');
        }

        // Logique de tirage : prioriser les numéros avec plus d'achats de crédits
        // Ici, on peut imaginer une logique qui trie les tickets en fonction de leur fréquence, etc.
        // Pour l'exemple, on va simplement sélectionner un ticket aléatoire

        $winningTicket = $tickets->random();

        // Enregistrer le gagnant
        Winner::create([
            'prize_id' => $request->prize_id,
            'phone' => $winningTicket->phone,
            'date' => Carbon::now(),
        ]);

        return redirect()->route('draw.result', $winningTicket->phone)->with('success', 'Tirage effectué avec succès !');
    }

    /**
     * Affiche le résultat du tirage avec le numéro gagnant.
     */
    public function showDrawResult($phone)
    {
        $winner = Winner::where('phone', $phone)->latest()->first();
        return view('draw.result', compact('winner'));
    }
    public function getPhonesForCampaign($campaignId)
    {
        // Vérifiez si des numéros sont renvoyés

        $phones = Ticket::where('campaign_id', $campaignId)
            ->select('phone')
            //->groupBy('phone')
            //->orderByDesc('count')
            ->pluck('phone')
            //->get()
            ->toArray();
        $phoneWinner = $phones[array_rand($phones)];
        if (count($phones) > 0){
            $winner = [
                'phone' => $phoneWinner,
            ];
            return response()->json($winner);
        }
        return response()->json("Pas de ticket pour cette campagne");



    }


    /**
     * Affiche la liste des gagnants, filtrée par campagne, prix et date.
     */
    public function showWinners(Request $request)
    {
        $winners = Winner::query();

        if ($request->filled('campaign_id')) {
            $winners->whereHas('prize.campaign', function ($query) use ($request) {
                $query->where('id', $request->campaign_id);
            });
        }

        if ($request->filled('prize_id')) {
            $winners->where('prize_id', $request->prize_id);
        }

        if ($request->filled('date')) {
            $winners->whereDate('date', $request->date);
        }

        $winners = $winners->get();

        $campaigns = Campaign::all();
        $prizes = Prize::all();

        return view('draw.winners', compact('winners', 'campaigns', 'prizes'));
    }
}
