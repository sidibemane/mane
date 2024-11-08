<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('winners', function (Blueprint $table) {
            $table->integer('campaign_id');
            $table->integer('prize_id');
            $table->string('phone');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('winners', function (Blueprint $table) {
            $table->dropColumn('campaign_id');
            $table->dropColumn('prize_id');
            $table->dropColumn('phone');
        });    }
};
