<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventTicketsTable extends Migration
{
    public function up()
    {
        Schema::table('tickets', function (Blueprint $table) {
            // Ajoutez les colonnes nécessaires ici
        });
    }

    public function down()
    {
        Schema::table('tickets', function (Blueprint $table) {
            // Supprimez les colonnes si nécessaire
        });
    }
}
