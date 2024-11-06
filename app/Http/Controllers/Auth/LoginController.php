<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        if (Auth::check()) {
            return redirect()->route('dashboard'); // Assurez-vous que cette route existe
        }
        return view('auth.login');
    }

    public function login(Request $request)
    {
        // Validation des données d'entrée
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        // Récupération des informations d'identification
        $credentials = $request->only('username', 'password');

        // Tentative de connexion
        if (Auth::attempt($credentials)) {
            // Charger la relation `role` de l'utilisateur
            $user = Auth::user()->load('role');

            // Vérifiez les données utilisateur pour débogage
            \Log::info('Utilisateur connecté: ', ['username' => $user->username, 'role' => $user->role->name]);

            // Vérifier le rôle de l'utilisateur
            if ($user->role && $user->role->name !== 'admin') {
                Auth::logout(); // Déconnexion si ce n'est pas un administrateur
                return redirect('/login')->withErrors(['Vous n\'avez pas accès à la zone administrateur.']);
            }

            // Redirection vers la route 'template' après connexion réussie
            return redirect('template'); // Changez intended par 'template'
        }

        // Si la connexion échoue, renvoyer un message d'erreur
        return back()->withErrors([
            'username' => 'Les informations d\'identification fournies ne correspondent pas à nos enregistrements.',
        ]);
    }


    public function logout(Request $request)
    {
        Auth::logout(); // Déconnexion de l'utilisateur
        return redirect('/login'); // Redirection vers la page de connexion
    }
}
