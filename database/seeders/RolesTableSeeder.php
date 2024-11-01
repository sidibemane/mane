<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Role;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Role::create(['name' => 'admin', 'description' => 'Administrator']);
        Role::create(['name' => 'user', 'description' => 'Regular user']);
    }
}

