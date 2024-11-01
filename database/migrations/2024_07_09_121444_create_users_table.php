<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        if (!Schema::hasTable('users')) {
            Schema::create('users', function (Blueprint $table) {
                $table->id();
                $table->string('username')->unique();
                $table->string('password');
                $table->foreignId('role_id')->constrained('roles');
                $table->rememberToken();
                $table->timestamps();
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('users');
    }
};
