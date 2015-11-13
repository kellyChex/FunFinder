$(document).ready(function(){
  var i = 1;
  $("#new_tag").on("click", function(){
    $('#appendHere').append('<form><input id="'+ i +'" type="text" name="tag""> </form>');
    i++;
  });
});
