<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>

        svg {
            display: block;
            margin: 0 auto;
        }

        .curved-text {
            font-size: 120px; /* Augmenter la taille selon vos besoins */
            font-weight: bold;
            fill: #eccd1c; /* Changez ici la couleur en noir */
        }



    </style>
</head>
<body>

<form action="{{ route('login') }}" method="POST">

    @csrf
    <div class="login-container">
        <svg width="100%" height="150" viewBox="0 0 500 200" style="display: block; margin: 0 auto;">
            <defs>
                <linearGradient id="gradient" gradientUnits="userSpaceOnUse">
                    <stop offset="0%" stop-color="red" />
                    <stop offset="100%" stop-color="blue" />
                </linearGradient>
            </defs>
            <path id="curve" fill="transparent" d="M50,150 Q250,0 450,150" />
            <text width="500">
                <textPath href="#curve" class="curved-text" style="font-family: 'Curlz MT', cursive; font-size: 105px; fill: #cf332d;" text-anchor="middle" startOffset="50%">
                    TOMBOLA
                </textPath>

            </text>
        </svg>
        <div class="image-container" style="text-align: center; margin: -20px 0 19px 0;"> <!-- Ajustez la marge ici -->
            <img src="{{ asset('images/cad1.PNG') }}" alt="cad1.PNG" style="width: 140px; height: auto;">
        </div>


        <div class="logo-container" style="margin: 18px 0;"> <!-- Ajout de la marge ici -->
            <img src="{{ asset('images/logo.png') }}" alt="Logo" class="logo">
        </div>

        <!-- Affichage des erreurs -->
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        @csrf
        <div class="form-group">
            <input type="text" id="username" name="username" placeholder="Username" required>
            @error('username')
            <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <div class="form-group">
            <input type="password" id="password" name="password" placeholder="Password" required>
            <i class="fas fa-eye eye-icon" onclick="togglePasswordVisibility()"></i>
            @error('password')

            <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <button type="submit">Login</button>
    </div>
    <p>Don't have an account? <a href="{{ route('register') }}">Register here</a></p>
</form>

<script>
    function togglePasswordVisibility() {
        const passwordField = document.getElementById('password');
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);
        const eyeIcon = document.querySelector('.eye-icon');
        eyeIcon.classList.toggle('fa-eye');
        eyeIcon.classList.toggle('fa-eye-slash');
    }
</script>
</body>
</html>
