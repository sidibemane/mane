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





    // Affiche le formulaire de création d'une automatisation
    // AutomationController.php

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
        $winners = Winner::where('automation_id', $automationId)->get(); // Adaptez la condition en fonction de votre structure
        return view('winners.index', compact('winners'));
    }

    public function showNonPhysicalWinners($automationId)
    {
        // Récupérer les gagnants des lots non physiques pour l'automatisation spécifique
        $winners = Winner::where('automation_id', $automationId)
            ->whereHas('prize', function($query) {
                $query->where('type', 'non-physique'); // Assurez-vous que 'non-physique' est le bon type
            })
            ->with(['campaign', 'prize'])
            ->get();

        // Retourner la vue correcte
        return view('automations.winner', compact('winners')); // Utilisez 'winner' ici
    }


    public function edit($id)
    {
        $automation = Automation::findOrFail($id);
        // Charger les données nécessaires (comme les campagnes ou les lots disponibles)
        return view('automations.edit', compact('automation'));
    }
    public function stop($id)
    {
        $automation = Automation::findOrFail($id);
        $automation->status = 'Arrêté'; // Par exemple, définissez le statut sur "Arrêté"
        $automation->save();

        return redirect()->route('automations.index')->with('success', 'Automatisation arrêtée avec succès.');
    }



    public function getPrizesForCampaign($campaignId)
    {
        $prizes = Prize::where('campaign_id', $campaignId)->where('type', 'non-physique')->get();

        return response()->json($prizes);
    }

    // Affiche les gagnants de l'automatisation
    public function winners(Automation $automation)
    {
        // Logique pour afficher les gagnants de l'automatisation
    }
}
