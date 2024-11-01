<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->id();
            $table->string('phone');
            $table->unsignedBigInteger('campaign_id');
            $table->timestamps();
            // Ajoutez des clés étrangères si nécessaire
            // $table->foreign('campaign_id')->references('id')->on('campaigns');
        });
    }

    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
