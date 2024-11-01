function archiveCampaign(id) {
    fetch(`/campaigns/${id}/archive`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ _method: 'POST' }) // Assurez-vous que ceci est correct
    })
        .then(response => {
            if (!response.ok) {
                return response.text().then(text => {
                    throw new Error(text);
                });
            }
            return response.json();
        })
        .then(data => {
            alert(data.message);
            location.reload();
        })
        .catch(error => console.error('Error:', error));
}

