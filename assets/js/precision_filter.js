$(document).ready(function () {
    $('.metric-score').each(function () {
        score = (parseFloat($(this).text()) * 100).toFixed(2)
        $(this).text(score);
    });
});

