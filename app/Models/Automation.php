<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Automation extends Model
{
    use HasFactory;

    protected $fillable = [
        'campaign_id',
        'prize_id',
        'frequency',
        'number_of_winners',
        'status',
    ];

    public function campaign()
    {
        return $this->belongsTo(Campaign::class);
    }

    public function prize()
    {
        return $this->belongsTo(Prize::class);
    }
}

