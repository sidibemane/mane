<?php
namespace App\Http\Controllers;

use App\Models\Campaign;
use App\Models\Prize;
use Illuminate\Http\Request;
use App\Models\Winner;
use Illuminate\Support\Facades\Auth;

class CampaignController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $search = $request->get('search');
            $campaigns = Campaign::query()
                ->where('archived', false) // Exclude archived campaigns
                ->where(function($query) use ($search) {
                    $query->where('name', 'LIKE', "%{$search}%")
                        ->orWhere('description', 'LIKE', "%{$search}%");
                })
                ->get();

            return response()->json([
                'success' => true,
                'html' => view('campaigns.partials.campaigns_list', compact('campaigns'))->render()
            ]);
        }

        // Non-AJAX request
        $campaigns = Campaign::where('archived', false)->get();
        return view('campaigns.dashboard', compact('campaigns'));
    }
    public function getPhysicalPrizes($campaignId)
    {
        $prizes = Prize::where('campaign_id', $campaignId)->get();
        return response()->json($prizes);
    }

    public function getNonPhysicalPrizes($campaignId)
    {
        $prizes = Prize::where('campaign_id', $campaignId)
            ->where('type', 'Non_Physique') // Assurez-vous d'utiliser le bon nom pour le type
            ->get();

        return response()->json($prizes);
    }

    public function template(Request $request)
    {
       $totalPrize =  Prize::count();
       $totalCampaign =  Campaign::count();
       $totalWinner =  Winner::count();

        $moisAbreviations = [1 => 'Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Jui', 'Juil', 'Aoû', 'Sep', 'Oct', 'Nov', 'Dec'];


        $campagnesParMois = Campaign::selectRaw('MONTH(created_at) as mois, COUNT(*) as nombre_de_campagnes')
            ->groupBy('mois')
            ->orderBy('mois', 'asc')
            ->get();

        $prizeParMois = Prize::selectRaw('MONTH(created_at) as mois, COUNT(*) as nombre_de_prize')
            ->groupBy('mois')
            ->orderBy('mois', 'asc')
            ->get();

        $winnersParMois = Winner::selectRaw('MONTH(created_at) as mois, COUNT(*) as nombre_de_winner')
            ->groupBy('mois')
            ->orderBy('mois', 'asc')
            ->get();


        $moisCampagnes = [];
        $nombreCampagnes = [];

        $moisPrize = [];
        $nombrePrize = [];

        $moisWinner = [];
        $nombreWinner = [];


        foreach ($campagnesParMois as $row) {
            $moisCampagnes[] = $moisAbreviations[$row->mois];
            $nombreCampagnes[] = $row->nombre_de_campagnes;
        }
        $moisCampagnes = array_map("strval", $moisCampagnes);

        foreach ($prizeParMois as $row) {
            $moisPrize[] = $moisAbreviations[$row->mois];
            $nombrePrize[] = $row->nombre_de_prize;
        }
        $moisPrize = array_map("strval", $moisPrize);

        foreach ($winnersParMois as $row) {
            $moisWinner[] = $moisAbreviations[$row->mois];
            $nombreWinner[] = $row->nombre_de_winner;
        }
        $moisWinner = array_map("strval", $moisWinner);

        return view('pages.dashboadtest', compact(
            'totalPrize', 'totalCampaign' , 'totalWinner',
            'moisCampagnes', 'nombreCampagnes',
            'moisWinner', 'nombreWinner',
            'moisPrize', 'nombrePrize'
        ));
    }


    public function create()
    {
        return view('campaigns.create');
    }
    public function getCampaignDetails($id)
    {
        $campaign = Campaign::findOrFail($id);
        return response()->json([
            'start_date' => $campaign->start_date,
            'end_date' => $campaign->end_date,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:1000',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        Campaign::create([
            'name' => $request->input('name'),
            'description' => $request->input('description'),
            'start_date' => $request->input('start_date'),
            'end_date' => $request->input('end_date'),
        ]);

        return redirect()->route('campaigns.index')->with('success', 'Campaign created successfully!');
    }


    public function edit($id)
    {
        $campaign = Campaign::findOrFail($id);
        return view('campaigns.edit', compact('campaign'));
    }

    public function update(Request $request, $id)
    {
        $campaign = Campaign::findOrFail($id);
        $campaign->update($request->all());
        return redirect()->route('campaigns.index')->with('status', 'Campaign updated successfully!');
    }


    public function archive($id)
    {
        $campaign = Campaign::findOrFail($id);
        $campaign->archived = true;
        $campaign->save();

        return response()->json(['message' => 'Campaign archived successfully!']);
    }

    public function archivedCampaigns()
    {
        $campaigns = Campaign::where('archived', true)->get();
        return view('campaigns.archived', compact('campaigns'));
    }

    public function restore($id) {
        $campaign = Campaign::find($id);
        if ($campaign) {
            $campaign->archived = false;
            $campaign->save();
            return response()->json(['message' => 'Campagne restaurée avec succès !']);
        }
        return response()->json(['message' => 'Campagne introuvable'], 404);
    }


    public function searchCampaigns(Request $request)
    {
        $query = $request->get('query');
        $campaigns = Campaign::where('name', 'LIKE', "%{$query}%")->get();

        return response()->json($campaigns);
    }




    public function show($id)
    {
        $campaign = Campaign::findOrFail($id);
        return view('campaigns.show', compact('campaign'));
    }


}
