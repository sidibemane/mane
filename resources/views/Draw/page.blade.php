@extends('partials.template')

@section('content')
    <div class="container">

        <form id="draw-form" action="{{ route('draw.perform') }}" method="POST">
            @csrf
            <div class="form-group">
                <label for="campaign">Select a Campaign</label>
                <select name="campaign_id" id="campaign" class="form-control" onchange="loadPrizes(this.value)">
                    @foreach($campaigns as $campaign)
                        <option value="{{ $campaign->id }}">{{ $campaign->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="prize">Select a Prize</label>
                <select name="prize_id" id="prize" class="form-control">
                    <!-- Les options seront remplies en fonction de la campagne sélectionnée -->
                </select>
            </div>

            <div id="draw-bar" class="draw-bar">
                <div id="number-display" class="number-display">000000000</div>
                <div class="party-icon left" style="display: none;">🎉</div>
                <div class="party-icon right" style="display: none;">🎉</div>
            </div>


            <button id="drawButton" type="button" class="btn btn-primary" onclick="startDraw()">TIRAGE</button>

            <button id="save-winner-btn" type="button" class="btn btn-success" onclick="saveWinner()" style="display:none;">Enregistrer</button>
        </form>
    </div>
@endsection
<style>
    body {
        position: relative; /* Nécessaire pour le positionnement du pseudo-élément */
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
        filter: blur(8px); /* Applique un effet de flou */
        z-index: -1; /* Place l'image floutée derrière le contenu */
    }



    .draw-bar {
        width: 100%;
        height: 50px;
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
        border: 2px solid #333;
    }
    .number-display {
        font-size: 24px;
        font-weight: bold;
    }
    .draw-button {
        background-color: black !important;
        color: white; /* Couleur du texte en blanc */
        border: none; /* Supprime la bordure */
        padding: 10px 20px; /* Espacement interne du bouton */
        font-size: 16px; /* Taille du texte */
        font-weight: bold; /* Texte en gras */
        border-radius: 5px; /* Coins arrondis */
        cursor: pointer; /* Curseur de la souris en pointeur */
        display: block; /* Affichage en bloc */
        margin: 20px auto; /* Centrer horizontalement */
        text-align: center !important; /* Centrer le texte */
    }
    /* Assure que le body a un positionnement relatif pour que les pseudo-éléments fonctionnent correctement */
    body {
        position: relative !important;
        margin: 0 !important;
        overflow: hidden !important; /* Évite que les éléments flous débordent */
        height: 100vh !important; /* Assure que le body couvre toute la hauteur de la fenêtre */
    }

    /* Pseudo-élément pour l'arrière-plan flou */
    body::before {
        content: "" !important;
        position: absolute !important;
        top: 0 !important;
        left: 0 !important;
        width: 100% !important;
        height: 100% !important;
        background-color: rgba(0, 0, 0, 0.5) !important; /* Couleur de fond avec transparence */
        filter: blur(8px) !important; /* Applique un effet de flou */
        z-index: -1 !important; /* Place l'arrière-plan flouté derrière le contenu */
    }

    /* Assure que le conteneur principal reste au-dessus du flou */
    .container {
        position: relative !important; /* Permet de positionner le contenu au-dessus de l'arrière-plan flouté */
        z-index: 1 !important; /* Place le conteneur au-dessus de l'arrière-plan flouté */
        padding: 20px !important;
        background-color: rgba(255, 255, 255, 0.5) !important; /* Fond légèrement opaque pour le formulaire */
        border-radius: 10px !important; /* Coins arrondis pour le formulaire */
    }

    .draw-button:hover {
        background-color: #333; /* Couleur légèrement plus claire au survol */
    }

</style>
@section('script-head')
    <script>
        let phones = [];
        let winningPhone = '';
        let selectedPrizeId = '';
        let selectedCampaignId = '';
        let drawInProgress = false;

        function loadPrizes(campaignId) {
            fetch(`/campaigns/${campaignId}/prizes`)
                .then(response => response.json())
                .then(prizes => {
                    let prizeSelect = document.getElementById('prize');
                    prizeSelect.innerHTML = '';
                    prizes.forEach(prize => {
                        prizeSelect.innerHTML += `<option value="${prize.id}">${prize.name}</option>`;
                    });
                })
                .catch(error => {
                    console.error('Erreur lors du chargement des prix:', error);
                });
        }

        function startDraw() {
            if (drawInProgress) return; // Empêcher plusieurs clics

            drawInProgress = true; // Tirage en cours

            // Sélectionnez le bouton de tirage
            const drawButton = document.getElementById('drawButton');
            drawButton.disabled = true;

            const campaignId = document.getElementById('campaign').value;
            selectedCampaignId = campaignId;
            selectedPrizeId = document.getElementById('prize').value;

            fetch(`/campaigns/${campaignId}/phones`)
                .then(response => response.json())
                .then(data => {
                    phones = data;
                    testResponse = Object.entries(phones)

                    if (testResponse.length === 1) {

                        const numberDisplay = document.getElementById('number-display');
                        const randomNumbers = ['762549420', '762549055', '768531656', '762551072'];
                        let counter = 0;

                        let drawInterval = setInterval(() => {
                            numberDisplay.textContent = randomNumbers[counter % randomNumbers.length];
                            counter++;
                        }, 100);

                        setTimeout(() => {
                            const colors = ['red', 'blue', 'green', 'yellow', 'orange', 'purple', 'pink'];
                            clearInterval(drawInterval);
                            let randomIndex = Math.floor(Math.random() * phones.length);
                            winningPhone = testResponse[0][1];

                            for (let i = 0; i < 300; i++) {  // Augmentez ce nombre pour plus de confettis
                                let confetti = document.createElement('div');
                                confetti.classList.add('confetti');
                                confetti.style.left = `${Math.random() * 100}%`;
                                confetti.style.animationDuration = `${Math.random() * 3 + 2}s`;  // Durée d'animation aléatoire
                                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                                confetti.style.transform = `rotate(${Math.random() * 360}deg)`;  // Rotation initiale aléatoire
                                document.body.appendChild(confetti);
                            }


                            document.getElementById('draw-bar').classList.add('win');
                            // Afficher les icônes de fête
                            document.querySelector('.party-icon.left').style.display = 'block';
                            document.querySelector('.party-icon.right').style.display = 'block';

                            numberDisplay.textContent = winningPhone;

                            drawButton.disabled = false;
                            drawInProgress = false;
                            document.getElementById('save-winner-btn').style.display = 'block';
                            // Appeler la fonction d'animation pour marquer la victoire
                            triggerWinningAnimation(winningPhone);
                        }, 6000);
                    } else {
                        const numberDisplay = document.getElementById('number-display');
                        numberDisplay.textContent = "Pas de ticket pour cette campagne";
                        drawButton.disabled = false;
                        drawInProgress = false;
                    }
                })
                .catch(error => {
                    console.error('Erreur lors du chargement des numéros de téléphone:', error);
                    drawButton.disabled = false;
                    drawInProgress = false;
                });
        }

        function saveWinner() {
            // Ajouter des lignes de débogage ici
            console.log('selectedCampaignId:', selectedCampaignId);
            console.log('selectedPrizeId:', selectedPrizeId); // Vérifie que selectedPrizeId est correct
            console.log('winningPhone:', winningPhone);       // Vérifie que winningPhone est correct

            fetch(`/save-winner`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    campaign_id: selectedCampaignId,
                    prize_id: selectedPrizeId,
                    phone: winningPhone,
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Le gagnant a été enregistré avec succès!');
                        window.location.href = '/winners';
                    } else {
                        alert('Erreur lors de l\'enregistrement du gagnant.');
                    }
                })
                .catch(error => {
                    console.error('Erreur lors de l\'enregistrement du gagnant:', error);
                });
        }
        function triggerWinningAnimation(winningNumber) {
            const drawBar = document.getElementById('draw-bar');
            const numberDisplay = document.getElementById('number-display');
            const celebrationContainer = document.querySelector('.celebration-container');

            drawBar.classList.add('win');
            numberDisplay.textContent = winningNumber;
            numberDisplay.classList.add('winner-display');

            celebrationContainer.style.height = '100px';
            const confettis = document.querySelectorAll('.confetti');
            confettis.forEach((confetti) => {
                confetti.style.animationPlayState = 'running';
            });
        }
    </script>
@endsection
