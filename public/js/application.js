$(document).ready(function() {
  formListener();
});

var formListener = function(){
  $('#submit').on('click', function(e){
    e.preventDefault();

    var steamID = $('#steam_id').val();
  });
};

var getFriendList = function(steam_id){
  var url = "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=" +
  API_KEY + "&steamid=76561197960435530&relationship=friend";

  $.ajax({
    url: url,
    dataType: 'json'
  });
};