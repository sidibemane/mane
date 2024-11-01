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
        Schema::table('winners', function (Blueprint $table) {
            $table->unsignedBigInteger('automation_id')->nullable()->after('prize_id'); // Ajoute la colonne automation_id
            $table->foreign('automation_id')->references('id')->on('automations')->onDelete('cascade'); // Assure la liaison avec la table automatisations
        });
    }

    public function down()
    {
        Schema::table('winners', function (Blueprint $table) {
            $table->dropForeign(['automation_id']);
            $table->dropColumn('automation_id');
        });
    }

};
