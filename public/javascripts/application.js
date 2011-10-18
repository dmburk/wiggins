// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
/*
jQuery(document).ready(function() {
    jQuery('#form').each(function() {
        var $link = $(this);
        var $dialog = $('<div></div>')
            .load($link.attr('href') + ' #content')
            .dialog({
                autoOpen: false,
                title: $link.attr('title'),
                width: 500,
                height: 300
            });
          
        $link.click(function() {
            $dialog.dialog('open');
            return false;
        });
    });
});
*/

$('#open-dialog').click(function(){
  $customer_form.dialog('open');
});
