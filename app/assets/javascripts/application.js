// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor-jquery
//= require jquery.Jcrop
//= require jquery.color
//= require_tree .

$(document).ready(function() {
	$('a.lightbox').lightBox();
	$('img.cropBox').Jcrop({
	    onChange: update_crop,
	    onSelect: update_crop,
	    setSelect: [0, 0, 500, 500],
	    aspectRatio: 1
	  });
});

function update_crop(coords) {
  $("#crop_x").val(coords.x);
  $("#crop_y").val(coords.y);
  $("#crop_w").val(coords.w);
  $("#crop_h").val(coords.h);
}
