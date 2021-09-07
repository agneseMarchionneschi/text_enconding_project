$(document).ready(function(e) {
    $('area').on('click', function() {
    });
});

$(document).ready(function () {
  mostra();
  nascondi();
});

function mostra(area) {
    $(area).css("color", "red");
}

function nascondi(linea) {
    $(linea).css("color", "black");
}
