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

<html class="no-js" xmlns="http://www.w3.org/1999/html"> <!--<![endif]--> 
    <head>
        <meta charset="utf-8"/>
        <link rel="shortcut icon" href="/favicon.ico"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <xsl:if test="result/@module = 'search' and result/@method = 'search_do'">
            <meta name="robots" content="noindex, follow" />
        </xsl:if>
        <xsl:choose>
        <xsl:when test="result[@module='catalog']/page/properties/group[@name='common']/property[@name='title']/value = result/@header">
          <title><xsl:value-of select="result/@header" />: цена, купить, прайс</title>
         </xsl:when>
         <xsl:otherwise>
          <title><xsl:value-of select="result/@title" /></title>
         </xsl:otherwise>
        </xsl:choose>
        
        
        <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />

        <xsl:choose>
        <xsl:when test="not (result[@module='catalog']/page/properties/group[@name='common']/property[@name='meta_descriptions'])">
          <meta name="DESCRIPTION" content="Купить {result/@header} по низким ценам и в отличном качестве! Звоните и заказывайте!" />
         </xsl:when>
         <xsl:otherwise>
          <meta name="DESCRIPTION" content="{result/meta/description}" />
         </xsl:otherwise>
        </xsl:choose>

        <xsl:choose>
        <xsl:when test="not (result[@module='catalog']/page/properties/group/property[@name='meta_keywords'])">
          <meta name="KEYWORDS" content="{result/page/name}, {result/page/name} купить, {result/page/name} цена, {result/page/name} аккумулятор, {result/page/name} price, {result/page/name} отзывы, батарея аккумуляторная {result/page/name}" />
         </xsl:when>
         <xsl:otherwise>
          <meta name="KEYWORDS" content="{result/meta/keywords}" />
         </xsl:otherwise>
        </xsl:choose>
        
        <meta name="viewport" content="width=device-width"/>

        <link rel="stylesheet" href="{$template-resources}css/normalize.min.css"/>
        <link rel="stylesheet" href="{$template-resources}css/font/font.css"/>
        <link rel="stylesheet" href="{$template-resources}css/jquery.formstyler.css"/>
        <link rel="stylesheet" href="{$template-resources}css/main.css"/>
        
        <script src="{$template-resources}js/vendor/modernizr-2.6.2.min.js"></script>
        <xsl:if test="$systempage=0">
        <script>
           
                    var delay_popup = 500;
                    setTimeout("document.getElementById('parent_popup').style.display='block'", delay_popup);
           
        </script>
        </xsl:if>
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		  ga('create', 'UA-42068859-1', 'wybor-battery.com');
		  ga('send', 'pageview');

		</script>
       
    </head>
    <body> 

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter7107967 = new Ya.Metrika({id:7107967,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/7107967" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->


<header>
    <div class="logo-region">

        <a href="/" title="Промышленные аккумуляторные батареи - Главная страница">
            <xsl:if test="result/page/@is-default=1">
                <xsl:attribute name="href">
                    #
                </xsl:attribute>
            </xsl:if>
            <img src="{$template-resources}img/logo.png" alt=""/>
            
        </a>
        <div class="gorodophone">
                <span class="gorodec" style="203px">Ваш город: <a href="javascript://" onclick="anichange('.townsandcyties'); return false"><xsl:value-of select="$system/properties/group/property[@name='h1']/value" /> <b>&#9660;</b></a></span>
            <div class="townsandcyties">
                <ul>
                    <xsl:apply-templates select="document('usel://cantacts')/udata/page" mode="contacts" />
                </ul>
            </div>  
            <!-- <xsl:value-of select="$systempage"/> -->
            <span class="phonec"><xsl:value-of select="$system/properties/group/property[@name='telefon']/value" /></span>
            </div>
    </div>
</header>
       
        <!--главное меню-->

        <div class="mainmenuback">
        <nav>
            <a href="/" title="Домой" class="tohomeimg">
                <xsl:if test="result/page/@is-default=1">
                    <xsl:attribute name="href">
                        #
                    </xsl:attribute>
                </xsl:if>
                <img src="{$template-resources}img/homeimg.png"/>
            </a>
            <xsl:apply-templates select="document('udata://content/menu///')/udata" mode="top_menu"/>
            <xsl:apply-templates select="document('udata://search/insert_form')/udata" />

            <div style="clear:both"></div>

        </nav>
            </div>
 
        <!--слайдер-->
        <xsl:if test="result/page/@is-default=1">
            <div class="mediahead_main" style="overflow: hidden; width: 100%;">
                <span class="prev_slide"><a href="#sliderName" class="prev"></a></span>
                <span class="next_slide"><a href="#sliderName" class="next"></a></span>
                <div class="main_slider" id="sliderName" aria-activedescendant="carousel-1-0-slide2"
                     style="margin-left: -200%; float: left; width: 400%; -webkit-transition: margin-left 0.6s ease; transition: margin-left 0.6s ease;">
                <xsl:apply-templates select="document('udata://system/getFilteredPages/82/(vyvodit_na_glavnoj)/1/')/udata/items/item" mode="main_slider" />
            </div>
            </div>
        </xsl:if>
        <div class="main_contentblock">
            <xsl:if test="not(result/page/@is-default=1)">
                <xsl:apply-templates select="document('udata://core/navibar')/udata"  mode="bread"/>
            </xsl:if>

            
    <h1>
         <xsl:if test="result/page/@is-default=1">
           <xsl:attribute name="class">h1_mainpage</xsl:attribute> 
         </xsl:if>
        <xsl:value-of select="result/@header" />
    </h1>
            <xsl:if test="result/page/@is-default=1">
                <div class="horline"></div>
            </xsl:if>
            
            <xsl:choose>
                <xsl:when test="not(result/page/@type-id='116')">
                    <section>
                        <xsl:if test="result/page/@type-id='83'">
                           <xsl:attribute name="style">
                                width: 100%
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="not (result/page/@is-default=1)">
                            <div class="horline"></div>
                        </xsl:if>
                        <article>
                        <xsl:apply-templates select="result" disable-output-escaping="yes" />
                        
                        </article>
                    </section>
                <xsl:if test="not(result[@module = 'catalog' and @method = 'object'])">
                    <xsl:choose>
                        <xsl:when test="result/page/@type-id='7'">
                            <aside class="notmain">
                                <div class="asideheader">Бренды</div>
                                <section>

                                      <xsl:apply-templates select="document('udata://system/getFilteredPages/82/(vyvodit_na_glavnoj)/1/')/udata/items/item" mode="brend_for_news" />
                                   
                                   
                                </section>
                            </aside>


                        </xsl:when>

                        <xsl:otherwise>
                        <aside>
                            <xsl:if test="not(result/page/@is-default=1)">
                               <xsl:attribute name="class">
                                    notmain
                               </xsl:attribute>
                            </xsl:if>
                            <div class="asideheader">
                                Новости
                            </div>
                            <section>
                                    <xsl:apply-templates select="document('udata://news/lastlist/6/notemplate/3')/udata/items"  mode="news.lents.main"/>
                                    <a href="/novosti" title="" class="allnews">все новости</a>
                            </section>
                        </aside> 
                        </xsl:otherwise>
                    </xsl:choose>
               
                </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="result" disable-output-escaping="yes" />
                </xsl:otherwise>
            </xsl:choose>
            

            <div class="clearfix"></div>
            <!--<div class="footerfix"></div>-->
            </div>
        <footer>
            <div class="footer_info">
                <p>Промышленные аккумуляторные батареи</p>
                <span>© 2015 ООО «Выбор»</span>
                <ul>
                     <xsl:apply-templates select="document('udata://content/menu///')/udata/items/item" mode="bottom_menu"/>
                    
                    <li>
                        <a href="/stati">Статьи</a>
                    </li>
                </ul>
            </div>
        </footer>
        <!--<footer>-->

        <!--</footer>-->










        <div id="parent_popup">
            <div id="popup">



                <div style="width: 490px ;height: 150px;" id="settttt_regions">
                    <p class="p_set_regions">Перед началом работы с каталогом товаров, укажите ваш регион.</p>

                    <p class="p_set_regions">В дальнейшем Вы всегда можете изменить выбранный регион в верхней части
                        сайта.</p>


                    <span class="gorodec" style="203px">Ваш город: <a href="javascript://" onclick="anichange('.townsandcyties2'); return false">Санкт-Петербург <b>▼</b></a></span>
                    <input class="townok2"  type="button" value="ok" />

                    <p class="p_set_regions">Во время следующего посещения регион будет выбран автоматически.</p>


                    <div class="townsandcyties2">
                    <ul>
                    <xsl:apply-templates select="document('usel://cantacts')/udata/page" mode="contacts" />
                    </ul>
                    </div>




                </div>













                <a class="close" title="Закрыть" onclick="document.getElementById('parent_popup').style.display='none';">X</a>
            </div>
        </div>







        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>
        <script src="http://jquery-ui.googlecode.com/svn/tags/latest/ui/jquery.effects.core.js"></script>
        <script>window.jQuery || document.write('&lt;script src="/templates/wybor/js/vendor/jquery-1.10.1.js">')</script>
        <script src="{$template-resources}js/jquery.formstyler.js"></script>
        <script src="{$template-resources}js/plugins.js"></script>
        <script src="{$template-resources}js/main.js"></script>
         <script>
            $(document).ready(function() {


            //всплывающее окно
                $('.townsandcyties li a').click(function () {
                    var id=$(this).attr('href')
            //      alert (id);
                    $.post("/contacts.php", { contacts_id: id },
                      function(data){
                      
                      location.reload();
                      
                      } );
                    return false;
                    
                })

                $('.townsandcyties2 li a').click(function () {
                    var id=$(this).attr('href')
                  //alert (id);
                   
                    $.post("/contacts.php", { contacts_id: id },
                      function(data){
                      
                      location.reload();
                      
                      } );
                    return false;
                    
                })
                $('.townok2').click(function () {
                
                  
                  //alert ('111111');
                   
                    $.post("/contacts.php", { contacts_id: '135' },
                      function(data){
                      
                      
                      location.reload();
                      
                      
                       
                      } );
                    return false;
                    })
                });
        </script>
       

<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'oKb3ElURSb';
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);})();</script>
<!-- {/literal} END JIVOSITE CODE -->
    </body>
</html>


	</xsl:template>
</xsl:stylesheet>