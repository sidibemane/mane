<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTypeToPrizesTable extends Migration
{
    public function up()
    {
        // Ajouter la colonne 'type' si elle n'existe pas déjà
        if (!Schema::hasColumn('prizes', 'type')) {
            Schema::table('prizes', function (Blueprint $table) {
                $table->string('type')->after('name'); // Positionner la colonne après 'name' (optionnel)
            });
        }
    }

    public function down()
    {
        Schema::table('prizes', function (Blueprint $table) {
            // Supprimer la colonne 'type' si elle existe
            if (Schema::hasColumn('prizes', 'type')) {
                $table->dropColumn('type');
            }
        });
    }
}
