$(document).ready(function() {
  formListener();
});

var formListener = function(){
  $('#submit').on('click', function(e){
    e.preventDefault();
    clearTable();

    var steamID = $('#steam_id').val();

    $.ajax({
      url: '/stats',
      method: 'GET',
      data: { steam_id: steamID }
    }).done(function(response){
      $('#stats-area').append(response);
    })
    .fail(function(response){
      alert("error");
    });
  });
};

var clearTable = function(){
  $('.stats').remove();
};