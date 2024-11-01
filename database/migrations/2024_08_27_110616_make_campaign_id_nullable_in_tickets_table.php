<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class MakeCampaignIdNullableInTicketsTable extends Migration
{
    public function up()
    {
        Schema::table('tickets', function (Blueprint $table) {
            $table->unsignedBigInteger('campaign_id')->nullable()->change();
        });
    }

    public function down()
    {
        Schema::table('tickets', function (Blueprint $table) {
            $table->unsignedBigInteger('campaign_id')->nullable(false)->change();
        });
    }
}
