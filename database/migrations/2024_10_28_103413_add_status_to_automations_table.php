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
        Schema::table('automations', function (Blueprint $table) {
            // Vérifiez si la colonne 'status' n'existe pas avant de l'ajouter
            if (!Schema::hasColumn('automations', 'status')) {
                $table->string('status')->after('prize_id'); // Ajustez la position selon vos besoins
            }
        });
    }


    public function down()
    {
        Schema::table('automations', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }

};
