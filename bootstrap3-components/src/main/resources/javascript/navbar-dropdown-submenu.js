$(function(){
    $(".dropdown-submenu > a.sub-menu-trigger").on("click",function(e){
        var current = $(this).next();
        var grandparent = $(this).parent().parent();
        grandparent.find(".dropdown-menu:visible").not(current).hide();
        current.toggle();
        e.stopPropagation();
    });
});
