<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventTicket extends Model
{
    protected $table = 'tickets'; // Utilisez le nom de la table existante
    protected $fillable = ['phone', 'campaign_id'];
}
