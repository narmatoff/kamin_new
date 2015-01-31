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

    <title>
            <xsl:choose>
                <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3236]">
                    <xsl:value-of select="result/page/name" /> в Санкт-Петербурге и Москве | Купить <xsl:value-of select="result/page/name" /> по низкой цене
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3262]">
                    <xsl:value-of select="result/page/name" /> | Купить, цены на <xsl:value-of select="result/page/name" /> в Санкт-Петербурге и Москве
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3283]">
                    <xsl:value-of select="result/page/name" /> продажа в Санкт-Петербурге и Москве
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3271] and not(result[@module='catalog'][@method='object']/parents/page[@id=11440])">
                    Каминная <xsl:value-of select="result/page/name" /> | купить в Санкт-Петербурге, Москве, Екатеринбурге, Новосибирске
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3245]">
                    <xsl:value-of select="result/page/name" /> в Санкт-Петербурге и Москве | Цена, купить, фото
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3195] and not(result[@module='catalog'][@method='object']/parents/page[@id=3196] or result[@module='catalog'][@method='object']/parents/page[@id=3197] or result[@module='catalog'][@method='object']/parents/page[@id=3198])">
                    <xsl:value-of select="result/page/name" /> в Москве и Санкт-Петербурге | Купить <xsl:value-of select="result/page/name" /> по низкой цене
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3211]">
                    <xsl:value-of select="result/page/name" /> | Купить в Санкт-Петербурге, Москве, Екатеринбурге, Новосибирске
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3204] and not(result[@module='catalog'][@method='object']/parents/page[@id=3205])">
                    <xsl:value-of select="result/page/name" /> - купить в Санкт-Петербурге и Москве | цена, доставка
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3235]">
                    <xsl:value-of select="result/page/name" /> - купить, цена
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3224]">
                    <xsl:value-of select="result/page/name" /> в Санкт-Петербурге и Москве | купить, цены, фото, отзывы
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3284]">
                    <xsl:value-of select="result/page/name" /> - купить, цены, отзывы | Санкт-Петербург, Москва, Екатеринбург, Новосибирск
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3173]">
                    <xsl:value-of select="result/page/name" /> купить в Санкт-Петербурге и Москве | цены, отзывы
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="result/@title" />
                </xsl:otherwise>
            </xsl:choose>
        </title>
        <!-- <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" /> -->
        <xsl:choose>
            <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3236]">
                <meta name="DESCRIPTION" content="{result/page/name} по низкой цене с доставкой во все регионы России. Большой выбор каминных облицовок, каминов и порталов - Домотехника" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3262]">
                <meta name="DESCRIPTION" content="Низкая цена на {result/page/name} с доставкой по России. Домотехника - это качество продоваемой продукции!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3283]">
                <meta name="DESCRIPTION" content="Купить недорого - {result/page/name} в компании Домотехника. Низкие цены, высокое качество, звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3271] and not(result[@module='catalog'][@method='object']/parents/page[@id=11440])">
                <meta name="DESCRIPTION" content="Купить в Санкт-Петербурге и Москве - {result/page/name}. Домотехника - качество с доставкой по России!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3245]">
                <meta name="DESCRIPTION" content="Купить {result/page/name} в Москве и Санкт-Петербурге - Домотехника! Качество, доставка, приезжайте к нам!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3195] and not(result[@module='catalog'][@method='object']/parents/page[@id=3196] or result[@module='catalog'][@method='object']/parents/page[@id=3197] or result[@module='catalog'][@method='object']/parents/page[@id=3198])">
                <meta name="DESCRIPTION" content="Доставка по все России - {result/page/name} в компании Домотехника. Закажите прямо сейчас в интернет-магазине!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3211]">
                <meta name="DESCRIPTION" content="Большой каталог дымоходов - Домотехника. Купить {result/page/name} с доставкой, звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3204] and not(result[@module='catalog'][@method='object']/parents/page[@id=3205])">
                <meta name="DESCRIPTION" content="Продажа: {result/page/name} по низкой цене с доставкой по всем регионам России. Домотехника - красота вашего дома!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3235]">
                <meta name="DESCRIPTION" content="Большой выбор изоляционных материалов. Купить {result/page/name} в компании Домотехника - залог качества!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3224]">
                <meta name="DESCRIPTION" content="Большой выбор изделий из мрамора! Заказать {result/page/name} можно прямо сейчас на сайте - Домотехника. Звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3284]">
                <meta name="DESCRIPTION" content="Поможем подобрать для загородного дома все - Домотехника!  Низкие цены на покупку: {result/page/name} , звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3173]">
                <meta name="DESCRIPTION" content="Купить {result/page/name} с доставкой по регионам России. Домотехника - это низкие цены и высокое качество!" />
            </xsl:when>
            <xsl:otherwise>
                <meta name="DESCRIPTION" content="{result/meta/description}" />
            </xsl:otherwise>
        </xsl:choose>
        <!-- <meta name="viewport" content="ya-title=white,ya-dock=#000000" /> -->
        <xsl:choose>
            <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3236]">
                <meta name="KEYWORDS" content="{result/page/name}, {result/page/name} купить, {result/page/name} цена, {result/page/name} фото" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3262]">
                <meta name="KEYWORDS" content="{result/page/name}, {result/page/name} цена, {result/page/name} санкт петербург, {result/page/name} москва" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object'][@method='object']/parents/page[@id=3283]">
                <meta name="KEYWORDS" content="{result/page/name}, {result/page/name} недорого, {result/page/name} дешево, {result/page/name} цена, {result/page/name} москва, {result/page/name} санкт петербург, {result/page/name} спб, {result/page/name} фото" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3271] and not(result[@module='catalog'][@method='object']/parents/page[@id=11440])">
                <meta name="KEYWORDS" content="{result/page/name}, {result/page/name} купить, {result/page/name} цена, {result/page/name} в санкт-петербурге, {result/page/name} в москве, {result/page/name} отзывы, каминная {result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3245]">
                <meta name="KEYWORDS" content="{result/page/name}, {result/page/name}купить, {result/page/name} недорого, {result/page/name} цена, {result/page/name} дешево" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3195] and not(result[@module='catalog'][@method='object']/parents/page[@id=3196] or result[@module='catalog'][@method='object']/parents/page[@id=3197] or result[@module='catalog'][@method='object']/parents/page[@id=3198])">
                <meta name="KEYWORDS" content="{result/page/name}, {result/page/name} в москве, {result/page/name} в санкт-петербурге, {result/page/name} купить, цена на {result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3211]">
                <meta name="KEYWORDS" content="{result/page/name}, купить {result/page/name}, цена {result/page/name}, в санкт-петербурге {result/page/name}, в москве {result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3204] and not(result[@module='catalog'][@method='object']/parents/page[@id=3205])">
                <meta name="KEYWORDS" content="{result/page/name}, цена {result/page/name}, {result/page/name} санкт-петербург, {result/page/name} спб, {result/page/name} москва, {result/page/name} продажа" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3235]">
                <meta name="KEYWORDS" content="{result/page/name}, купить {result/page/name}, цена на {result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3224]">
                <meta name="KEYWORDS" content="{result/page/name}, {result/page/name} цена, {result/page/name} купить, {result/page/name} санкт петербург, {result/page/name} москва" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3284]">
                <meta name="KEYWORDS" content="{result/result/page/name}, купить {result/page/name}, цена {result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3173]">
                <meta name="KEYWORDS" content="{result/result/page/name}, {result/page/name} купить, {result/page/name} цена, фото {result/page/name}" />
            </xsl:when>
            <xsl:otherwise>
                <meta name="KEYWORDS" content="{result/meta/keywords}" />
            </xsl:otherwise>
        </xsl:choose>

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

                                                        <xsl:variable name="type_id" select="document(concat('upage://',result/parents/page[position()=2]/@id))/udata/page//property[@name='tip_dannyh']/value" />

                                                        
                                                        <xsl:choose>
                                                           <xsl:when test="result/page/@parentId=0">
                                                            
                                                                <xsl:apply-templates select="document('udata://catalog/search////86')" mode="find_model">
                                                                    <xsl:with-param name="type_id">
                                                                        <xsl:value-of select="86" />
                                                                    </xsl:with-param>
                                                                </xsl:apply-templates>

                                                            </xsl:when> 
                                                            <xsl:when test="$type_id">
                                                            
                                                                 <xsl:apply-templates select="document(concat('udata://catalog/search////', $type_id))" mode="find_model">
                                                                    <xsl:with-param name="type_id">
                                                                        <xsl:value-of select="$type_id" />
                                                                    </xsl:with-param>
                                                                </xsl:apply-templates>

                                                            </xsl:when> 
                                                        <xsl:otherwise>
                                                             <xsl:variable name="type_id_other" select="document(concat('upage://',result/page/@id))/udata/page//property[@name='tip_dannyh']/value" />
                                                            <xsl:apply-templates select="document(concat('udata://catalog/search////', $type_id_other))" mode="find_model">
                                                                    <xsl:with-param name="type_id">
                                                                        <xsl:value-of select="$type_id_other" />
                                                                    </xsl:with-param>
                                                            </xsl:apply-templates>
                                                        </xsl:otherwise>
                                                        </xsl:choose>
                                                        
                                                        
                                                        
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
        



<!--<div class="page-buffer"></div>-->
        <!-- футер -->
        







        
    </div>
    <div class="clearfix"></div>
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
            <script src="{$template-resources}js/clicker.js?q=123456789098765432"></script>
            <script type="text/javascript" src="/js/site/__common.js"></script>
           <script>
                $(document).ready(function() {
                $(".itemregion").click(function () {
                    
                     
                            str = $(this).attr('id');
                            <!-- alert (str); -->

                            $.post("/contacts.php", { contacts_id: str, pid: '<xsl:value-of select="result/@pageId" />', redirection_url: '<xsl:value-of select="result/@request-uri" />' },
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

                        $.post("/contacts.php", { contacts_id: '<xsl:value-of select="$region-id" />', pid: '<xsl:value-of select="result/@pageId" />', redirection_url: '<xsl:value-of select="result/@request-uri" />' },
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

                        $.post("/contacts.php", { contacts_id: '<xsl:value-of select="$region-id" />', pid: '<xsl:value-of select="result/@pageId" />', redirection_url: '<xsl:value-of select="result/@request-uri" />' },
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