<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
    <div class="container-fluid py-1 px-3">
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
            <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                <div class="input-group input-group-outline">
                    <input type="text" class="form-control" id="search-input" placeholder="Type here...">
                    <div id="campaign-dropdown" class="dropdown-menu" style="display: none;"></div>
                </div>
            </div>
            <div class="btn-container">
                <span><a href="{{ route('campaigns.create') }}" class="btn btn-primary">Create Campaign</a></span>
            </div>
            <li class="nav-item d-flex align-items-center">
    <span class="profile-icon me-2">
        <i class="fas fa-user-circle"></i>
    </span>
                <a href="{{ route('logout') }}"
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                   class="logout-link">
                    Logout
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
            </li>

        </div>
    </div>

</nav>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('search-input');
        const dropdown = document.getElementById('campaign-dropdown');

        searchInput.addEventListener('input', function() {
            const query = this.value;

            if (query.length > 0) {
                fetch(`/search-campaigns?query=${query}`)
                    .then(response => response.json())
                    .then(data => {
                        dropdown.innerHTML = ''; // Vider le dropdown avant d'ajouter de nouveaux résultats
                        dropdown.style.display = 'block'; // Afficher le dropdown

                        if (data.length === 0) {
                            dropdown.innerHTML = '<div class="dropdown-item">No results found</div>';
                        } else {
                            data.forEach(campaign => {
                                let option = document.createElement('a');
                                option.classList.add('dropdown-item');
                                option.innerText = campaign.name;
                                option.href = `/campaigns/${campaign.id}`; // Redirection sur la campagne via son ID

                                dropdown.appendChild(option);
                            });
                        }
                    })
                    .catch(error => console.error('Erreur lors de la recherche des campagnes:', error));
            } else {
                dropdown.innerHTML = ''; // Vider le dropdown si le champ est vide
                dropdown.style.display = 'none'; // Cacher le dropdown
            }
        });
    });

</script>
