$(document).ready(function() {
  bindListeners();
});

var bindListeners = function(){
  formListener();
  waitMessageListener();
};

// submit ajax request
var formListener = function(){
  $('body').on('click', '#submit', function(e){
    e.preventDefault();
    clearTable();

    var steamID = $('#steam-id').val();

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

// remove previous result when new search initiated
var clearTable = function(){$('.stats').remove();};

// toggle wait message on with form submit, off with ajax response
var waitMessageListener = function(){
  $('body').on('click', '#submit', function(){
    toggleWaitMessage();
  });
  $(document).ajaxComplete(function(){
    toggleWaitMessage();
  });
};

var toggleWaitMessage = function(){ $('.wait').toggle(); };

// *** need a way to get updates from server for this to work
// var toggleProgressBars = function(){
//   $('#loading-bars').toggle();
//   resetProgressBars();
// };

// var resetProgressBars = function(){
//   $('.progress-label progress').val("0");
// }