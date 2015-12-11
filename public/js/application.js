$(document).ready(function() {
  formListener();
});

var formListener = function(){
  $('#submit').on('click', function(e){
    e.preventDefault();

    var communityID = $('#steam_id').val();

    getFriendList(communityID);
  });
};

var getFriendCount = function(communityID){
  $.ajax({
    url: '/requests',
    method: 'POST',
    data: { query: 'count_friends', communityID: communityID }
  }).done(function(response){
    $('body').append(response);
  });
};

