// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $("div.highlight-snippet-more-link").click(function() {
        $(this).prev("ul.highlight-snippet-more").show();
        $(this).hide();
    });
});
