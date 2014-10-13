$(document).ready(function(){
  $('.left').on('click', '.button', function(){
    var query = $('.left').find('input').val();
    $.get('/search', {query: query}, function(data){
      $('.main-content').empty();
      console.log('hi');
      for(var i = 0; i < data['items'].length; i++){
        $('.main-content').append('<img src=' + data["items"][i]["snippet"]["thumbnails"]["medium"]["url"] + '>');
      }
    });
  });
});