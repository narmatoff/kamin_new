$(document).ready(function () {

    ////////////////////////////////////////////////////////////////////////
    // выделенный лого в топе шапки(не работает http://toster.ru/q/29215) //
    ////////////////////////////////////////////////////////////////////////
    var bp = $("div.brends_block div.brend_item.focus_brand span:first-child").css('background-position');
    var bpFirstPart = bp.slice(0, bp.indexOf(' '));
    var bpSecondPart = "0";
    $("div.brends_block div.brend_item.focus_brand span:first-child").css({
        backgroundPosition: bpFirstPart + ' ' + bpSecondPart
    });


    ////////////////////////////////////////////
    // фикс для стилизации селектов(списков) //
    ////////////////////////////////////////////
    ///
    
    
    
    ///выбрать город
    
    
//    $('div.ul_towns select').each(function () {
//        $(this).siblings('p').text($(this).children('option:selected').text());
//    });
//    $('div.ul_towns select').change(function () {
//        $(this).siblings('p').text($(this).children('option:selected').text());
//    });
//
//    
//    Подставка региона в параграф в шапке
    var RegTxtName = $('ul#region li.first').text();
//    console.log(RegTxtName);
    $('.ul_towns p').text(RegTxtName);
    $('.ul_towns p').attr('title',RegTxtName);
    
    
    
    
    
    
    $('div.chul_towns select').each(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });
    $('div.chul_towns select').change(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });

    // в фильтре
    $('div.select_filterbl select').each(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });
    $('div.select_filterbl select').change(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });

    $('div.select_filterbl2 select').each(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });
    $('div.select_filterbl2 select').change(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });


    // в сортировке
    $('div.select_sortnview select').each(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });
    $('div.select_sortnview select').change(function () {
        $(this).siblings('p').text($(this).children('option:selected').text());
    });


    //////////////////////////////////
    // слайдер                     //
    // проверка мобильного браузера //
    //////////////////////////////////


    if (isMobile.any()) {
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
            slideshowSpeed: 10800, //Integer: Set the speed of the slideshow cycling, in milliseconds
            animationSpeed: 1800, //Integer: Set the speed of animations, in milliseconds
            itemWidth: 1000,
            itemHeight: 222,
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: true,
            sync: "#carousel"
        });

        //        Карусель на странице товара
        $('#carousel2').flexslider({
            animation: "slide",
            slideshow: false,
            itemWidth: 110,
            itemHeight: 109,
            itemMargin: 5,
            controlNav: false,
            directionNav: true,
            direction: "vertical",
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: true,
            animationLoop: true,
            asNavFor: '#slider2'
        });

        $('#slider2').flexslider({
            //          animation: "slide",
            controlNav: false,
            directionNav: false,
            direction: "vertical",
            animationLoop: true,
            slideshow: false,
            slideshowSpeed: 6000, //Integer: Set the speed of the slideshow cycling, in milliseconds
            animationSpeed: 1800, //Integer: Set the speed of animations, in milliseconds
            itemWidth: 450,
            itemHeight: 450,
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: true,
            sync: "#carousel2"
        });
        
        
        
//        карусель похожих товаров
            $('#towars').flexslider({
            animation: "slide",
            controlNav: true,
            animationLoop: false,
            slideshow: false,
            itemWidth: 207,
            itemHeight: 410,
            itemMargin: 30,
            controlNav: false,
            directionNav: true,
            slideshow: true,
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: true
            
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
            direction: "horizontal",
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: false,
            asNavFor: '#slider'
        });

        $('#slider').flexslider({
            animation: "slide",
            controlNav: false,
            directionNav: true,
            direction: "horizontal",
            animationLoop: false,
            slideshow: true,
            slideshowSpeed: 10800, //Integer: Set the speed of the slideshow cycling, in milliseconds
            animationSpeed: 1800, //Integer: Set the speed of animations, in milliseconds
            itemWidth: 1000,
            itemHeight: 222,
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: false,
            sync: "#carousel"
        });



        //        Галерея в товарах
        $('#carousel2').flexslider({
            animation: "slide",
            slideshow: false,
            itemWidth: 110,
            itemHeight: 109,
            itemMargin: 5,
            controlNav: false,
            directionNav: true,
            direction: "vertical",
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: false,
            animationLoop: true,
            asNavFor: '#slider2'
            
            
            
            
        });
        $('#slider2').flexslider({
            //          animation: "slide",
            controlNav: false,
            directionNav: false,
            direction: "vertical",
            animationLoop: true,
            slideshow: false,
            slideshowSpeed: 6000, //Integer: Set the speed of the slideshow cycling, in milliseconds
            animationSpeed: 1800, //Integer: Set the speed of animations, in milliseconds
            itemWidth: 450,
            itemHeight: 450,
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: false,
            sync: "#carousel2"
        });
        
        
        //        карусель похожих товаров
            $('#towars').flexslider({
            animation: "slide",
            controlNav: true,
            animationLoop: false,
            slideshow: false,
            itemWidth: 207,
            itemHeight: 444,
            itemMargin: 30,
            controlNav: false,
            directionNav: true,
            direction: "horizontal",
            slideshow: true,
            // useCSS must be unenabled for remove bug from floating text-block on slides
            useCSS: false
            
        });
        
        
        
    }


    //////////////////////////////////////////
    // сворачивание/разворачивание каталога //
    //////////////////////////////////////////
    $(document).ready(function () {
        $('ul#my-menu ul').each(function (i) { // Check each submenu:
            //            $(this).prev().removeClass('expanded').addClass('collapsed');
            //$(this).css('display', 'none');
            $(this).prev().addClass('collapsible').click(function () { // Attach an event listener
                $(this).parent().addClass('bgdarked');
                var this_i = $('ul#my-menu ul').index($(this).next()); // The index of the submenu of the clicked link
                if ($(this).next().css('display') == 'none') {
                    $(this).next().slideDown(200, function () { // Show submenu:
                        $(this).prev().removeClass('collapsed').addClass('expanded');
                    });
                } else {
                    $(this).next().slideUp(200, function () { // Hide submenu:
                        $(this).parent().removeClass('bgdarked');
                        $(this).prev().removeClass('expanded').addClass('collapsed');
                    });
                }
                return false; // Prohibit the browser to follow the link address
            });
        });
    });



    ///////////////////////////////
    // initializ_slider_jqueryUI //
    ///////////////////////////////

    $(".slider-range").each(function () {
        var id = $(this).attr('id');
        var max_val = "#max_" + id;
        var min_val = "#min_" + id;
        var value_min = parseInt($(min_val).attr('placeholder'));
        var value_max = parseInt($(max_val).attr('placeholder'));
        var max = parseInt($(max_val).attr('rel'));

        $(this).slider({
            range: true,
            min: 0,
            max: max,
            values: [value_min, value_max],
            slide: function (event, ui) {
                $(min_val).val(ui.values[0]);
                //                $( ".min_val" ).attr("class","min_val"+unic_nubr);

                $(max_val).val(ui.values[1]);
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





    //sort goods
    if ($("div#catalog_list").hasClass('cat_item_list')) {
        $("img.plitka_view").addClass('selected_type_view');
    } else {
        $("img.spisok_view").addClass('selected_type_view');
    }
    $("img.plitka_view").click(function () {
        $("div#catalog_list").addClass('cat_item_list');
        $(this).addClass('selected_type_view');
        $("img.spisok_view").removeClass('selected_type_view');
    });
    $("img.spisok_view").click(function () {
        $("div#catalog_list").removeClass('cat_item_list');
        $(this).addClass('selected_type_view');
        $("img.plitka_view").removeClass('selected_type_view');
    });

    //	увеличение-уменьшение колличества товаров в корзине
    var picecountButt_plus = jQuery(".input_pice_count_plus");
    var picecountButt_minus = jQuery(".input_pice_count_minus");

    picecountButt_plus.click(function () {
        var cur_value = $(this).parent().parent().children().children('.input_pice_count').attr('value');
        cur_value = parseInt(cur_value) + 1;
        $(this).parent().parent().children().children('.input_pice_count').attr('value', cur_value);
    })

    picecountButt_minus.click(function () {
        var cur_value = $(this).parent().parent().children().children('.input_pice_count').attr('value');
        if (cur_value == 0) {
            return false;
        } else {
            cur_value = parseInt(cur_value) - 1;
            $(this).parent().parent().children().children('.input_pice_count').attr('value', cur_value);
        }
    })






    //всплывающее главное меню

    $('ul#menu li').has('ul').addClass("notemptyli");




    //    checkout radiobuttons
    $("label.emarket-delivery-784, label.emarket-delivery-808").click(function () {

        $("fieldset.personalinfo").show();
        $("fieldset.deliveryinfo").show();
        $("fieldset.commentinfo").show();
        $(".address_samov").hide();
        $("#delivery-address-new").attr('value', 'new');
        $('#radio34011').removeAttr('checked');



    });

    $("label.emarket-delivery-783").click(function () {

        $("fieldset.personalinfo").hide();
        $("fieldset.deliveryinfo").hide();
        $("fieldset.commentinfo").hide();
        $(".address_samov").show();
        $("#delivery-address-new").attr('value', '');
        $('#radio34011').attr('checked', '');
        $("input.emarket-delivery-784, input.emarket-delivery-808").removeAttr('checked');

        //            $(this).addClass('selected_type_view');
        //            $("img.plitka_view").removeClass('selected_type_view');

    });



    //    закладки в чекауте
    $("article div.ch_formblock form > span").hide(); // Скрываем содержание
    $("ul.tabsch li:first").attr("class", "active_chbtn"); // Активируем первую закладку
    $("article div.ch_formblock form > span:first").fadeIn(); // Выводим содержание

    $('article ul.tabsch li a').click(function (e) {
        e.preventDefault();
        $("article div.ch_formblock form > span").hide(); //Скрыть все сожержание
        $("ul.tabsch li").attr("class", ""); //Сброс класса
        $(this).parent().attr("class", "active_chbtn"); // Активируем закладку
        $('#' + $(this).attr('name')).fadeIn(); // Выводим содержание текущей закладки
        //        console.log("654654654");
    });





    //    обработка кнопки продолжить в чекауте
    var tabIdForButton = 2;

    $('a.checkout_btnxt').click(function (e) {
        e.preventDefault();

        $("section.cartpage_sec article ul li a[name='tab" + tabIdForButton + "']").trigger('click');
        
                        
        
    });
    

    $("a[name='tab1']").click(function () {
        tabIdForButton = 2;
//        console.log(tabIdForButton);
        $("section.cartpage_sec article div.ch_formblock form p.nexting_btn input").hide();
        $("a.checkout_btnxt").show();
        
    });


    $("a[name='tab2']").click(function () {
        tabIdForButton = 3;
//        console.log(tabIdForButton);
        $("section.cartpage_sec article div.ch_formblock form p.nexting_btn input").hide();
        $("a.checkout_btnxt").show();
    });



    $("a[name='tab3']").click(function () {
        tabIdForButton = 4;
//        console.log(tabIdForButton);
         $("section.cartpage_sec article div.ch_formblock form p.nexting_btn input").show();
        $("a.checkout_btnxt").hide();
    });
    //    КОНЕЦ обработка кнопки продолжить в чекауте
    

    
    
    //    закладки на странице товара
    $("article div.good_bookmopt > div").hide(); // Скрываем содержание
    $("article div.good_bookmopt ul.good_bookmarks li:first").attr("class", "active_chbtn"); // Активируем первую закладку
    $("article div.good_bookmopt > div:first").fadeIn(); // Выводим содержание

    $('article div.good_bookmopt ul.good_bookmarks li a').click(function (e) {
        e.preventDefault();
        $("article div.good_bookmopt > div").hide(); //Скрыть все сожержание
        $("ul.good_bookmarks li").attr("class", ""); //Сброс класса
        $(this).parent().attr("class", "active_chbtn"); // Активируем закладку
        $('#' + $(this).attr('name')).fadeIn(); // Выводим содержание текущей закладки
        //        console.log("654654654");
    });



    //    инициализация fancybox
    $(".fancybox").fancybox();
//    $("#customer_choose").fancybox();




//    раскрытие ответа на вопрос в факе
    $(".answer_showhide").click(function(){
  $(this).parent().parent().children(".answeronquestionbl").toggleClass("show_answeronquestionbl", 700, "easeOutQuint");
        $(this).parent().parent().children(".answeronquestionbl");
        return false;
});
    

    
    
//    плавные якоря в вопросах и ответах
   $('a[href*=#faq_ask]').bind("click", function(e){
      var anchor = $(this);
      $('html, body').stop().animate({
         scrollTop: $(anchor.attr('href')).offset().top
      }, 1800);
      e.preventDefault();
          return false;
   });
    
    


    
    
    
    
    
//    
});

