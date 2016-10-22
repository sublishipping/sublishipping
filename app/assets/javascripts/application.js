// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Conditions
$('body').on('click', '[data-condition-add]', function (event) {
  event.preventDefault();

  var $clone = $("[data-condition-template]").clone();
  var new_id = new Date().getTime();

  $clone = $($clone.html().replace(/[\_|\[](\d+)[\_|\]]/g, function(x) {
    return x.replace(/(\d+)/, new_id)
  }));

  $clone.find('input[type="hidden"]').attr('value', 0);

  $clone.appendTo("[data-condition-list]");
});

$('body').on('click', '[data-condition-destroy]',  function (event) {
  event.preventDefault();

  var parent = $(event.target).closest("[data-condition]");
  parent.hide().find('input[type="hidden"]').attr('value', 1);
});


// Extras
$('body').on('click', '[data-product_specific_price-add]', function (event) {
  event.preventDefault();

  var $clone = $("[data-product_specific_price-template]").clone();
  var new_id = new Date().getTime();

  $clone = $($clone.html().replace(/[\_|\[](\d+)[\_|\]]/g, function(x) {
    return x.replace(/(\d+)/, new_id)
  }));

  $clone.find('input[type="hidden"]').attr('value', 0);

  $clone.appendTo("[data-product_specific_price-list]");
});

$('body').on('click', '[data-product_specific_price-destroy]',  function (event) {
  event.preventDefault();

  var parent = $(event.target).closest("[data-product_specific_price]");
  parent.hide().find('input[type="hidden"]').attr('value', 1);
});
