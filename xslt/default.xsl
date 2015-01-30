<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink">


    
<xsl:param name="show">0</xsl:param>

    <xsl:template match="/">


<xsl:text disable-output-escaping='yes'>
        &lt;!--[if lt IE 7]&gt;      &lt;html class="no-js lt-ie9 lt-ie8 lt-ie7"&gt; &lt;![endif]--&gt;
        &lt;!--[if IE 7]&gt;         &lt;html class="no-js lt-ie9 lt-ie8"&gt; &lt;![endif]--&gt;
        &lt;!--[if IE 8]&gt;         &lt;html class="no-js lt-ie9"&gt; &lt;![endif]--&gt;
        &lt;!--[if gt IE 8]&gt;&lt;!--&gt; &lt;html class="no-js"&gt; &lt;!--&lt;![endif]--&gt;
</xsl:text>

<html class="no-js"> <!--<![endif]-->
<head>
  
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title><xsl:value-of select="result/@title" /></title>
    <!-- <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" /> -->
    <meta name="DESCRIPTION" content="{result/meta/description}" />
    <!-- <meta name="viewport" content="ya-title=white,ya-dock=#000000" /> -->
    <meta name="KEYWORDS" content="{result/meta/keywords}" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="viewport" content="ya-title=fade,ya-dock=#00CCCC" />
    <link rel="stylesheet" href="{$template-resources}css/normalize.css"/>
    <link rel="stylesheet" href="{$template-resources}css/main.css"/>
<!--    <link rel="stylesheet" href="{$template-resources}css/test.css"/>-->
    
    
    
    <!--    less-->
<!--
    <link rel="stylesheet/less" href="{$template-resources}css/kamin.less"/>
    <script src="{$template-resources}js/less.js"></script>
-->
<!--    less-->
  
    
    
    
    <link rel="stylesheet" href="{$template-resources}css/jqui.css"/>
    <link rel="stylesheet" href="{$template-resources}css/catalog.css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>
    <script>window.jQuery || document.write('&lt;script src="{$template-resources}js/vendor/jquery-1.11.0.js">&lt;\/script>')</script>

    <link rel="stylesheet" href="{$template-resources}css/jquery.fancybox.css" media="screen" />
    
 
    <!--[if lt IE 9]>
    <script src="{$template-resources}js/vendor/html5-3.6-respond-1.1.0.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" type="text/css" href="{$template-resources}js/fancybox/jquery.fancybox.css" media="screen" />
    <script type="text/javascript">
        $(document).ready(function () {
            var cPos = document.cookie.indexOf('flash='); // Заданы ли куки?
            var flashDetectTimer = null;
            if (cPos >= 0) {
               var value = document.cookie.substr(cPos+6, 1); // flash = 1 или 0 ?
               if (!value) noFlash(); // если 0, то показать альтернативу флэшу
            } else {
               flashDetectTimer = setTimeout(detectTimeout, 1000); // 10 секунд на размышление
            }

            // Эта функция вызовется, если из флэша не было сигнала о отм, что он загружен
            function detectTimeout() {
               document.cookie = 'flash=0';
               noFlash();
            }

            // Эта функция вызовется из флэша о чем сигнализирует о своем наличии
            function flashResponse() {
               if (flashDetectTimer) clearTimeout(flashDetectTimer);
               document.cookie = 'flash=1';
            }

            // Эта функция выведет хтмл, который соответствует отключенному флэш
            function noFlash() {
               document.getElementById('flash').style.display = 'none';
               document.getElementById('noflash').style.display = 'block';
            }
        
        });
    </script>

    
   <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42148027-2', 'auto');
  ga('require', 'displayfeatures');
  ga('send', 'pageview');

</script>
</head>
<body>


    
<!--
<div>
    <button onclick="document.getElementById('player').play()">Воспроизведение</button>
    <button onclick="document.getElementById('player').pause()">Пауза</button>
    <button onclick="document.getElementById('player').volume+=0.1">Громкость +</button>
    <button onclick="document.getElementById('player').volume-=0.1">Громкость -</button>
</div> 
-->
    
    <!-- <xsl:apply-templates select="document('http://ipgeobase.ru:7020/geo?ip=144.206.192.6')" mode="ipget" /> -->
  
        <!--[if lt IE 7]>
        <p class="browsehappy">Вы используете <strong>устаревший</strong> браузер. Пожалуйста <a href="http://browsehappy.com/">обновите ваш браузер</a> для использования всех возможностей.</p>
        <![endif]-->
          <div class="main_wrapper">



        <div class="brends_block">
            <div class="brend_item focus_brand">
                <a href="/" title="камины">
                    <span class="kamin_img">
                    <!-- на фоне этого спана логотип -->
                    </span>
                    <span>Камины</span>
                </a>
                <img src="{$template-resources}img/strel_top_brands.png" height="15" width="21" alt="стрлк" class="ctrl_actv"/>
                <div class="clearfix"></div>
            </div>
            <div class="brend_item">
                <a href="/" title="камины">
                    <span class="elektrost_img">
                    <!-- на фоне этого спана логотип -->
                    </span>
                    <span>Электростанции</span>
                </a>
                <img src="{$template-resources}img/strel_top_brands.png" height="15" width="21" alt="стрлк" class="ctrl_actv"/>
                <div class="clearfix"></div>
            </div>
            <div class="brend_item ">
                <a href="#" title="камины">
                    <span class="kotli_img">
                    <!-- на фоне этого спана логотип -->
                    </span>
                    <span>Котлы</span>
                </a>
                <img src="{$template-resources}img/strel_top_brands.png" height="15" width="21" alt="стрлк" class="ctrl_actv"/>
                <div class="clearfix"></div>
            </div>
            <div class="brend_item">
                <a href="#" title="камины">
                    <span class="dimohodi_img">
                    <!-- на фоне этого спана логотип -->
                    </span>
                    <span>Дымоходы</span>
                </a>
                <img src="{$template-resources}img/strel_top_brands.png" height="15" width="21" alt="стрлк" class="ctrl_actv"/>
                <div class="clearfix"></div>
            </div>
            <div class="brend_item">
                <a href="#" title="камины">
                    <span class="stihl_img">
                    <!-- на фоне этого спана логотип -->
                    </span>
                    <span>Stihl</span>
                </a>
                <img src="{$template-resources}img/strel_top_brands.png" height="15" width="21" alt="стрлк" class="ctrl_actv"/>
                <div class="clearfix"></div>
            </div>
        </div>
        <header>
            <a href="/" class="logo" title="Домотехника - на главную"><img src="{$template-resources}img/logo.png" alt=""/></a>
            <div class="head_slogan">самый крупный поставщик<br/>каминов и топок<br/>в россии</div>
            <div class="contacts_block">
<!--                <form action="">-->
                    <a class="ul_towns fancybox" href="#fancyreg">
                        <p></p>
                        <xsl:apply-templates select="document('usel://regions')/udata" mode="regions" />
                        
                    </a>
<!--                </form>-->
                <xsl:if test="$systempage = 0">
                    <div class="region_quwstion_selct">
                        <p>Угадали Ваш регион?</p>
                        <div>
                            <a class="yesregion" href="javascript://">ДА</a>
                            <a class="noregion" href="javascript://">Нет</a>
                        </div>
<!--                        <span>От выбранного города зависят цены, наличие товара и способы доставки</span>-->
                    </div>
                </xsl:if>
                <span class="h_phone_number">
                    <span></span>
                    <xsl:choose>
                        <xsl:when test="$systempage = 0">
                                <xsl:choose>
                                    <xsl:when test="$regionsystem/properties/group/property[@name='phone']">
                                        <xsl:value-of select="$regionsystem/properties/group/property[@name='phone']/value" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        8-800-555-444-0
                                    </xsl:otherwise>
                                </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="$system/properties/group/property[@name='phone']">
                                            <xsl:value-of select="$system/properties/group/property[@name='phone']/value" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            8-800-555-444-0
                                        </xsl:otherwise>
                                    </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                   
                </span>
            </div>
            <div class="h_dop_inf">
                <ul>
                <li>

                     <xsl:choose>
                        <xsl:when test="$systempage = 0">
                                <a href="{$regionsystem/properties/group/property[@name='dostavka']/value/page/@link}">
                                    <span></span>
                                    <xsl:value-of select="$regionsystem/properties/group/property[@name='dostavka']/value/page/name" />
                                </a>
                        </xsl:when>
                        <xsl:otherwise>
                                <a href="{$system/properties/group/property[@name='dostavka']/value/page/@link}">
                                    <span></span>
                                    <xsl:value-of select="$system/properties/group/property[@name='dostavka']/value/page/name" />
                                </a>
                        </xsl:otherwise>
                    </xsl:choose>
                   
                </li>
               <li>
                        <xsl:choose>
                        <xsl:when test="$systempage = 0">
                                <a href="{$regionsystem/properties/group/property[@name='kak_oformit_zakaz']/value/page/@link}">
                                    <span></span>
                                    <xsl:value-of select="$regionsystem/properties/group/property[@name='kak_oformit_zakaz']/value/page/name" />
                                </a>
                        </xsl:when>
                        <xsl:otherwise>
                                <a href="{$system/properties/group/property[@name='kak_oformit_zakaz']/value/page/@link}">
                                    <span></span>
                                    <xsl:value-of select="$system/properties/group/property[@name='kak_oformit_zakaz']/value/page/name" />
                                </a>
                        </xsl:otherwise>
                        </xsl:choose>
                    
                </li>
                <li>
                    <xsl:choose>
                        <xsl:when test="$systempage = 0">
                                <a href="{$regionsystem/properties/group/property[@name='gde_kupit']/value/page/@link}">
                                    <span></span>
                                    <xsl:value-of select="$regionsystem/properties/group/property[@name='gde_kupit']/value/page/name" />
                                </a>
                        </xsl:when>
                        <xsl:otherwise>
                                <a href="{$system/properties/group/property[@name='gde_kupit']/value/page/@link}">
                                    <span></span>
                                    <xsl:value-of select="$system/properties/group/property[@name='gde_kupit']/value/page/name" />
                                </a>
                        </xsl:otherwise>
                        </xsl:choose>
                    
                  
                </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </header>


        <xsl:apply-templates select="document('udata://content/menu')/udata" mode="top_menu"/>
        <div class="search_block">
            <xsl:apply-templates select="document('udata://search/insert_form')/udata" />
            
            <div class="choose_customer"><a href="#customer_choose" class="fancybox">выбрать производителя</a></div>
            
            <div class="social_btns_b">
                <div class="vk_btn"><a title="Наша группа ВКонтакте" href="#"></a></div>
                <div class="fb_btn"><a title="Наша группа в Фейсбук" href="#"></a></div>
                <div class="twt_btn"><a title="Подписывайтесь в Твиттер" href="#"></a></div>
                <div class="ytb_btn"><a title="Наш канал на Ютуб" href="#"></a></div>
                <div class="inst_btn"><a title="Подписывайтесь в Инстаграмм" href="#"></a></div>
                <div class="odnkl_btn"><a title="Наша группа в Одноклассниках" href="#"></a></div>
            </div>
            
            <div class="clearfix"></div>
        </div> 
        <!-- Place somewhere in the <body> of your page -->
        <xsl:if test="result/page/@is-default">
            <xsl:apply-templates select="document('usel://slider/')/udata" mode="slider_banner" /> 
        </xsl:if>
        <!-- каталог главной стр -->
        <xsl:apply-templates select="$errors" /> 
        <xsl:choose>
            <xsl:when test="result/@module = 'emarket'">
                       <div class="checkout_block">
                            
                            <xsl:apply-templates select="document('udata://core/navibar')/udata"  mode="bread"/>
                            <xsl:apply-templates select="result" disable-output-escaping="yes" />
                            
                        </div>

            </xsl:when>
            <xsl:otherwise>
                
                <section>
                    <xsl:choose>
                        <xsl:when test="result/page/@is-default">
                            <xsl:attribute name="class">mainpage_section</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">secondpage_section</xsl:attribute>


                            <xsl:apply-templates select="document('udata://core/navibar')/udata"  mode="bread"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- элементы каталога -->
                    <xsl:if test="result/page/@is-default">
                    
                    <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/(katalog)')/udata/items/item" mode="categorylist_main" />
                   
                    
                    </xsl:if>
                
                            <xsl:apply-templates select="result" disable-output-escaping="yes" />
                        
            
                    </section>
                    <!-- боковое меню -->
                    <aside>
                        <xsl:choose>
                            <xsl:when test="result/page/@is-default">

                                <span class="h_timed">Новости</span>
                                 <xsl:apply-templates select="document('udata://news/lastlist/5441/notemplate/5/0')/udata/items" mode="news.lents.main"/>
                               
                                <div class="aside_separate"></div>
                                <!-- видео -->
                                <span class="h_timed">Видео</span>
                                
                                <xsl:apply-templates select="document('udata://photoalbum/album_sort/9067//4?extProps=photo,h1')/udata" mode="jobs_video" />
                               
                                <div class="aside_separate"></div>
                                <!-- Наши работы -->
                                <span class="h_timed">Наши работы</span>
                                <xsl:apply-templates select="document('udata://photoalbum/album_sort/6324//4?extProps=photo,h1')/udata" mode="jobs_photo" />
                               
                                <div class="aside_separate"></div>
                                <!-- Наши работы -->
                                <span class="h_timed">Вопрос - ответ</span>
                                <xsl:apply-templates select="document('udata://faq/category/notemplate/8027?extProps=publish_time,old_name')/udata/items/item[position()=1]" mode="faq_main" />
                                
                               
                                <a href="/poleznaya_informaciya/vopros/" class="learn_more">все вопросы - ответы</a>
                                
                            </xsl:when>

                            <xsl:otherwise>
                                <xsl:attribute name="class">secondpage_asd</xsl:attribute>
                                    <xsl:if test="result/@module='catalog'">
                                        
                                            
                                       


                                        <!-- filter-->
                                        <div class="filter_block">
                                            <div class="filter_hdr">
                                                Подбор по параметрам
                                            </div>
                                            <xsl:choose>
                                                 <xsl:when test="result/@method = 'object'">
                                                        
                                                        <xsl:variable name="type_id_item" select="result/page/@type-id"/>
                                                        <xsl:apply-templates select="document(concat('udata://catalog/search////', $type_id_item))" mode="find_model">
                                                            <xsl:with-param name="type_id">
                                                                <xsl:value-of select="$type_id_item" />
                                                            </xsl:with-param>
                                                        </xsl:apply-templates>
                                                        
                                                     
                                                 </xsl:when>
                                                 <xsl:otherwise> 
                                                        
                                                         <xsl:variable name="item_id" select="document('udata://catalog/getObjectsList/notemplate////15')/udata/lines/item/@id" />

                                                        <xsl:variable name="type_id" select="document(concat('upage://', $item_id))/udata/page/@type-id" />

                                                        <xsl:apply-templates select="document(concat('udata://catalog/search////', $type_id))" mode="find_model">
                                                                <xsl:with-param name="type_id">
                                                                    <xsl:value-of select="$type_id" />
                                                                </xsl:with-param>
                                                        </xsl:apply-templates>
                                                        
                                                 </xsl:otherwise>
                                            </xsl:choose>

                                        </div>

                                        

                                    </xsl:if>
                                      

                                      <xsl:choose>
                                        <xsl:when test="result/page/@id=6325">
                                            <div class="catmenu_head">
                                                <xsl:value-of select="result/@header" />
                                            </div>
                                            <xsl:apply-templates select="document('usel://wherebuy/302')" mode="left_menu_where_buy" />
                                        </xsl:when>
                                        <xsl:when test="result/page/@parentId=0">
                                            <div class="catmenu_head">
                                                <xsl:value-of select="result/@header" />
                                            </div>
                                                <xsl:apply-templates select="document(concat('udata://content/menu/notemplate/0/', result/@pageId))/udata" mode="left_menu"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <div class="catmenu_head">
                                                <xsl:value-of select="result/parents/page[position()=1]/name" />
                                            </div>
                                            <xsl:apply-templates select="document(concat('udata://content/menu/notemplate/0/', result/parents/page[position()=1]/@id))/udata" mode="left_menu"/>
                                        </xsl:otherwise>
                                    </xsl:choose> 

                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- Новости -->
                        
                    </aside>

            </xsl:otherwise>
        </xsl:choose>
        
        <div class="clearfix"></div>
        



<div class="page-buffer"></div>
        <!-- футер -->
        







        
    </div>
    <footer>

            <ul class="dublicate_mainmenu">
                <xsl:apply-templates select="document('udata://content/menu')/udata/items/item" mode="level2contacts" />
            </ul>
            <div class="dublicate_cat">
                <span class="h_foocat">Каталог</span>
                <ul>
                    <xsl:apply-templates select="document('udata://content/menu//1/3172')/udata/items/item" mode="level2contacts" />
                </ul>
            </div>
            
     
<!-- <audio id="player" src="{$template-resources}beny.mp3" autoplay="autoplay" loop="loop" controls="controls" style="float:right;"/>-->
           
                        
                          <div class="foo_contdill">
                         <ul>
                             <li>
                                <span class="h_phone_number">
                                    <span></span>
                                     <xsl:choose>
                                        <xsl:when test="$systempage = 0">
                                                <xsl:choose>
                                                    <xsl:when test="$regionsystem/properties/group/property[@name='phone']">
                                                        <xsl:value-of select="$regionsystem/properties/group/property[@name='phone']/value" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        8-800-555-444-0
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>
                                                    <xsl:choose>
                                                        <xsl:when test="$system/properties/group/property[@name='phone']">
                                                            <xsl:value-of select="$system/properties/group/property[@name='phone']/value" />
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            8-800-555-444-0
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                             </li>
                             <li><span class="h_mail_address"></span><a href="mailto:info@kamin.ru?subject=тема письма" alt="Письмо">info@kamin.ru</a></li>
                             <li><a href="#" title="Вход для диллероа" class="diller_entry">вход для диллеров <span></span></a></li>
                             <li><img src="{$template-resources}img/ya_markt.png" height="105" width="198" alt="z"/></li>
                         </ul>
            </div>

	
            <div class="copyright">© 2014  «ДомоТехника-КАМИНЫ» <br/>
Все права защищены</div>
       		




<xsl:apply-templates select="document('udata://emarket/cart')/udata"
                                mode="basket_sticker" />
    
            
        </footer>


           
            <!-- <script type="text/javascript" src="{$template-resources}js/fancybox/jquery.fancybox.js"></script> -->
<!--            <script src="{$template-resources}js/vendor/jquery.cookie.js"></script>-->
            <script src="{$template-resources}js/jquery.fancybox.js"></script>
            <script src="{$template-resources}js/plugins.js"></script>
            <script src="{$template-resources}js/main.js"></script>
            <script src="{$template-resources}js/clicker.js"></script>
            <script type="text/javascript" src="/js/site/__common.js"></script>
           <script>
                $(document).ready(function() {
                $(".itemregion").click(function () {
                    
                     
                            str = $(this).attr('id');
                            <!-- alert (str); -->

                            $.post("/contacts.php", { contacts_id: str, pid: <xsl:value-of select="result/@pageId" /> },
                                function(data){
                                <!-- alert (data); -->
                                document.location.href = data;
                                        } );
                        
                     
                    });
                   
                }); 
            </script>

            <script>
                $(document).ready(function() {
                $(".yesregion").click(function () {
                      <!-- var str = ""; -->
                      $("#region li.first").each(function () {
                            <!-- str = $(this).val(); -->
                            <!-- alert (str); -->

                        $.post("/contacts.php", { contacts_id: <xsl:value-of select="$region-id" />, pid: <xsl:value-of select="result/@pageId" /> },
                                function(data){
<!--                                alert ('ну и славненько');-->
                                $(".region_quwstion_selct").hide();
                                <!-- document.location.href = data; -->
                                        }
                                        
                                          );
                          });
                     
                    });
                    
                                                  
                     $(".noregion").click(function () {
                      <!-- var str = ""; -->
                      $("#region li.first").each(function () {
                            <!-- str = $(this).val(); -->
                            <!-- alert (str); -->

                        $.post("/contacts.php", { contacts_id: <xsl:value-of select="$region-id" />, pid: <xsl:value-of select="result/@pageId" /> },
                                function(data){
<!--                                alert ('ну и славненько');-->
                                $(".region_quwstion_selct").hide();
                                $("a.ul_towns").trigger('click');
                                
                                
<!--                                $('select#region').trigger('click');-->
                                
                            
                                
                                
                                
                                
    
});
                                
                                
                                
                                <!-- document.location.href = data; -->
                                        } );
<!--                          });-->
                     
                    });               
                     
                      
                
                    
                    
                    
                    
                    
                    
                    
                    
                   
                }); 
            </script>

            
                    
            <!--<script type="text/javascript" src="{$template-resources}js/modulargrid.js"></script>-->
            <!-- <ul style="background-color: rgb(155, 155, 155);
                color: black;
                width: 250px;
                height: auto;
                position: fixed;
                bottom: 0;
                right: 0;
                padding: 12px;">
                <li> <a href="index.html">Главная</a></li>
                <li> <a href="catalog.html">Каталог</a></li>
                <li> <a href="good.html">Товар</a></li>
            </ul> -->
            
            
            
<!--        выбор производиттеля-->
<div id="customer_choose" style="display:none;">
               <h3>Выберите производителя</h3>
    <ul>
       <xsl:apply-templates select="document('usel://brends')/udata/page" mode="brends" />
    </ul>
</div>

        </body>
</html>


    </xsl:template>
</xsl:stylesheet>