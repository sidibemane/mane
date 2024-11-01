<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddArchivedToPrizesTable extends Migration
{
    public function up()
    {
        Schema::table('prizes', function (Blueprint $table) {
            $table->boolean('archived')->default(false); // Ajoutez cette ligne
        });
    }

    public function down()
    {
        Schema::table('prizes', function (Blueprint $table) {
            $table->dropColumn('archived');
        });
    }
}
