// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(function() {
    $('div#task-form').hide();
    $('a#show-link').click(function(event){
        event.preventDefault();
        $('div#task-form').toggle();
        $('a#show-link').hide();
    });
});

function show(link, element, element1){
    $(element).hide();
    $(link).click(function(event){
        event.preventDefault();
        $(element).show();
        $(element1).hide();
        $(link).hide();
    });
}

function hide(link, element, element1){
    $(element).hide();

    // $(element1).show();

    $(link).click(function(event){
        event.preventDefault();
        $(element).show();

        $(element1).style.display = none;
    });
}