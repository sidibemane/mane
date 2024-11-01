<footer class="footer py-4">
    <div class="container-fluid">
        <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
                <div class="copyright text-center text-sm text-muted text-lg-start">
                    © <script>
                        document.write(new Date().getFullYear())
                    </script>,
                    <span>FREE SENEGAL</span>
                </div>
            </div>
            <div class="col-lg-6 text-lg-left">
                <a href="{{ route('campaigns.archived') }}" class="btn btn-list-archived">List Archived Campaigns</a>
            </div>
        </div>
    </div>
</footer>
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

    .container {
        position: relative; /* Permet aux éléments enfants d'être positionnés par rapport à cet élément */
        z-index: 1; /* Assurez-vous que le contenu est au-dessus de l'image de fond */
    }
</style>
