@extends('partials.template')

@section('content')
    <div class="container">

        <!-- Message de succès -->
        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        <div style="text-align: center;">
            <a href="{{ route('automations.create') }}" class="btn" style="width: 200px !important; background-color: #333333 !important; color: white !important; display: inline-block !important;">
                Create Automation
            </a>
        </div>

        <!-- Liste des automatisations -->
        @if($automations->isEmpty())
            <p>Aucune automatisation créée pour l'instant.</p>
        @else
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Campagne</th>
                    <th>Date de début</th>
                    <th>Date de fin</th>
                    <th>Statut</th>
                    <th>Lot</th>
                    <th>Fréquence</th>
                    <th>Nombre de Gagnants</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                @foreach($automations as $automation)
                    <tr>
                        <td>{{ $automation->campaign->name }}</td>
                        <td>{{ $automation->campaign->start_date }}</td>
                        <td>{{ $automation->campaign->end_date }}</td>
                        <td>{{ $automation->status }}</td> <!-- Affichage du statut défini manuellement -->
                        <td>{{ $automation->prize->name }}</td>
                        <td>{{ ucfirst($automation->frequency) }}</td>
                        <td>{{ $automation->number_of_winners }}</td>
                        <td>
                            <!-- Bouton Consulter avec une marge droite augmentée -->
                            <a href="{{ route('automations.nonPhysicalWinner', $automation->id) }}" class="btn btn-success" style="margin-right: 20px;">
                                Consulter
                            </a>

                            <!-- Bouton Modifier sans marge pour coller au bouton Stop -->
                            <a href="{{ route('automations.edit', $automation->id) }}" class="btn btn-warning" title="Modifier" style="width: 57px; height: 38px;">
                                <i class="fas fa-edit"></i> <!-- Icône de modification -->
                            </a>

                            <!-- Bouton Stop avec affichage en ligne, sans marge pour coller au bouton Modifier -->
                            <form action="{{ route('automations.stop', $automation->id) }}" method="POST" style="display: inline-block; margin-left: 0;">
                                @csrf
                                @method('PATCH')
                                <button type="submit" class="btn {{ $automation->is_stopped ? 'btn-stopped' : 'btn-danger' }}" onclick="return confirm('Êtes-vous sûr de vouloir {{ $automation->is_stopped ? 'reprendre' : 'arrêter' }} cette automatisation ?');" title="{{ $automation->is_stopped ? 'Reprendre l’automatisation' : 'Arrêter l’automatisation' }}" style="width: 55px; height: 40px;">
                                    <i class="fas {{ $automation->is_stopped ? 'fa-play' : 'fa-pause' }}"></i>
                                </button>
                            </form>

                        </td>

                    </tr>
                @endforeach
                </tbody>
            </table>
        @endif
    </div>
@endsection

