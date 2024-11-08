@extends('partials.template')

@section('content')
    <div class="container">
        <h1 class="register-title">Liste des Gagnants (Lots Non Physiques)</h1>

        @if($winners->isEmpty())
            <p>Aucun gagnant trouvé pour les lots non physiques.</p>
        @else
            <table class="table">
                <thead>
                <tr>
                    <th>Numéro Gagnant</th>
                    <th>Campagne</th>
                    <th>Lot</th>
                    <th>Date du Tirage</th>
                </tr>
                </thead>
                <tbody>
                @foreach($winners as $winner)
                    <tr>
                        <td>{{ $winner->phone }}</td>
                        <td>{{ $winner->campaign->name ?? 'Non spécifiée' }}</td>
                        <td>{{ $winner->prize->name ?? 'Non spécifié' }}</td>
                        <td>{{ $winner->created_at->format('d/m/Y') }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        @endif
    </div>
@endsection
