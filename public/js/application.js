$(document).ready(function() {
  formListener();
});

var formListener = function(){
  $('#submit').on('click', function(e){
    e.preventDefault();

    var communityID = $('#steam_id').val();

    $.ajax({
      url: '/stats',
      method: 'GET',
      data: { communityID: communityID }
    }).done(function(response){
      $('body').append(response);
    });
  });
};