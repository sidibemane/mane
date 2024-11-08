<?php

namespace App\Http\Controllers;

use App\Models\Automation;
use App\Models\Campaign;
use App\Models\Prize;
use App\Models\Winner;
use Illuminate\Http\Request;
use App\Console\Commands\RunDraws;
use Illuminate\Support\Facades\Artisan;

class AutomationController extends Controller
{
    public function index()
    {
        // Récupérer les automatisations
        $automations = Automation::with(['campaign', 'prize'])->get();

        // Appeler la commande via Artisan
        Artisan::call('draws:run');

        return view('automations.index', compact('automations'));
    }

    public function create()
    {
        $campaigns = Campaign::all();
        $prizes = Prize::where('type', 'non-physique')->whereIn('campaign_id', $campaigns->pluck('id'))->get(); // Lots non-physiques liés aux campagnes

        return view('automations.create', compact('campaigns', 'prizes'));
    }
    // Stocke la nouvelle automatisation
    public function store(Request $request)
    {
        $request->validate([
            'campaign_id' => 'required|exists:campaigns,id',
            'prize_id' => 'required|exists:prizes,id',
            'status' => 'required|in:À venir,En cours,Terminé',
            'frequency' => 'required|string',
            'number_of_winners' => 'required|integer|min:1',
        ]);

        Automation::create($request->all());

        return redirect()->route('automations.index')->with('success', 'Automatisation créée avec succès !');
    }

    public function showWinners($automationId)
    {
        // Récupérer les gagnants de lots non physiques pour l'automatisation donnée

        $winners = Winner::where('automation_id', $automationId)
            ->whereHas('prize', function($query) {
                $query->where('type', 'Non-physique'); // Filtre les lots non physiques
            })
            ->with(['campaign', 'prize']) // Charger les relations nécessaires
            ->get();

        // Retourner la vue `winner` dans le dossier `automations`
        return view('automations.winner', compact('winners'));
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'campaign_id' => 'required|exists:campaigns,id',
            'prize_id' => 'required|exists:prizes,id',
            'status' => 'required|in:À venir,En cours,Terminé',
            'frequency' => 'required|string',
            'number_of_winners' => 'required|integer|min:1',
        ]);

        $automation = Automation::findOrFail($id);
        $automation->update($request->all());

        return redirect()->route('automations.index')->with('success', 'Automatisation mise à jour avec succès !');
    }

    public function edit($id)
    {
        $automation = Automation::findOrFail($id);
        $campaigns = Campaign::all(); // Récupérer toutes les campagnes pour le champ select
        $nonPhysicalPrizes = Prize::where('type', 'non-physique')->where('campaign_id', $automation->campaign_id)->get();

        return view('automations.edit', compact('automation', 'campaigns', 'nonPhysicalPrizes'));
    }
    public function nonPhysicalWinner($id)
    {
        // Récupérer l'automatisation spécifique
        //$automation = Automation::findOrFail($id);

        // Récupérer uniquement les gagnants liés à cette automatisation et ayant des prix de type "non-physique"
        //$winners = Winner::where('automation_id', $id)->whereHas('prize', function ($query) {
         //   $query->where('type', 'non-physique'); // Filtre pour les prix de type "non-physique"
        //})->get();

        $winners = Winner::where('automation_id', $id)
            ->get();


        // Retourner la vue avec les gagnants spécifiques à cette automatisation
       // return view('automations.winner', compact('winners', 'automation'));
        return view('automations.winner', compact('winners', 'winners'));
    }


    public function stop($id)
    {
        $automation = Automation::find($id);

        if ($automation) {
            $automation->is_stopped = !$automation->is_stopped;
            $automation->save();

            return redirect()->route('automations.index')->with('success', 'Automatisation mise à jour avec succès.');
        } else {
            return redirect()->route('automations.index')->with('error', 'Automatisation introuvable.');
        }
    }

    public function getPrizesForCampaign($campaignId)
    {
        $prizes = Prize::where('campaign_id', $campaignId)->where('type', 'non-physique')->get();

        return response()->json($prizes);
    }
}

