<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('tickets', function (Blueprint $table) {
            // Vérifier si la colonne 'phone' n'existe pas déjà avant de l'ajouter
            if (!Schema::hasColumn('tickets', 'phone')) {
                $table->string('phone')->after('updated_at'); // Assurez-vous que 'phone' est ajouté après la colonne souhaitée
            }
            // Vérifier si la colonne 'campaign_id' n'existe pas déjà avant de l'ajouter
            if (!Schema::hasColumn('tickets', 'campaign_id')) {
                $table->unsignedBigInteger('campaign_id')->after('phone'); // Assurez-vous que 'campaign_id' est ajouté après 'phone'
            }
        });
    }

    public function down()
    {
        Schema::table('tickets', function (Blueprint $table) {
            // Supprimer la colonne 'phone' si elle existe
            if (Schema::hasColumn('tickets', 'phone')) {
                $table->dropColumn('phone');
            }
            // Supprimer la colonne 'campaign_id' si elle existe
            if (Schema::hasColumn('tickets', 'campaign_id')) {
                $table->dropColumn('campaign_id');
            }
        });
    }
};
