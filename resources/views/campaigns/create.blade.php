@extends('partials.template')

@section('content')

    <div class="row">
        <div class="col-md-7 offset-2">
            <div class="card card-plain">
                <div class="card-header">
                    @if(session('success'))
                        <div class="alert alert-success">
                            {{ session('success') }}
                        </div>
                    @endif
                    <h4 class="register-title">Enter the elements of this campaign</h4>
                    <form id="campaign-form" method="POST" action="{{ route('campaigns.store') }}">
                        @csrf

                        <!-- Name Input -->
                        <div class="form-group">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                        </div>

                        <!-- Description Input -->
                        <div class="form-group">
                            <input type="text" class="form-control" id="description" name="description" placeholder="Description" required>
                        </div>

                        <!-- Start Date Input -->
                        <div class="form-group">
                            <input type="date" class="form-control" id="start_date" name="start_date" placeholder="Start_date" required>
                        </div>

                        <!-- End Date Input -->
                        <div class="form-group">
                            <input type="date" class="form-control" id="end_date" name="end_date" placeholder="End_date" required>
                        </div>

                        <!-- Submit Button -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-lg bg-gradient-success btn-lg w-50">Create Campaign</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

<style>
    /* Ensure the label floats correctly */
    .form-group {
        position: relative;
        margin-bottom: 2rem;
    }

    .form-label {
        position: absolute;
        top: 0;
        left: 0;
        padding: 0 5px;
        font-size: 1rem;
        color: #666;
        background: white;
        pointer-events: none;
        transition: 0.3s ease all;
        transform-origin: left top;
    }

    .form-control {
        width: 100%;
        padding: 0.75rem 1rem;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    /* Label floats up when input is focused or has value */
    .form-control:focus + .form-label,
    .form-control:not(:placeholder-shown) + .form-label {
        transform: translateY(-1.5rem);
        font-size: 0.85rem;
        color: #333;
    }

    /* For date fields */
    .form-control[type="date"] {
        line-height: 1.5;
    }

    /* Optional styling for better visibility */
    .form-control:focus {
        outline: none;
        border-color: #cf332d;
        box-shadow: 0 0 5px rgba(207, 51, 45, 0.5);
    }
</style>

<script>
    // Ensures the label moves up for pre-filled fields when page loads (for validation errors etc.)
    document.addEventListener('DOMContentLoaded', function () {
        const inputs = document.querySelectorAll('.form-control');
        inputs.forEach(input => {
            if (input.value !== '') {
                input.classList.add('is-filled');
            }
        });
    });
</script>

