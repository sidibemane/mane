<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddIsStoppedToAutomationsTable extends Migration
{
    public function up()
    {
        Schema::table('automations', function (Blueprint $table) {
            $table->boolean('is_stopped')->default(false);
        });
    }


    public function down()
    {
        Schema::table('automations', function (Blueprint $table) {
            $table->dropColumn('is_stopped');
        });
    }
}
