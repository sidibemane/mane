<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
        <img src="{{ asset('images/log.jpg') }}" alt="Logo" class="log-image">
        <span class="ms-1 font-weight-bold text-white">Free Senegal</span>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item nav-item-sidebar">
                <a class="nav-link text-white {{ request()->is('template*') ? 'active' : '' }}" href="{{ url('template') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">dashboard</i>
                    </div>
                    <span class="nav-link-text ms-1">Dashboard</span>
                </a>
            </li>
            <li class="nav-item nav-item-sidebar">
                <a class="nav-link text-white {{ request()->is('campaigns*') ? 'active' : '' }}" href="{{ url('campaigns') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-bullhorn opacity-10"></i>
                    </div>
                    <span class="nav-link-text ms-1">Campaigns</span>
                </a>
            </li>
            <li class="nav-item nav-item-sidebar">
                <a class="nav-link text-white {{ request()->is('prizes*') ? 'active' : '' }}" href="{{ url('prizes') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">redeem</i>
                    </div>
                    <span class="nav-link-text ms-1">Prizes</span>
                </a>
            </li>
            <li class="nav-item nav-item-sidebar">
                <a class="nav-link text-white {{ request()->is('draw*') ? 'active' : '' }}" href="{{ route('draw.create') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">celebration</i>
                    </div>
                    <span class="nav-link-text ms-1">Draw</span>
                </a>
            </li>
            <li class="nav-item nav-item-sidebar">
                <a class="nav-link text-white {{ request()->is('winner*') ? 'active' : '' }}" href="{{ route('winners.index') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">stars</i>
                    </div>
                    <span class="nav-link-text ms-1">Winners</span>
                </a>
            </li>
            <li class="nav-item nav-item-sidebar">
                <a class="nav-link text-white {{ request()->is('automation*') ? 'active' : '' }}" href="{{ route('automations.index') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">autorenew</i>
                    </div>
                    <span class="nav-link-text ms-1">Automation</span>
                </a>
            </li>
        </ul>
    </div>
    <hr class="transparent-line">
    <div class="sidenav-footer position-absolute w-100 bottom-0">

        <li class="nav-item">
            <a class="nav-link sign-in-button" href="{{ route('register') }}">
                <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                    <i class="material-icons" style="font-size: 25px;">person</i>

                </div>
                <span class="nav-link-text ms-1 registration-text">ADMINISTRATOR</span>
            </a>
        </li>
    </div>
</aside>
