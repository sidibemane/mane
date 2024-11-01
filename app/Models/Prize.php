<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Prize extends Model
{
    protected $fillable = ['name', 'type', 'campaign_id', 'archived'];

    /**
     * Get the campaign that owns the prize.
     */
    public function campaign()
    {
        return $this->belongsTo(Campaign::class);
    }

    /**
     * Get the winners for the prize.
     */
    public function winner()
    {
        return $this->hasOne(Winner::class);
    }

}
