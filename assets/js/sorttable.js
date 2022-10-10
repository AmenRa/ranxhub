$(document).ready(function () {
    $('.leaderboard-amdbfpse').DataTable({
        "columns": [
            { "visible": true, "searchable": true },
            { "visible": true, "searchable": true },
            { "visible": true, "searchable": true },
            { "visible": true, "searchable": true },
            { "visible": true, "searchable": true },
            { "visible": true, "searchable": true },
            { "visible": true, "searchable": true },
            // { "visible": true, "searchable": true },
            { "visible": false, "searchable": true }
        ],
        "autoWidth": false
        // paging: false,
        // info: false,
    });
});