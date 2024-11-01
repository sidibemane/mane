<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="{{ asset('css/dashboard.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('search-campaigns').addEventListener('input', function() {
                var searchQuery = this.value;

                axios.get('{{ route('campaigns.index') }}', { params: { search: searchQuery } })
                    .then(response => {
                        document.getElementById('campaigns-campaigns_list').innerHTML = response.data.html;
                    })
                    .catch(error => {
                        console.error('Error searching campaigns:', error);
                    });
            });

            // Load campaigns on page load
            loadCampaigns();
        });

        function loadCampaigns() {
            axios.get('{{ route('campaigns.index') }}')
                .then(response => {
                    document.getElementById('campaigns-campaigns_list').innerHTML = response.data.html;
                })
                .catch(error => {
                    console.error('Error loading campaigns:', error);
                });
        }

        function showUpdateForm(campaignId) {
            document.getElementById('update-form-modal').style.display = 'block';

            // Fetch campaign details and fill the form
            axios.get(`/campaigns/${campaignId}`)
                .then(response => {
                    const campaign = response.data;
                    document.getElementById('update-campaign-id').value = campaign.id;
                    document.getElementById('update-name').value = campaign.name;
                    document.getElementById('update-description').value = campaign.description;
                    document.getElementById('update-start-date').value = campaign.start_date;
                    document.getElementById('update-end-date').value = campaign.end_date;
                })
                .catch(error => console.error('Error fetching campaign details:', error));
        }

        function hideUpdateForm() {
            document.getElementById('update-form-modal').style.display = 'none';
        }

        document.getElementById('update-campaign-form').addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = new FormData(this);
            const campaignId = document.getElementById('update-campaign-id').value;

            axios.put(`/campaigns/${campaignId}`, formData)
                .then(response => {
                    alert('Campaign updated successfully!');
                    window.location.reload(); // Refresh the page to show updated data
                })
                .catch(error => console.error('Error updating campaign:', error));
        });
        function archiveCampaign(campaignId) {
            axios.post(`/campaigns/${campaignId}/archive`)
                .then(response => {
                    alert('Campaign archived successfully!');
                    window.location.reload(); // Refresh the page to remove the archived campaign
                })
                .catch(error => console.error('Error archiving campaign:', error));
        }

    </script>
</head>
<body>
<header class="site-header">
    <div class="header-content">
        <a href="#" class="logo">
            <!-- Remplacez le contenu ci-dessous avec votre propre logo -->
            <img src="{{ asset('images/logo.png') }}" alt="Logo" class="logo-image">
        </a>
        <div class="header-right">
            <!-- Icône de profil avec la classe Font Awesome souhaitée -->
            <span class="profile-icon"><i class="fas fa-user-circle"></i>
            </span>
            <!-- Lien de déconnexion -->
            <a href="{{ route('logout') }}"
               onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
               class="logout-link">
                Logout
            </a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        </div>
    </div>
</header>

<div class="dashboard-container">

    <div class="search-input-container">
        <input type="text" id="search-campaigns" placeholder="Search Campaigns">
        <span class="search-icon"><i class="fas fa-search"></i></span>
    </div>
    <a href="{{ route('campaigns.create') }}" class="btn btn-primary">Create Campaign</a>
    <div class="dashboard-container">
        @if (session('status'))
            <div class="alert alert-success">
                {{ session('status') }}
            </div>
        @endif
        @if ($campaigns->isEmpty())
            <p>No campaigns found.</p>
        @else
            <ul class="campaign-list">
                @foreach ($campaigns as $campaign)
                    <li class="campaign-item">
                        <div class="campaign-column">{{ $campaign->name }}</div>
                        <div class="campaign-column">{{ $campaign->start_date }} - {{ $campaign->end_date }}</div>
                        <div class="campaign-column">
                            <button onclick="window.location.href='{{ route('campaigns.edit', $campaign->id) }}'">Update</button>
                        </div>
                        <div class="campaign-column">
                            <button onclick="archiveCampaign({{ $campaign->id }})">Archive</button>
                        </div>
                    </li>
                @endforeach
            </ul>
        @endif

    </div>
    <div>
        <a href="{{ route('campaigns.archived') }}" class="btn btn-secondary">List Archived Campaigns</a>
    </div>
</div>
</body>
</html>

