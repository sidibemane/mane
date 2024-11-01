@extends('partials.template')

@section('content')


    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Archived</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>{{ $campaign->id }}</td>
            <td>{{ $campaign->name }}</td>
            <td>{{ $campaign->description }}</td>
            <td>{{ $campaign->start_date }}</td>
            <td>{{ $campaign->end_date }}</td>
            <td>{{ $campaign->archived ? 'Yes' : 'No' }}</td>
        </tr>
        </tbody>
    </table>

    <a href="{{ route('campaigns.index') }}">Back to Campaigns</a>
@endsection
