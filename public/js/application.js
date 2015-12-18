$(document).ready(function() {
  formListener();
});

var formListener = function(){
  $('#submit').on('click', function(e){
    e.preventDefault();

    var steamID = $('#steam_id').val();

    $.ajax({
      url: '/stats',
      method: 'GET',
      data: { steam_id: steamID }
    }).done(function(response){
      $('body').append(response);
    });
  });
};