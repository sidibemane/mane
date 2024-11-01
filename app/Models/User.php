<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Models\Role; // Ajoutez ceci


class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'username',
        'password',
        'role_id',
    ];

    protected $with = ['role']; // Charge toujours la relation `role`

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function role()
    {
        return $this->belongsTo(Role::class, 'role_id'); // Vérifiez que 'role_id' est correct
    }


    // Ajoutez cette méthode pour utiliser `username` comme identifiant
    public function getAuthIdentifierName()
    {
        return 'username';
    }
}
