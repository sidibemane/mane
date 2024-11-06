@extends('partials.template')

@section('content')
<div id="campaigns-campaigns_list">
    @include('campaigns.partials.campaigns_list', ['campaigns' => $campaigns])
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


</style>
