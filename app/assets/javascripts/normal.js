//= require fancybox


$('.popup').click(function(e) {
  console.log("e");
  popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
  e.stopPropagation(); return false;
});


function popupCenter(url, width, height, name) {
  console.log("f");
  var left = (screen.width/2)-(width/2);
  var top = (screen.height/2)-(height/2);
  return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
}


function opendialog() {
   alert("h");
  jQuery('#signin-form').fancybox();
}
