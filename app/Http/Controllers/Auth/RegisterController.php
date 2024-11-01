<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class RegisterController extends Controller
{
    public function showRegistrationForm()
    {
        return view('auth.register');
    }

    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required|string|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'role' => 'required|string|in:admin,user',
        ]);

        $role = Role::where('name', $request->role)->first();
        if (!$role) {
            return back()->withErrors(['role' => 'Le rôle sélectionné est invalide.']);
        }

        $user = User::create([
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'role_id' => $role->id,
        ]);

        Auth::login($user);

        return redirect()->route('dashboard');
    }
}
