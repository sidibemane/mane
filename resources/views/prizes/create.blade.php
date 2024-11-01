<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Prize</title>
</head>
<body>
<h1>Create__Prize</h1>
<form action="{{ route('prizes.store') }}" method="POST">
    @csrf
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>
    <br>
    <label for="type">Type:</label>
    <input type="text" id="type" name="type" required>
    <br>
    <label for="campaign_id">Campaign:</label>
    <select id="campaign_id" name="campaign_id" required>
        @foreach ($campaigns as $campaign)
            <option value="{{ $campaign->id }}">{{ $campaign->name }}</option>
        @endforeach
    </select>
    <br>
    <button type="submit">Create Prize</button>
</form>
<a href="{{ route('prizes.index') }}">Back to Prizes List</a>
</body>
</html>
