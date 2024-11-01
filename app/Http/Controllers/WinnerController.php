<?php

namespace App\Http\Controllers;

use App\Models\Campaign; // Assure-toi que le namespace est correct
use App\Models\Prize; // Assure-toi que le namespace est correct
use App\Models\Winner; // Assure-toi que le namespace est correct
use Illuminate\Http\Request;

class WinnerController extends Controller
{
    public function saveWinner(Request $request)
    {
        // Valider les données
     /*   $validatedData = $request->validate([
            'prize_id' => 'required|exists:prizes,id',
            'phone' => 'required|string',
            'date' => 'required|date_format:Y-m-d H:i:s',
        ]);
     */
        $data = $request->all();
        $prize_id = $data['prize_id'];
        $phone = $data['phone'];
        $campaign_id = $data['campaign_id'];

        // Créer le gagnant
        Winner::create([
            'prize_id' => $prize_id,
            'phone' => $phone,
            'campaign_id' => $campaign_id
            //'draw_date' => $validatedData['date'],
        ]);

        return response()->json([
            "success" => true,
        ]);

        // Rediriger vers la liste des gagnants avec les informations du gagnant enregistré
        return redirect()->route('winners.index')->with([
            'phone' => $winner->phone,
            'prize_id' => $winner->prize_id
        ]);
    }



    public function index(Request $request)
    {
        $query = Winner::query();

        if ($request->has('campaign_id') && $request->campaign_id) {
            $query->where('campaign_id', $request->campaign_id);
        }

        if ($request->has('prize_id') && $request->prize_id) {
            $query->where('prize_id', $request->prize_id);
        }

        $winners = $query->get();

        $campaigns = Campaign::all();
        $prizes = Prize::all();

        return view('winners.index', [
            'winners' => $winners,
            'campaigns' => $campaigns,
            'prizes' => $prizes
        ]);
    }

    // Ajoutez ici d'autres méthodes pour afficher les gagnants, etc.
}
