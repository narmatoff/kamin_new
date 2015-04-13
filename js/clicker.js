$(document).ready(function(){
	
		
		//разделение чисел на десятки сотни тысячи по классу goodsprice
	var priceSep = function (selPriceSep) {
		$(selPriceSep).each(function () {
			var str_price = $(this).text();
			$(this).text(str_price.replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, '$1 '))
		});
	};
	
priceSep(".goodsprice>span");
priceSep(".cart_counternsum>p" );
priceSep(".price_td>span" );
priceSep(".cart_summary" );
priceSep(".summa_asidebl>span" );
priceSep(".summa_td>span" );
priceSep(".help_checkout>span" );
priceSep(".cart_itogo>div>span" );
priceSep(".price_word_usualy>span" );
/////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
    var cl = function(text){
  if (console)
    console.log(text);
  return false;
};
     /* ---------- ajax search dropdown ------------------ */
  $('.searchin').click(function(e) {
                
                
                if ($(this).parent().children('ul').css('display') != 'block') {
                    $(this).parent().children('ul').show();
                    var firstClick = true;
                    $(document).bind('click.myEvent', function(e) {
                        if (!firstClick && $(e.target).closest('.ajax_hint').length == 0) {
                            $('.ajax_hint').hide();
                            $(document).unbind('click.myEvent');
                        }
                        firstClick = false;
                    });
                }               
	   e.preventDefault();
            });
//	  if ($('.ajax_hint').css('display') != 'block') {
//                    $('.ajax_hint').show();
//                    var firstClick = true;
//                    $(document).bind('click.myEvent', function(e) {
//                        if (!firstClick && $(e.target).closest('.ajax_hint').length == 0) {
//                            $('.ajax_hint').hide();
//                            $(document).unbind('click.myEvent');
//                        }
//                        firstClick = false;
//                    });
//                }
//                
//                e.preventDefault();
//            });
	
  $('.searchin').bind('keyup', function(e){
    if (e.keyCode == 38){ //вверх
      if ($(this).parent().children('ul').find('li').filter('.hover').length == 0){
        $(this).parent().children('ul').find('li').last().addClass('hover');
      } else {
        $(this).parent().children('ul').find('li').filter('.hover').removeClass('hover').prev().addClass('hover');
      }
    } else
    if (e.keyCode == 40){ //вниз
      if ($(this).parent().children('ul').find('li').filter('.hover').length == 0){        
        $(this).parent().children('ul').find('li').first().addClass('hover');
      } else {
        $(this).parent().children('ul').find('li').filter('.hover').removeClass('hover').next().addClass('hover');
      }
    } else
    if (e.keyCode == 13){ //enter
      return false;
      
      if ($(this).parent().children('ul').find('li').filter('.hover').length){
        window.location.href = $(this).parent().children('ul').find('li').filter('.hover').children('a').attr('href');
      }
    } else
    if (e.keyCode == 39){ //вправо
      return false;
      if ($(this).parent().children('ul').find('li').filter('.hover').length){
        $('.searchin')
          .val( $(this).parent().children('ul').find('li').filter('.hover').text() )
          .trigger('keyup');
      } 
    } else
    if ($('.searchin').val().length >= 3 ) {
      $.ajax({
        url: '/search.php?s_st=' + $('.searchin').val(),
        dataType: 'html',
        success: function (data) {
          $('.ajax_hint').html(data).show();
        }
      });
    } else {
      $('.ajax_hint').parent().children('ul').hide();
    }
  });

	


	
$('#opaopaopapa').bind('submit', function(){
// alert ('1111');
    


    $.ajax({
                type: 'POST',
                url: '/webforms/send/',
                data: $("#opaopaopapa").serialize(),
                success: function (data) {
                    // alert ('спасибо')
                    $('#show1').html('<h2>Спасибо за Ваше обращение!</h2>')

                }
            });

    return false;

});

$(".outnstock").fancybox({
//	type: "iframe",
//	href: "#show1",


//	content: document.getElementById("#show1"),
	'afterLoad': function () {
		id = $(this.element).attr('id');
        price = $(this.element).attr('data-price');
        article = $(this.element).attr('data-article');
		$.ajax({
			url: '/udata://webforms/add/313/?transform=/modules/forms_popap.xsl',
			dataType: 'html',
			success: function (data) {

				text_before = '<h2>Заказать товар</h2>';

				text_after = '<input name="data[new][tovar]" type="hidden" value="' + id + '"><input name="data[new][cena]" type="hidden" value="' + price + '"><input name="data[new][artikul]" type="hidden" value="' + article + '">';
				// alert (test);
				$("div#forminputter").html(text_before + data + text_after);

			}
		});
	}

});





$('#valueee').keyup(function () {
	nowval = $(this).val();
	$('#max_obem_parilki_from').attr('value', nowval);
	$('#min_obem_parilki_to').attr('value', nowval);
	// alert (nowval);

});
// Загрузка стрницы с доп. товарами.
// $( document ).ready(function() {
//     hash = window.location.hash.toString();
//     if (hash.match(/#*/)) {
//         productId = hash.match(/#(\d+(\.\d)*)/i);

//         history.pushState(null, null, '#');                
//                 if (productId) {
//                     $('html, body').stop().animate({scrollTop: $("div[name="+productId[1]+"]").offset().top}, 1800);
//                 };
//     }
// });

// обработка клика по товару
// $('body').on('click', 'a.cat_goodimage, .maingoodinfo h4 a', function() {
//     elementId = $(this).data('id');
//     addhash(elementId);
// });

// function addhash (pid) {
//     hash = window.location.hash.toString();
//     urlancor = '#' + pid + hash;
//     history.pushState(null, null, urlancor);
// }

// сортировка

$(".back_filter_sort").click(function() {
    hash = decodeURIComponent(window.location.search.toString());

    if (hash.match(/(\?*)&order_filter\[price\]=0/)) {
        red = hash.replace(/(\?*)&order_filter\[price\]=0/, '');
        // if (window.location(red).search.toString()[0] !== '?') {
        //     red = '?' + red;
        // };
    }
    else if (hash) {
        red = hash + '&order_filter[price]=0';
    }
    else {
        red = hash + '?&order_filter[price]=0';
    }
        console.log(red);

    window.location.search = red;
});

$("a.more_goods").click(function() {
	
     $("#clickerator").css('visibility','visible');
    id = $(this).attr('id');
    id_text = "#" + id;
    href =  "?" + $(this).attr("filter");
    total = parseInt($(this).attr("rel"));
    perpage =  parseInt($(this).data("per-page"));
    tonext =  parseInt($(this).attr("alt"));
    parent =  parseInt($(this).attr("parent"));
    tonext_1 = tonext + 1
    urla ='/udata://catalog/getObjectsList/notemplate/' + id + '/' + perpage + '//' + parent + '/280/1' + href + "&p=" + tonext + '&transform=/modules/catalog_popap.xsl'
    console.log(perpage);
    hash = window.location.search.toString();
    if (hash) {
        if (hash.match(/&pajax=(\d+(\.\d)*)/i)) {
            urlancor = hash.replace(/&pajax=(\d+(\.\d)*)/i, '&pajax=' + tonext_1);
        }
        else if (hash.match(/\?pajax=(\d+(\.\d)*)/i)) {
               urlancor = hash.replace(/\?pajax=(\d+(\.\d)*)/i, '?pajax=' + tonext_1);
        }
        else {
            urlancor = hash + '&pajax=' + tonext_1;
        }
    }
    else {
        urlancor = '?pajax=' + tonext_1;
    }
    history.pushState(null, null, urlancor);

    next = tonext_1 * perpage;
    jQuery.ajax({
                url: urla,
                dataType: 'html',
                success: function (data) {
                // alert (test);
                $(".cat_item_plits:last-child").after(data);
                $(id_text).attr("alt", tonext + 1);
                $(id_text).attr("href", href + "&p=" + tonext_1 );

                if (next>=total){
                    $('.more_goods_inf').text('Показано ' + total + " товаров из " + total );
                    $("a.more_goods").remove();
					priceSep(".goodsprice>span" );
					priceSep(".price_word_usualy>span" );
                }
                else{
                    $('.more_goods_inf').text('Показано ' + next + " товаров из " + total );
					priceSep(".goodsprice>span" );
					priceSep(".price_word_usualy>span" );
//					
                }
                 $("#clickerator").css('visibility','hidden');

                }
		
		

	
            });

	
	

	
    return false;
	
	
    });



//////////////////////////////////////////
// закладки описания на странице товара //
//////////////////////////////////////////

//////////////
// описание //
//////////////
$('div.good_moreinfobtn_about').click(function() {
        
    $('div.good_moreinfoblock_about').show();
    $('table.good_moreinfoblock_details').hide();
    
    // внешний вид кнопок при нажатии
    $(this).addClass('hoverbtnser');
    $('div.good_moreinfobtn_details').removeClass('hoverbtnser');
    });


////////////////////
// характеристики //
////////////////////
$('div.good_moreinfobtn_details').click(function() {
        
    $('div.good_moreinfoblock_about').hide();
    $('table.good_moreinfoblock_details').show();
    
    // внешний вид кнопок при нажатии
    $('div.good_moreinfobtn_about').removeClass('hoverbtnser');
    $(this).addClass('hoverbtnser');
    });


//всплывающее главное меню

    $('ul#my-menu1 ul').each(function(i) { // Check each submenu:
        $(this).css('display','none');
        $(this).prev().addClass('collapsible collapsed').mouseover(function() { // Attach an event listener



        var this_i = $('ul#my-menu1 ul').index($(this).next()); // The index of the submenu of the clicked link


            if ($(this).next().css('display') == 'none') {
                $(this).next().slideDown(200, function () { // Show submenu:
                    $(this).prev().removeClass('collapsed').addClass('expanded');
            //      cookieSet(this_i);
                });
            }else {
                $(this).next().slideUp(200, function () { // Hide submenu:
                    $(this).prev().removeClass('expanded').addClass('collapsed');
                    //cookieDel(this_i);
                    $(this).find('ul').each(function() {
                        $(this).hide(0, $('ul#my-menu1 ul').index($(this))).prev().removeClass('expanded').addClass('collapsed');
                    });
                });
            }
            return false; // Prohibit the browser to follow the link address
        });


    });

    function cookieSet(index) {
        $.cookie('submenuMark-' + index, 'opened', {expires: null, path: '/'}); // Set mark to cookie (submenu is shown):
    }
    function cookieDel(index) {
        $.cookie('submenuMark-' + index, null, {expires: null, path: '/'}); // Delete mark from cookie (submenu is hidden):
    }

// ajax поиск товаров
// слайдер
$(".slider-range").each(function() {
    var id = $(this).attr('id');
    var max_val = "#max_" + id;
    var min_val = "#min_" + id;
    var value_min = parseInt($(min_val).attr('placeholder'));
    var value_max = parseInt($(max_val).attr('placeholder'));
    var max = parseInt($(max_val).attr('rel'));
    var catid = parseInt($('#search_param').data('categoryid'));
    $(this).slider({
        range: true,
        min: 0,
        max: max,
        values: [value_min, value_max],

        slide: function(event, ui) {
            $(min_val).val(ui.values[0]);
            //                $( ".min_val" ).attr("class","min_val"+unic_nubr);
            $(max_val).val(ui.values[1]);
            //                $( ".max_val" ).attr("class","max_val"+unic_nubr);
        },
        stop: function(event, ui) {
            var msg = $('#search_param').serialize();
            $.ajax({
                type: 'get',
                url: '/udata://catalog/getObjectsList/notemplate/' + catid + '/0/0/100/280/1.json',
                dataType: "json",
                data: msg,
                success: function(data) {
                    //всплывающая подсказка о кол-ве найденных товаров
                    $("div.SearchHelperText").remove();
                    $(max_val).after("<div class='SearchHelperText'></div>");
                    $("div.SearchHelperText").html("<span>Найдено " + data.total + " товаров</span> <button type='submit'>показать</button>");
                    $("div.SearchHelperText").hide();
                    $("div.SearchHelperText").fadeIn('1800');
                    //                          setTimeout(function(){$("div.SearchHelperText").fadeOut('1800')},5000);
                },
                error: function(xhr, str) {
                    alert('Возникла ошибка: ' + xhr.responseCode);
                }
            });
        }
    });
});
// селектор
$("div.select_filterbl").each(function() {
    var selitem = $(this).children('select').attr('id');
    $('#' + selitem).change(function() {
        //всплывающая подсказка о кол-ве найденных товаров в селектах
        var catid = parseInt($('#search_param').data('categoryid'));
        
        $("div.SearchHelperText").remove();
        $(this).parent().before("<div class='SearchHelperText'></div>");
        var msg = $('#search_param').serialize();
        $.ajax({
            type: 'get',
            url: '/udata://catalog/getObjectsList/notemplate/' + catid + '/0/0/100/280/1.json',
            dataType: "json",
            data: msg,
            success: function(data) {
                $("div.SearchHelperText").html("<span>Найдено " + data.total + " товаров</span> <button type='submit'>показать</button>");
                $("div.SearchHelperText").hide();
                $("div.SearchHelperText").fadeIn('1800');
                //                setTimeout(function(){$("div.SearchHelperText").fadeOut('1800')},5000);
            },
            error: function(xhr, str) {
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
    });
});
// инпут
$("div.back_filterslid").each(function() {
    var oneInput = $(this).children('input').attr('id');
    $('#' + oneInput).keyup(function() {
        //всплывающая подсказка о кол-ве найденных товаров в селектах
        var catid = parseInt($('#search_param').data('categoryid'));
        
        $("div.SearchHelperText").remove();
        $(this).parent().before("<div class='SearchHelperText'></div>");
        var msg = $('#search_param').serialize();
        $.ajax({
            type: 'get',
            url: '/udata://catalog/getObjectsList/notemplate/' + catid + '/0/0/100/280/1.json',
            dataType: "json",
            data: msg,
            success: function(data) {
                $("div.SearchHelperText").html("<span>Найдено " + data.total + " товаров</span> <button type='submit'>показать</button>");
                $("div.SearchHelperText").hide();
                $("div.SearchHelperText").fadeIn('1800');
                //                setTimeout(function(){$("div.SearchHelperText").fadeOut('1800')},5000);
            },
            error: function(xhr, str) {
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
    });
});
// заставляем работать input под слайдер
$(".min_val").keyup(function() {
    val = $(this).val();
    id = "#" + $(this).attr('id').substr(4);
    $(id).slider("values", 0, val);
});
$(".max_val").keyup(function() {
    val = $(this).val();
    id = "#" + $(this).attr('id').substr(4);
    id_min = "#min_" + $(this).attr('id').substr(4);
    val_min = $(id_min).val()
    if (val < val_min) {
        val = val_min;
        $(this).val(val);
    }
    $(id).slider("values", 1, val);
});
$(".min_val").blur(function() {
    val = $(this).val();
    id = "#" + $(this).attr('id').substr(4);
    id_max = "#max_" + $(this).attr('id').substr(4);
    val_max = $(id_max).val()
    if (val > val_max) {
        val = val_max;
        $(this).val(val);
    }
    $(id).slider("values", 0, val);
});
$(".max_val").blur(function() {
    val = $(this).val();
    id = "#" + $(this).attr('id').substr(4);
    id_min = "#min_" + $(this).attr('id').substr(4);
    val_min = $(id_min).val()
    if (val < val_min) {
        val = val_min;
        $(this).val(val);
    }
    $(id).slider("values", 1, val);
});

});
