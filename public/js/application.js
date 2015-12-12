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

// var getFriendCount = function(communityID){
//   $.ajax({
//     url: '/requests',
//     method: 'GET',
//     data: { query: 'count_friends', communityID: communityID }
//   }).done(function(response){
//     $('body').append(response);
//   });
// };

