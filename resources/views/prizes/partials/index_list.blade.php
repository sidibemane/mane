<button onclick="showCreatePrizeForm()" class="btn btn-black">Create Prize</button>
<button onclick="showArchivedPrizes()" class="btn btn-bla">View Archived Prizes</button>

<div class="overlay" onclick="hideArchivedPrizes()"></div>
<div class="form-container">
    <h1 class="register-title">Create  Prize</h1>
    <form action="{{ route('prizes.store') }}" method="POST" onsubmit="submitPrizeForm(event)">
        @csrf
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="type">Type</label>
        <select id="type" name="type" required>
            <option value="Physique">Physique</option>
            <option value="Non_Physique">Non_Physique</option>
        </select>
        <br>
        <label for="campaign_id">Campaigns</label>
        <select id="campaign_id" name="campaign_id" required>
            @foreach ($campaigns as $campaign)
                <option value="{{ $campaign->id }}">{{ $campaign->name }}</option>
            @endforeach
        </select>
        <br>
        <button type="submit">Create</button>
        <button type="button" onclick="hideCreatePrizeForm()">Cancel</button>
    </form>
</div>

<div id="update-prize-container" class="form-container-update" style="display: none;">
    <h2 class="register-title">Update  Prize</h2>
    <form id="update-prize-form" method="POST" onsubmit="submitUpdatePrizeForm(event)">
        @csrf
        @method('PUT')
        <input type="hidden" id="update-prize-id" name="prize_id">
        <label for="update-name">Name</label>
        <input type="text" id="update-name" name="name" required>
        <br>
        <label for="update-type">Type</label>
        <select id="update-type" name="type" required>
            <option value="Physique">Physique</option>
            <option value="Non_Physique">Non_Physique</option>
        </select>
        <br>
        <label for="update-campaign_id">Campaign</label>
        <select id="update-campaign_id" name="campaign_id" required>
            @foreach ($campaigns as $campaign)
                <option value="{{ $campaign->id }}">{{ $campaign->name }}</option>
            @endforeach
        </select>
        <br>
        <button type="submit">Update</button>
        <button type="button" onclick="hideUpdatePrizeForm()">Cancel</button>
    </form>
</div>
<!-- Conteneur pour la liste des prix -->
<div class="prizes-list">
    <div class="row mb-4">
        <div class="col-lg-12 mb-md-0 mb-4">
            <div class="card">

                    <div class="row">
                        <div class="col-lg-6 col-5 my-auto text-end">
                            <div class="dropdown float-lg-end pe-4">
                                <ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5" aria-labelledby="dropdownTable">
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                <div class="card-body px-0 pb-2">
                    <div class="table-responsive">
                        <table class="table align-items-center mb-0">
                            <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Name Prize</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Type</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Campaigns</th>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($prizes as $prize)
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h2 class="mb-0 text-sm">{{ $prize->name }}</h2>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="avatar-group mt-2">
                                            <span>{{ $prize->type }}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="avatar-group mt-2">
                                            <span>{{ $prize->campaign->name }}</span>
                                        </div>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <button style="background-color: #28a745 !important; border: none !important; padding: 5px !important; border-radius: 5px !important; color: white !important; cursor: pointer !important; font-size: 14px !important; width:  50px !important; height: 35px !important;" onclick="showUpdatePrizeForm({{ $prize->id }})">
                                            <i class="material-icons">edit</i>
                                        </button>

                                        <button style="background-color: #FB8C00 !important; border: none !important; padding: 5px !important; border-radius: 5px !important; color: white !important; cursor: pointer !important; width: 50px !important; height: 35px !important; font-size: 14px !important;" onclick="archivePrize({{ $prize->id }})">
                                            <i class="material-icons" style="font-size: 24px;">archive</i>
                                        </button>

                                    </td>

                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="archived-prizes">
    <h1 class="register-title">Archived  Prizes</h1>
    <table>
        <thead>
        <tr>
            <th>Name_Prizes</th>
            <th>Type</th>
            <th>Campaign</th>
            <th>Actions</th>
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
    <button onclick="hideArchivedPrizes()">Close</button>
</div>


