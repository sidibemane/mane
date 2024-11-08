@extends('partials.template')

@section('content')
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="container">

        <form action="{{ route('automations.update', $automation->id) }}" method="POST">
            @csrf
            @method('PUT') <!-- Spécifie que cette requête est une mise à jour -->

            <div class="form-group">
                <label for="campaign_id">Sélectionner une campagne</label>
                <select id="campaignSelect" name="campaign_id" onchange="fetchNonPhysicalPrizes(this.value)">
                    @foreach($campaigns as $campaign)
                        <option value="{{ $campaign->id }}" {{ $automation->campaign_id == $campaign->id ? 'selected' : '' }}>
                            {{ $campaign->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="status">Statut de la campagne</label>
                <select id="status" name="status" class="form-control" required>
                    <option value="À venir" {{ $automation->status == 'À venir' ? 'selected' : '' }}>À venir</option>
                    <option value="En cours" {{ $automation->status == 'En cours' ? 'selected' : '' }}>En cours</option>
                    <option value="Terminé" {{ $automation->status == 'Terminé' ? 'selected' : '' }}>Terminé</option>
                </select>
            </div>

            <div class="form-group">
                <label for="prize_id">Sélectionner un prix (non-physique)</label>
                <select name="prize_id" id="prize" class="form-control" required>
                    <!-- Les options seront remplies dynamiquement ici -->
                    @foreach($nonPhysicalPrizes as $prize)
                        <option value="{{ $prize->id }}" {{ $automation->prize_id == $prize->id ? 'selected' : '' }}>
                            {{ $prize->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="frequency">Fréquence</label>
                <select name="frequency" class="form-control" required>
                    <option value="every-30-minutes" {{ $automation->frequency == 'every-30-minutes' ? 'selected' : '' }}>Chaque 30 minutes</option>
                    <option value="hourly" {{ $automation->frequency == 'hourly' ? 'selected' : '' }}>Chaque heure</option>
                    <option value="daily" {{ $automation->frequency == 'daily' ? 'selected' : '' }}>Chaque jour</option>
                    <option value="every-2-days" {{ $automation->frequency == 'every-2-days' ? 'selected' : '' }}>Chaque deux jours</option>
                    <option value="weekly" {{ $automation->frequency == 'weekly' ? 'selected' : '' }}>Chaque semaine</option>
                    <option value="bi-weekly" {{ $automation->frequency == 'bi-weekly' ? 'selected' : '' }}>Chaque deux semaines</option>
                    <option value="tri-weekly" {{ $automation->frequency == 'tri-weekly' ? 'selected' : '' }}>Chaque trois semaines</option>
                    <option value="monthly" {{ $automation->frequency == 'monthly' ? 'selected' : '' }}>Chaque mois</option>
                </select>
            </div>

            <div class="form-group">
                <label for="number_of_winners">Nombre de gagnants</label>
                <input type="number" name="number_of_winners" class="form-control" value="{{ $automation->number_of_winners }}" required>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
@endsection

@section('custom-scripts')
    <script>
        function fetchNonPhysicalPrizes(campaignId) {
            fetch(`/campaigns/${campaignId}/non-physical-prizes`)
                .then(response => response.json())
                .then(prizes => {
                    let prizeSelect = document.getElementById('prize');
                    prizeSelect.innerHTML = ''; // Réinitialise la liste
                    prizes.forEach(prize => {
                        let selected = prize.id == "{{ $automation->prize_id }}" ? 'selected' : '';
                        prizeSelect.innerHTML += `<option value="${prize.id}" ${selected}>${prize.name}</option>`;
                    });
                })
                .catch(error => {
                    console.error('Erreur lors du chargement des prix non physiques:', error);
                });
        }

        // Appeler la fonction pour charger les prix non-physiques pour la campagne sélectionnée
        document.addEventListener("DOMContentLoaded", function() {
            fetchNonPhysicalPrizes({{ $automation->campaign_id }});
        });
    </script>
@endsection
