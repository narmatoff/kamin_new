$(document).ready(function(){

////////////////////////////////////////////////////////////////////////
// выделенный лого в топе шапки(не работает http://toster.ru/q/29215) //
////////////////////////////////////////////////////////////////////////
var bp = $("div.brends_block div.brend_item.focus_brand span:first-child").css('background-position');
var bpFirstPart = bp.slice(0, bp.indexOf(' '));
var bpSecondPart = "0";
$("div.brends_block div.brend_item.focus_brand span:first-child").css({backgroundPosition:bpFirstPart+' '+bpSecondPart});

	

 ////////////////////////////////////////////
       // фикс для стилизации селектов(списков) //
    ////////////////////////////////////////////
    ///
    ///выбрать город
    $('div.ul_towns select').each(function(){
        $(this).siblings('p').text( $(this).children('option:selected').text() );
    });
    $('div.ul_towns select').change(function(){
        $(this).siblings('p').text( $(this).children('option:selected').text() );
    }); 

    // в фильтре
    $('div.select_filterbl select').each(function(){
        $(this).siblings('p').text( $(this).children('option:selected').text() );
    });
    $('div.select_filterbl select').change(function(){
        $(this).siblings('p').text( $(this).children('option:selected').text() );
    }); 

    $('div.select_filterbl2 select').each(function(){
        $(this).siblings('p').text( $(this).children('option:selected').text() );
    });
    $('div.select_filterbl2 select').change(function(){
        $(this).siblings('p').text( $(this).children('option:selected').text() );
    }); 	


// в сортировке
    $('div.select_sortnview select').each(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});
	$('div.select_sortnview select').change(function(){
		$(this).siblings('p').text( $(this).children('option:selected').text() );
	});	




//////////////////////////////////
// слайдер                     //
// проверка мобильного браузера //
//////////////////////////////////
if(isMobile.any()){

// // навигация по слайдеру с превьюшками
 // The slider being synced must be initialized first
  $('#carousel').flexslider({
    animation: "slide",
    controlNav: true,
    animationLoop: false,
    slideshow: false,
    itemWidth: 137,
    itemHeight: 90,
    itemMargin: 22,
    controlNav: false,
    directionNav: true,

    // useCSS must be unenabled for remove bug from floating text-block on slides
    useCSS: true,
    asNavFor: '#slider'
  });
 
  $('#slider').flexslider({
    animation: "slide",
    controlNav: false,
    directionNav: true,
    animationLoop: false,
    slideshow: true,
        itemWidth: 1000,
    itemHeight: 222,

    // useCSS must be unenabled for remove bug from floating text-block on slides
    useCSS: true,
    sync: "#carousel"
  });

} else {
	// слайдер
// // навигация по слайдеру с превьюшками
 // The slider being synced must be initialized first
  $('#carousel').flexslider({
    animation: "slide",
    controlNav: true,
    animationLoop: false,
    slideshow: false,
    itemWidth: 137,
    itemHeight: 90,
    itemMargin: 22,
    controlNav: false,
    directionNav: true,

    // useCSS must be unenabled for remove bug from floating text-block on slides
    useCSS: false,
    asNavFor: '#slider'
  });
 
  $('#slider').flexslider({
    animation: "slide",
    controlNav: false,
    directionNav: true,
    animationLoop: false,
    slideshow: true,
        itemWidth: 1000,
    itemHeight: 222,

    // useCSS must be unenabled for remove bug from floating text-block on slides
    useCSS: false,
    sync: "#carousel"
  });
}


//////////////////////////////////////////
// сворачивание/разворачивание каталога //
//////////////////////////////////////////
$(document).ready(function() {
    $('ul#my-menu ul').each(function(i) { // Check each submenu:
        if ($.cookie('submenuMark-' + i)) {  // If index of submenu is marked in cookies:
            $(this).show().prev().removeClass('collapsed').addClass('expanded'); // Show it (add apropriate classes)
            $(this).parent().addClass('bgdarked');
        }else {
            $(this).hide().prev().removeClass('expanded').addClass('collapsed'); // Hide it
            $(this).parent().removeClass('bgdarked');
        }
        $(this).prev().addClass('collapsible').click(function() { // Attach an event listener
            $(this).parent().addClass('bgdarked');
            var this_i = $('ul#my-menu ul').index($(this).next()); // The index of the submenu of the clicked link
            if ($(this).next().css('display') == 'none') {
                $(this).next().slideDown(200, function () { // Show submenu:
                    $(this).prev().removeClass('collapsed').addClass('expanded');
                    cookieSet(this_i);
                });
            }else {
                $(this).next().slideUp(200, function () { // Hide submenu:
                    $(this).parent().removeClass('bgdarked');
                    $(this).prev().removeClass('expanded').addClass('collapsed');
                    cookieDel(this_i);
                    $(this).find('ul').each(function() {
                        $(this).hide(0, cookieDel($('ul#my-menu ul').index($(this)))).prev().removeClass('expanded').addClass('collapsed');
                    });
                });
            }
        return false; // Prohibit the browser to follow the link address
        });
    });




});
function cookieSet(index) {
    $.cookie('submenuMark-' + index, 'opened', {expires: null, path: '/'}); // Set mark to cookie (submenu is shown):





}
function cookieDel(index) {
    $.cookie('submenuMark-' + index, null, {expires: null, path: '/'}); // Delete mark from cookie (submenu is hidden):

}




///////////////////////////////
// initializ_slider_jqueryUI //
///////////////////////////////
   $( ".slider-range" ).each(function() {
        var id = $(this).attr('id');
        var max_val = "#max_"+id;
        var min_val = "#min_"+id;
        var value_min = parseInt( $( min_val ).attr('value')  );
        var value_max = parseInt( $( max_val ).attr('value')  );
        var max =  parseInt( $( max_val ).attr('rel') );
  
        $( this ).slider({
            range: true,
            min: 0,
            max: max,
            values: [ value_min, value_max ],
            slide: function( event, ui ) {                
                $( min_val ).val(ui.values[ 0 ]);
//                $( ".min_val" ).attr("class","min_val"+unic_nubr);

                $( max_val ).val(ui.values[ 1 ]);
//                $( ".max_val" ).attr("class","max_val"+unic_nubr);
            }
			
//             stop: function(event, ui) {
//                 var msg   = $('#search_form').serialize();
//                 $.ajax({
//                   type: 'get',
//                   url: '/udata://catalog/getObjectsList/notemplate/3/0/0/100/265/1.json',
//                   dataType: "json",
//                   data: msg,
//                   success: function(data) {
//                   
// //всплывающая подсказка о кол-ве найденных товаров
// 
//                           $( "div.SearchHelperText" ).remove();
//                           $(max_val).after("<div class='SearchHelperText'></div>");
//                           $("div.SearchHelperText").html("<span>Найдено " + data.total + " товаров</span> <button type='submit'>показать</button>");
//                           $( "div.SearchHelperText" ).hide();
//                           $( "div.SearchHelperText" ).fadeIn('1800');
// //                          setTimeout(function(){$("div.SearchHelperText").fadeOut('1800')},5000);
//                   },
//                   error:  function(xhr, str){
//                         alert('Возникла ошибка: ' + xhr.responseCode);
//                     }
//                 });
//             }




        });
        });




////////////////////////////////////////////////////
// css checkbox_fix                               //
// generic tools to help with the custom checkbox //
////////////////////////////////////////////////////
function UTIL() { }
UTIL.prototype.bind_onclick = function(o, f) { // chain object onclick event to preserve prior statements (like jquery bind)
    var prev = o.onclick;
    if (typeof o.onclick != 'function') o.onclick = f;
    else o.onclick = function() { if (prev) { prev(); } f(); };
};
UTIL.prototype.bind_onload = function(f) { // chain window onload event to preserve prior statements (like jquery bind)
    var prev = window.onload;
    if (typeof window.onload != 'function') window.onload = f;
    else window.onload = function() { if (prev) { prev(); } f(); };
};
// generic css class style match functions similar to jquery
UTIL.prototype.trim = function(h) {
    return h.replace(/^\s+|\s+$/g,'');
};
UTIL.prototype.sregex = function(n) {
    return new RegExp('(?:^|\\s+)' + n + '(?:\\s+|$)');
};
UTIL.prototype.hasClass = function(o, n) {
    var r = this.sregex(n);
    return r.test(o.className);
};
UTIL.prototype.addClass = function(o, n) {
    if (!this.hasClass(o, n))
        o.className = this.trim(o.className + ' ' + n);
};
UTIL.prototype.removeClass = function(o, n) {
    var r = this.sregex(n);
    o.className = o.className.replace(r, '');
    o.className = this.trim(o.className);
};
var U = new UTIL();

function getElementsByClassSpecial(node, classname) {
    var a = [];
    var re = new RegExp('(^| )'+classname+'( |$)');
    var els = node.getElementsByTagName("*");
    for(var i=0,j=els.length; i<j; i++)
        if(re.test(els[i].className))a.push(els[i]);
    return a;
}


// specific to customized checkbox

function chk_labels(obj, init) {
    var objs = document.getElementsByTagName('LABEL');
    for (var i = 0; i < objs.length; i++) {
        if (objs[i].htmlFor == obj.id) {
            if (!init) { // cycle through each label belonging to checkbox
                if (!U.hasClass(objs[i], 'chk')) { // adjust class of label to checked style, set checked
                
                    if (obj.type.toLowerCase() == 'radio') {
                        var radGroup = objs[i].className;
                        var res = radGroup.split(" ");
                        var newRes = res[0] + " " + res[1];
                        var relLabels = getElementsByClassSpecial(document.body,newRes);
                        for (var r = 0; r < relLabels.length; r++) {
                            U.removeClass(relLabels[r], 'chk');
                            U.addClass(relLabels[r], 'clr');
                        }
                        
                        U.removeClass(objs[i], 'clr');
                        U.addClass(objs[i], 'chk');
                        obj.checked = true;
                        
                    }
                    else {
                        U.removeClass(objs[i], 'clr');
                        U.addClass(objs[i], 'chk');
                        obj.checked = true;
                    }
                } else { // adjust class of label to unchecked style, clear checked
                    U.removeClass(objs[i], 'chk');
                    U.addClass(objs[i], 'clr');
                    obj.checked = false;
                }
                return true;
            } else { // initialize on page load
                if (obj.checked) { // adjust class of label to checked style
                    U.removeClass(objs[i], 'clr');
                    U.addClass(objs[i], 'chk');
                } else { // adjust class of label to unchecked style
                    U.removeClass(objs[i], 'chk');
                    U.addClass(objs[i], 'clr')
                }
            }
        }
    }
}

function chk_events(init) {
    var objs = document.getElementsByTagName('INPUT');
    if (typeof init == 'undefined') init = false;
    else init = init ? true : false;
    for(var i = 0; i < objs.length; i++) {
        if (objs[i].type.toLowerCase() == 'checkbox' || objs[i].type.toLowerCase() == 'radio' ) {
            if (!init) {
                U.bind_onclick(objs[i], function() {
                    chk_labels(this, init); // bind checkbox click event handler
                });
            }
            else chk_labels(objs[i], init); // initialize state of checkbox onload
        }
    }
}

U.bind_onload(function() { // bind window onload event
    chk_events(false); // bind click event handler to all checkboxes
    chk_events(true); // initialize
});



if ($("div#catalog_list").hasClass('cat_item_list')){
	$("img.plitka_view").addClass('selected_type_view');

}else{
	$("img.spisok_view").addClass('selected_type_view');


}

	$("img.plitka_view").click(function() {
		$("div#catalog_list").addClass('cat_item_list');
		$(this).addClass('selected_type_view');
		$("img.spisok_view").removeClass('selected_type_view');
	});

	$("img.spisok_view").click(function() {
		$("div#catalog_list").removeClass('cat_item_list');
		$(this).addClass('selected_type_view');
		$("img.plitka_view").removeClass('selected_type_view');
	});





});