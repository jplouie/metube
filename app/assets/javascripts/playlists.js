$(document).ready(function(){
  if($('body.playlists').length){
    $('.add-comments').on('click', function(){
      var id = $('.comments').attr('id');
      var content = $('#content').val();
      $.post('/playlists/' + id + '/comments',
        {content: content, playlist_id: id},
        function(data){
          $('#content').val('');
          $('.comments').append('<div class="sub-comment"> \
            <p>' + content + '</p> \
            <p>Posted by ' + $("body").attr("value") + '</p> \
            <input class="sub-comment" type="text"><br> \
            <button class="add-sub-comments">Add comment</button> \
            </div>');
      });
    });

    // $('.comments').on('click', '.add-sub-comments', function(){
    //   var id = $(this).parent().attr('id');
    //   var content = $('#content').val();
    //   $.post('/videos/' + id + '/comments',
    //     {content: content, video_id: id},
    //     function(data){
    //       $('#content').val('');
    //       $('.comments').append('<div class="sub-comment"> \
    //         <p>' + content + '</p> \
    //         <input class="sub-comment" type="text"><br> \
    //         <button class="add-sub-comments">Add comment</button> \
    //         </div>');
    //   });
    // });
  }
});