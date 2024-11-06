
<h1 class="register-title">Archived  Prizes</h1>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Campaign</th>
    </tr>
    </thead>
    <tbody>
    @foreach ($prizes as $prize)
        <tr>
            <td>{{ $prize->name }}</td>
            <td>{{ $prize->type }}</td>
            <td>{{ $prize->campaign->name }}</td>
            <td>
                <button onclick="restorePrize({{ $prize->id }})">Restore</button>
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
<a href="{{ route('prizes.index') }}">Back to Prizes List</a>

