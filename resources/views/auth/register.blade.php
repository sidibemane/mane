@extends('partials.template')

@section('content')
    <div class="page-container">
<div class="form-wrapper">
    <form action="{{ route('register') }}" method="POST" class="register-form">
        @csrf

        <div class="form-group">
            <h5 class="register-title" style="margin-bottom: 20px;">REGISTRATION</h5>
        </div>
        <div class="form-group">
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
            @error('username')
            <div class="error">{{ $message }}</div>
            @enderror
            <div class="input-wrapper">

                <i class="fas fa-eye eye-icon eye-icon-password" onclick="togglePasswordVisibility('password', '.eye-icon-password')"></i>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            @error('password')
            <div class="error">{{ $message }}</div>
            @enderror
        </div>

        <div class="form-group">
            <div class="input-wrapper">
                <i class="fas fa-eye eye-icon eye-icon-confirm" onclick="togglePasswordVisibility('password_confirmation', '.eye-icon-confirm')"></i>
                <input type="password" id="password_confirmation" name="password_confirmation" placeholder="Confirm your password" required>
            </div>
            @error('password_confirmation')
            <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <div class="form-group">
            <div class="select-container">
                <select id="role" name="role" required>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
            </div>
            @error('role')
            <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <button type="submit" class="register-btn">Register</button>

    </form>
</div>
    </div>

@endsection

    @section('script-head')
    <script>
        function togglePasswordVisibility(fieldId, iconClass) {
            const passwordField = document.getElementById(fieldId);
            const eyeIcon = document.querySelector(iconClass);
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            eyeIcon.classList.toggle('fa-eye');
            eyeIcon.classList.toggle('fa-eye-slash');classList.toggle('fa-eye-slash');
        }

    </script>
    @endsection
