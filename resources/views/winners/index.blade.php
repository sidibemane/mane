@extends('partials.template')

@section('content')

    <div class="container">

        @if(session('phone') && session('prize_id'))
            <div class="alert alert-success">
                <strong>Le gagnant a été enregistré :</strong>
                Numéro de Téléphone: {{ session('phone') }}<br>
                ID du Prix: {{ session('prize_id') }}
            </div>
        @endif

        <form method="GET" action="{{ route('winners.index') }}">
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="campaign_id" class="form-label">Filter by Campaign</label>
                    <select id="campaign_id" name="campaign_id" class="form-select">
                        <option value="">Select a Campaign</option>
                        @foreach($campaigns as $campaign)
                            <option value="{{ $campaign->id }}" {{ request('campaign_id') == $campaign->id ? 'selected' : '' }}>
                                {{ $campaign->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="prize_id" class="form-label">Filter by Prize</label>
                    <select id="prize_id" name="prize_id" class="form-select">
                        <option value="">Select a Prize</option>
                        @foreach($prizes as $prize)
                            <option value="{{ $prize->id }}" {{ request('prize_id') == $prize->id ? 'selected' : '' }}>
                                {{ $prize->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="col-md-4 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary">Filtrer</button>
                </div>
            </div>
        </form>

        <style>
            body {
                position: relative;
            }

            body::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: #edf0f4 !important; /* Utilisation d'un fond blanc neutre */
                background-image: none !important;
                background-position: center center;
                background-repeat: no-repeat;
                filter: blur(8px);
                z-index: -1;
            }


        </style>

        <div class="table-container">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Phone</th>
                    <th>Campaign Name</th>
                    <th>Prize Name</th>
                    <th>Draw Date</th>
                </tr>
                </thead>
                <tbody>
                @foreach($winners as $winner)
                    <tr>
                        <td>{{ $winner->id }}</td>
                        <td>{{ $winner->phone }}</td>
                        <td>{{ $winner->campaign->name }}</td>
                        <td>{{ $winner->prize->name }}</td>
                        <td>{{ $winner->created_at }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
