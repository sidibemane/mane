<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="{{ asset('css/dashboard.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>

    <div id="campaigns-list">
        @include('campaigns.partials.campaigns_list', ['campaigns' => $campaigns])
    </div>


<script>
    document.getElementById('search-campaigns').addEventListener('input', function() {
        var searchQuery = this.value;

        axios.get('{{ route('campaigns.index') }}', { params: { search: searchQuery } })
            .then(response => {
                document.getElementById('campaigns-list').innerHTML = response.data;
            })
            .catch(error => {
                console.error('Error searching campaigns:', error);
            });
    });

    function loadCampaigns() {
        axios.get('{{ route('campaigns.index') }}')
            .then(response => {
                document.getElementById('campaigns-list').innerHTML = response.data;
            })
            .catch(error => {
                console.error('Error loading campaigns:', error);
            });
    }

    // Load campaigns on page load
    window.onload = function() {
        loadCampaigns();
    }
</script>

</body>
</html>

