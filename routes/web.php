<?php

use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CampaignController;
use App\Http\Controllers\PrizeController;
use App\Http\Controllers\DrawController;
use App\Http\Controllers\WinnerController;
use App\Http\Controllers\AutomationController;
use App\Models\Campaign;
use Illuminate\Http\Request;
use App\Console\RunDraws;


// Routes d'authentification
Route::get('/register', [RegisterController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [RegisterController::class, 'register']);
Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');



// Routes de campagnes et tableau de bord
Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', [CampaignController::class, 'index'])->name('dashboard');
    Route::get('/template', [CampaignController::class, 'template'])->name('template');
    Route::get('/campaigns/create', [CampaignController::class, 'create'])->name('campaigns.create');
    Route::post('/campaigns/store', [CampaignController::class, 'store'])->name('campaigns.store');
    Route::get('/campaigns', [CampaignController::class, 'index'])->name('campaigns.index');
    Route::get('/campaigns/{id}/edit', [CampaignController::class, 'edit'])->name('campaigns.edit');
    Route::put('/campaigns/{id}', [CampaignController::class, 'update'])->name('campaigns.update');
    Route::post('/campaigns/{id}/archive', [CampaignController::class, 'archive'])->name('campaigns.archive');
    Route::get('/campaigns/archived', [CampaignController::class, 'archivedCampaigns'])->name('campaigns.archived');
    Route::put('/campaigns/{id}/restore', [CampaignController::class, 'restore'])->name('campaigns.restore');
    Route::get('/prizes', [PrizeController::class, 'index'])->name('prizes.index');
    Route::get('/prizes/create', [PrizeController::class, 'create'])->name('prizes.create');
    Route::post('/prizes', [PrizeController::class, 'store'])->name('prizes.store');
    // Route pour afficher les prix archivés
    Route::get('/prizes/archived', [PrizeController::class, 'archivedPrizes'])->name('prizes.archived');
    Route::put('/prizes/{id}/restore', [PrizeController::class, 'restore'])->name('prizes.restore');
    Route::post('/prizes/{id}/archive', [PrizeController::class, 'archive'])->name('prizes.archive');
    Route::get('/prizes/{id}/edit', [PrizeController::class, 'edit'])->name('prizes.edit');
    Route::put('/prizes/{id}', [PrizeController::class, 'update'])->name('prizes.update');
// Affiche le formulaire pour sélectionner une campagne et un prix, et pour lancer le tirage
    Route::get('/draw', [DrawController::class, 'create'])->name('draw.create');
// Gère la soumission du formulaire de tirage, sélectionne un gagnant et enregistre les résultats
    Route::post('/draw', [DrawController::class, 'perform'])->name('draw.perform');

// Route pour afficher la page principale du tirage
    Route::get('/draw', [DrawController::class, 'create'])->name('draw.create');

    Route::get('/campaigns/{campaignId}/phones', [DrawController::class, 'getPhonesForCampaign']);
    Route::get('/campaigns/{campaignId}/prizes', [CampaignController::class, 'getPrizes']);


    Route::get('/winners', [WinnerController::class, 'index'])->name('winners.index');
    Route::post('/save-winner', [WinnerController::class, 'saveWinner'])->name('save-winner');


    Route::get('/search-campaigns', [CampaignController::class, 'searchCampaigns'])->name('campaigns.search');



    Route::get('/campaigns/{id}', 'CampaignController@show')->name('campaigns.show');
    Route::get('/campaigns/{id}', [App\Http\Controllers\CampaignController::class, 'show'])->name('campaigns.show');

        Route::get('/automations', [AutomationController::class, 'index'])->name('automations.index');
        Route::get('/automations/create', [AutomationController::class, 'create'])->name('automations.create');
        Route::post('/automations', [AutomationController::class, 'store'])->name('automations.store');

        Route::get('/automations/{automation}/winners', [AutomationController::class, 'showWinners'])->name('automations.winners');
        Route::get('/get-prizes/{campaign_id}', [PrizeController::class, 'getPrizes']);
        Route::get('/campaigns/{campaignId}/prizes', [CampaignController::class, 'getNonPhysicalPrizes']);
        Route::get('/campaigns/{campaign}/prizes', [CampaignController::class, 'getNonPhysicalPrizes']);
        Route::get('/campaigns/{campaignId}/winners', [AutomationController::class, 'showWinners'])->name('automations.showWinners');
    Route::get('/campaigns/{id}/prizes', [CampaignController::class, 'getPhysicalPrizes']); // Pour les lots physiques
    Route::get('/campaigns/{id}/non-physical-prizes', [CampaignController::class, 'getNonPhysicalPrizes']); // Pour les lots non physiques
    Route::get('/campaigns/{campaign}/physical-prizes', [CampaignController::class, 'getPhysicalPrizes']);

        Route::get('/automation/winner', [AutomationController::class, 'showWinners']);
        Route::get('/automations/{automation}/winner', [AutomationController::class, 'showNonPhysicalWinners'])->name('automations.winner');
        Route::get('/automations/{automation}/non-physical-winners', [AutomationController::class, 'showNonPhysicalWinners'])->name('automations.nonPhysicalWinner');

        Route::get('/campaigns/{id}/details', [CampaignController::class, 'getCampaignDetails']);
        Route::get('/automations/{id}/edit', [AutomationController::class, 'edit'])->name('automations.edit');
        Route::patch('/automations/{id}/stop', [AutomationController::class, 'stop'])->name('automations.stop');


        Route::get('/automations/prizes/{campaign}', [AutomationController::class, 'getPrizesForCampaign']);
        Route::get('/prizes/campaign/{campaign_id}', [PrizeController::class, 'getPrizes'])->name('prizes.getPrizes');
    });

// Route par défaut (redirection vers la page de login)
Route::redirect('/', '/login');
