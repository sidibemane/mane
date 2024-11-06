<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Free Senegal
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <script src="{{ asset('js/archive.js') }}" defer></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
    <link id="pagestylecustom" href="/assets/css/custom.css" rel="stylesheet" />
  <link id="pagestyle" href="/assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
    <link rel="stylesheet" href="path/to/your/styles.css">
  <!-- Nepcha Analytics (nepcha.com) -->
  <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .input-group {
            width: 600px; /* Ajustez la largeur selon vos besoins */
            max-width: 600px; /* Limitez la largeur maximale si nécessaire */
        }
        .form-control {
            width: 100%;
        }

        .nav-item {
            display: flex;
            align-items: center;
        }

        .profile-icon {
            font-size: 35px; /* Ajustez la taille de l'icône */
            color: #cf332d; /* Couleur de l'icône (rouge pour correspondre à votre thème) */
            margin-right: 10px; /* Espacement entre l'icône et le lien */
        }

        .nav-link {
            color: #000; /* Couleur du texte du lien */
            text-decoration: none; /* Supprime la sous-ligne */
            font-weight: bold; /* Rend le texte en gras */
        }

        .nav-link:hover {
            color: #cf332d; /* Couleur du texte du lien au survol */
        }
        .logo-image {
            width: 90px; /* Ajustez la largeur de l'image selon vos besoins */
            height: 50px; /* Maintient les proportions de l'image */
            border-radius: 50%; /* Arrondi à 50% pour obtenir une forme circulaire */
            object-fit: cover; /* Assure que l'image couvre le conteneur tout en préservant ses proportions */
        }
        #sidenav-main {
            width: 800px; /* Ajustez cette valeur selon vos besoins */
            background-color: BLACK; /* Exemple de couleur pour vérifier les styles */
        }


    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('search-input'); // Remplace par l'ID de ton champ de recherche
            const dropdown = document.getElementById('campaign-dropdown'); // L'élément où tu affiches les résultats

            searchInput.addEventListener('input', function() {
                const query = this.value;

                if (query.length > 0) {
                    fetch(`/search-campaigns?query=${query}`)
                        .then(response => response.json())
                        .then(data => {
                            dropdown.innerHTML = ''; // Vider le dropdown avant d'ajouter de nouveaux résultats

                            data.forEach(campaign => {
                                const option = document.createElement('div'); // Utiliser un div pour les options
                                option.textContent = campaign.name; // Afficher le nom de la campagne
                                option.classList.add('dropdown-item'); // Ajouter une classe pour le style

                                // Gérer le clic sur l'option
                                option.onclick = function() {
                                    // Rediriger vers la page de la campagne
                                    window.location.href = `/campaigns/${campaign.id}`;
                                };

                                dropdown.appendChild(option); // Ajouter l'option au dropdown
                            });

                            // Afficher le dropdown
                            dropdown.style.display = 'block';
                        })
                        .catch(error => console.error('Erreur lors de la recherche des campagnes:', error));
                } else {
                    dropdown.style.display = 'none'; // Cacher le dropdown si le champ est vide
                }
            });
        });

        function archiveCampaign(campaignId) {
            axios.post(`/campaigns/${campaignId}/archive`)
                .then(response => {
                    alert('Campaign archived successfully!');
                    window.location.reload(); // Refresh the page to remove the archived campaign
                })
                .catch(error => console.error('Error archiving campaign:', error));
        }
        document.querySelector('#search-input').addEventListener('input', function() {
            let query = this.value;

            if (query.length > 0) {
                // Faire une requête pour chercher les campagnes
                fetch(`/search-campaigns?query=${query}`)
                    .then(response => response.json())
                    .then(data => {
                        let dropdown = document.getElementById('campaign-dropdown');
                        dropdown.innerHTML = ''; // Vider la liste existante
                        dropdown.style.display = 'block'; // Afficher le dropdown

                        if (data.length === 0) {
                            dropdown.innerHTML = '<div class="dropdown-item">No results found</div>'; // Message si pas de résultats
                        } else {
                            data.forEach(campaign => {
                                let option = document.createElement('div');
                                option.classList.add('dropdown-item');
                                option.textContent = campaign.name;
                                option.onclick = function() {
                                    // Rediriger vers la page de la campagne
                                    window.location.href = `/campaigns/${campaign.id}`;
                                };
                                dropdown.appendChild(option);
                            });
                        }
                    })
                    .catch(error => console.log('Error:', error));
            } else {
                document.getElementById('campaign-dropdown').innerHTML = '';
                document.getElementById('campaign-dropdown').style.display = 'none'; // Cacher le dropdown si pas de texte
            }
        });

        axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        function restoreCampaign(campaignId) {
            axios.put(`/campaigns/${campaignId}/restore`)
                .then(response => {
                    alert('Campaign restored successfully!');
                    window.location.reload(); // Refresh the page to show updated data
                })
                .catch(error => console.error('Error restoring campaign:', error));
        }

    </script>
    @yield('script-head')


</head>

<body class="g-sidenav-show figure-custom bg-gray-200 ">
@yield('custom-scripts')

@include('partials.aside')
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
@include('partials.navbar')

      <div class="container-fluid py-4">
          @yield('content')


          @include('partials.footer')
    </div>
  </main>
  <div class="fixed-plugin">
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Material UI Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="material-icons">clear</i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-dark px-3 mb-2 active" data-class="bg-gradient-dark" onclick="sidebarType(this)">Dark</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="mt-3 d-flex">
          <h6 class="mb-0">Navbar Fixed</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
          </div>
        </div>
        <hr class="horizontal dark my-3">
        <div class="mt-2 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
        <a class="btn bg-gradient-info w-100" href="https://www.creative-tim.com/product/material-dashboard-pro">Free Download</a>
        <a class="btn btn-outline-dark w-100" href="https://www.creative-tim.com/learning-lab/bootstrap/overview/material-dashboard">View documentation</a>
        <div class="w-100 text-center">
          <a class="github-button" href="https://github.com/creativetimofficial/material-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/material-dashboard on GitHub">Star</a>
          <h6 class="mt-3">Thank you for sharing!</h6>
          <a href="https://twitter.com/intent/tweet?text=Check%20Material%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
          </a>
          <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/material-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
          </a>
        </div>
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->



  <script src="/assets/js/core/popper.min.js"></script>
  <script src="/assets/js/core/bootstrap.min.js"></script>
  <script src="/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="/assets/js/plugins/chartjs.min.js"></script>


@yield('diagramme')

  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.min.js?v=3.1.0"></script>

    @yield("scripts")

</body>

</html>
