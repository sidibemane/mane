<div class="row mb-4">
    <div class="col-lg-12 mb-md-0 mb-4">
        <div class="card">
            <div class="card-body px-4 pb-4">
                <div class="table-responsive">
                    <table class="table align-items-center table-hover">
                        <thead>
                        <tr>
                            <th class="text-uppercase text-secondary font-weight-bold" style="font-size: 12px !important;">Name_Campaigns</th>
                            <th class="text-uppercase text-secondary font-weight-bold" style="font-size: 12px !important;">Date</th>
                            <th class="text-center text-uppercase text-secondary font-weight-bold" style="font-size: 12px !important;">Actions</th>
                        </tr>

                        </thead>
                        <tbody>
                        @foreach ($campaigns as $campaign)
                            <tr>
                                <td class="align-middle">
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <h6 class="mb-0 text-sm">{{ $campaign->name }}</h6>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <span>{{ $campaign->start_date }} - {{ $campaign->end_date }}</span>
                                </td>
                                <td class="align-middle text-center">
                                    <button style="background-color: #28a745 !important; border: none !important; padding: 5px !important; border-radius: 5px !important; color: white !important; cursor: pointer !important; font-size: 14px !important; width: 46px !important; height: 35px !important;" onclick="window.location.href='{{ route('campaigns.edit', $campaign->id) }}'">
                                        <i class="material-icons" style="vertical-align: middle !important;">edit</i>
                                    </button>

                                    <button style="background-color: #eccd1c !important; border: none !important; padding: 5px !important; border-radius: 5px !important; color: white !important; cursor: pointer !important; width: 42px !important; height: 35px !important; font-size: 14px !important;" onclick="archiveCampaign({{ $campaign->id }})">
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
