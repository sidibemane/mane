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
        <h1>Create Automation</h1>

        <form action="{{ route('automations.store') }}" method="POST">
            @csrf
            <div class="form-group">
                <label for="campaign_id">Select a Campaign</label>
                <select id="campaignSelect" name="campaign_id" onchange="fetchNonPhysicalPrizes(this.value)">
                    @foreach($campaigns as $campaign)
                        <option value="{{ $campaign->id }}">{{ $campaign->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="status">Statut de la campagne</label>
                <select id="status" name="status" class="form-control" required>
                    <option value="À venir">À venir</option>
                    <option value="En cours">En cours</option>
                    <option value="Terminé">Terminé</option>
                </select>
            </div>

            <div class="form-group">
                <label for="prize_id">Select a prize (non-physique)</label>
                <select name="prize_id" id="prize" class="form-control" required>
                    <!-- Les options seront remplies dynamiquement ici -->
                </select>
            </div>

            <div class="form-group">
                <label for="frequency">Fréquence</label>
                <select name="frequency" class="form-control" required>
                    <option value="every-30-minutes">Chaque 30 minutes</option>
                    <option value="hourly">Chaque heure</option> <!-- Fréquence horaire -->
                    <option value="daily">Chaque jour</option>
                    <option value="every-2-days">Chaque deux jours</option>
                    <option value="weekly">Chaque semaine</option>
                    <option value="bi-weekly">Chaque deux semaines</option>
                    <option value="tri-weekly">Chaque trois semaines</option>
                    <option value="monthly">Chaque mois</option>
                </select>
            </div>


            <div class="form-group">
                <label for="number_of_winners">Nombre de gagnants</label>
                <input type="number" name="number_of_winners" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary">Create Automation</button>
        </form>
    </div>
@endsection

@section('custom-scripts')
    <script>
        function fetchNonPhysicalPrizes(campaignId) {
            fetch(`/campaigns/${campaignId}/non-physical-prizes`) // Assurez-vous que l'URL est correcte
                .then(response => response.json())
                .then(prizes => {
                    let prizeSelect = document.getElementById('prize');
                    prizeSelect.innerHTML = ''; // Réinitialise la liste
                    prizes.forEach(prize => {
                        prizeSelect.innerHTML += `<option value="${prize.id}">${prize.name}</option>`;
                    });
                })
                .catch(error => {
                    console.error('Erreur lors du chargement des prix non physiques:', error);
                });
        }
    </script>
@endsection
