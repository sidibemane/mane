 <div id="update-prize-container" style="display: none;">
        <h3>Update_Prize</h3>
        <form id="update-prize-form" method="POST" onsubmit="submitUpdatePrizeForm(event)">
            @csrf
            @method('PUT')
            <input type="hidden" id="update-prize-id" name="prize_id">
            <label for="update-name">Name</label>
            <input type="text" id="update-name" name="name" required>
            <br>
            <label for="update-type">Type</label>
            <select id="update-type" name="type" required>
                <option value="matériel">Physique</option>
                <option value="non_matériel">Non_Physique</option>
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



