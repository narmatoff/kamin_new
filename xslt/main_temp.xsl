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
    <title>Главная-ПрофиСПБ</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="/favicon.ico"></link>
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="{$template-resources}css/roboto_fontface/stylesheet.css"/>

    <link rel="stylesheet" href="{$template-resources}css/normalize.css"/>
    <link rel="stylesheet" href="{$template-resources}css/main.css"/>
    
    
    <link rel="stylesheet" href="{$template-resources}css/jquery_ui/jquery-ui-1.10.4.min.css"/>
    
    
  
    
    
    <script src="{$template-resources}{$template-resources}js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">Вы используете <strong>устаревший</strong> браузер. Пожалуйста <a href="http://browsehappy.com/">обновите ваш браузер</a> для использования всех возможностей сайта.</p>
<![endif]-->



<xsl:apply-templates select="document('http://cd78273.tmweb.ru/otz.php')/opinion-list" mode="opinion-list" />

<div class="main_wrapper">
    <header>
        <div class="top_line">
            <div class="top_line_content">
                <div class="top_line_content_address">
                    <img src="{$template-resources}img/top_line_location_icon.png" alt="адр"/>
                    <span><xsl:value-of select="$system/properties/group/property[@name='adres']/value"/></span>
                </div>
                <div class="top_line_content_contacts">
                    <img src="{$template-resources}img/top_line_phone_icon.png" alt="тел"/>
                    <span><xsl:value-of select="$system/properties/group/property[@name='telefon']/value"/></span>
                </div>


                <div class="login_registration_on_top">
                    <a class="fancybox" href="#data" title=""></a>
                </div>

               <div style="display:none">
                <div id="data" style="background-color: #fff; width: 750px; height: 380px;">
                    <xsl:apply-templates select="result/user" mode="login_button"/>
                </div>
            </div>



            <span class="searchform_wrapper">
                <form method="get" action="/search/search_do" class="searchform">
                    <label>
                        <input type="search" name="search_string" placeholder="Поиск" class="search_input" title="поиск по сайту"/>
                    </label>
                    <span title="начать поиск" class="searchbutton"></span>
                </form>
            </span>



            </div>
        </div>

        <nav>
                    <a href="/" title="ПрофиСпб - Главная страница">
                        <img src="{$template-resources}img/logo.png" alt="Логотип Профи Спб"/>
                    </a>
                    <xsl:apply-templates select="document('udata://content/menu')/udata" mode="top_menu"/>
        </nav>
    <xsl:if test="result/page/@is-default">
        <div class="jcarousel-wrapper">
            <div class="jcarousel slidewrap2">
                <ul class="jcarousel_ul slider">
                     <xsl:apply-templates select="document('udata://system/getFilteredPages/77/(vyvodit_na_glavnoj)/1/')/udata/items/item" mode="main_slider" />
                    
                </ul>
                <span class="yaktoh1">
                    <a href="#h1_ofpage"></a>
                </span>
            </div>
        </div>
   </xsl:if>
</header>
<xsl:if test="result/@pageId='11'">
<div class="contact_map">
    <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=7_B_Ip-S_LsIWmEIXofcHEF5VOmWXHbd"></script>
</div>
</xsl:if>

<div>
    <xsl:choose>
        <xsl:when test="result/page/@is-default">
            <xsl:attribute name="class">main_page_content</xsl:attribute>
        </xsl:when>
        <xsl:when test="result/@pageId='11'">
            <xsl:attribute name="class">page_contacts</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
             <xsl:attribute name="class">page_content</xsl:attribute>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="result/@module!='catalog' or result/@module!='photoalbum'">
       <span id="h1_ofpage" class="h1_ofpage"><xsl:value-of select="result/@header"/></span> 
    </xsl:if>
  
  
        
  
           <xsl:apply-templates select="result" disable-output-escaping="yes" /> 

      
    
    <div class="clearfix"></div>
</div>

 <xsl:if test="result/page/@is-default">
    <div class="mainpage_projects">
        <h2>Наши работы</h2>
        <div class="our_works">
         
            <xsl:apply-templates select="document('udata://photoalbum/albums/notemplate/4/0/4')/udata/items/item" mode="photoalbum_list_mainpage" />  
            <div class="clearfix"></div>

        </div>
    </div>



    <div class="mainpage_contacts">
        <h2>Контакты</h2>
        <div class="main_page_address_block">
            <p>Адрес:</p>
            <p><xsl:value-of select="$system/properties/group/property[@name='adres']/value"/></p>
            <p>Телефон:</p>
            <p><xsl:value-of select="$system/properties/group/property[@name='telefon']/value"/></p>
            <p>E-mail:</p>
            <p><xsl:value-of select="$system/properties/group/property[@name='email']/value"/></p>
        </div>

        <div class="main_page_formblock">
            <xsl:apply-templates select="document('udata://webforms/add/121')/udata"  mode="form" />
        </div>
        <div class="clearfix"></div>

    </div>



</xsl:if>
</div>



<footer>
    <a class="footer_logo" href="#" title=""><img src="{$template-resources}img/footer_logo.png" alt=""/></a>
    <div class="footer_elements">
        <div class="footerlogo_block">
            <span>© 2011 ООО «ПРОФИ».</span>
        </div>
        <div class="footeraddress_block">
            <span>Санкт-Петербург,<br/>
<xsl:value-of select="$system/properties/group/property[@name='adres']/value"/><br/>
Тел.: <xsl:value-of select="$system/properties/group/property[@name='telefon']/value"/><br/>
E-mail: <xsl:value-of select="$system/properties/group/property[@name='email']/value"/></span>
        </div>
        <div class="footersearch_block">

                        <span>Создание сайта: lum.ru</span>






        </div>
        <div class="clearfix"></div>
    </div>
</footer>












<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>-->
<!--<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.js"><\/script>')</script>-->
<!--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>-->


<script src="{$template-resources}js/vendor/jquery-1.8.0.min.js"></script>
<script src="{$template-resources}js/vendor/jquery-ui-1.9.2.custom.min.js"></script>


<script src="{$template-resources}js/plugins.js"></script>
<script src="{$template-resources}js/main.js"></script>
</body>
</html>


	</xsl:template>
</xsl:stylesheet>