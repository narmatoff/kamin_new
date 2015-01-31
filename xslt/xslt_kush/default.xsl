<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>
    <xsl:template match="/">
      
        <html>
            <head 
			
			
				<xsl:choose>
					<xsl:when test="result[@module='catalog'][@method='object']">
						<title><xsl:value-of select="result/page/properties/group/property[@name='h1']/value"/>:  цена, купить, харатеристики, отзывы.</title>
						<meta name="DESCRIPTION" content="Выгодно купить: {result/page/properties/group/property[@name='h1']/value}. Наша продукция выского качества и по доступным ценам. Звоните!" />
						<meta name="KEYWORDS" content="{result/page/properties/group/property[@name='h1']/value} цена, {result/page/properties/group/property[@name='h1']/value} куплю, {result/page/properties/group/property[@name='h1']/value} характеристики, {result/page/properties/group/property[@name='h1']/value} производство, {result/page/properties/group/property[@name='h1']/value} прайс, {result/page/properties/group/property[@name='h1']/value} фото" />
					</xsl:when>
					<xsl:otherwise>
						<title><xsl:value-of select="result/@title" /></title>
						<meta name="DESCRIPTION" content="{result/meta/description}" />
						<meta name="KEYWORDS" content="{result/meta/keywords}" />
					</xsl:otherwise>
				</xsl:choose>

                <xsl:if test="$p&gt;0">
                    <meta name="Robots" content="NOINDEX, FOLLOW" />
                </xsl:if>
                <link rel="shortcut icon" href="{$template-resources}favicon.ico" type="image/x-icon"/>
                <link rel="stylesheet" href="{$template-resources}css/style_design140513.css" media="screen"
                      type="text/css"/>
				<script src="//yandex.st/share/cnt.share.js"></script>
                <link rel="stylesheet" href="{$template-resources}javascript/fancybox/jquery.fancybox-1.3.4.css" type="text/css"
                      media="screen"/>
                <link rel="stylesheet" href="{$template-resources}css/jquery-ui.css" type="text/css"
                      media="screen"/>
                <!-- <link href="{$template-resources}css/ie.css" rel="stylesheet" type="text/css"/> -->
                <script type="text/javascript" src="{$template-resources}js/jquery.js"></script>
                <script type="text/javascript" src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


               <!--  <script language="javascript" src="{$template-resources}js/AC_RunActiveContent.js"   type="text/javascript"></script> -->
                <script type="text/javascript" src="{$template-resources}javascript/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
                <script type="text/javascript" src="{$template-resources}javascript/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
                <script type="text/javascript"
                        src="{$template-resources}js/powerSlide.js"></script>
                <script type="text/javascript"
                        src="{$template-resources}js/scripts.js"></script>
                <script type="text/javascript" src="{$template-resources}js/jquery.autocomplete.js"></script>
                
               <script type="text/javascript" src="/js/site/__common.js"></script> 


                <script type="text/javascript">
                    $(document).ready(function() {
                        $("a#ajax_reg").fancybox();
                        $("a#ajax").fancybox();
                        $("a.gallery").fancybox();
						$(".tip5").fancybox({
							'scrolling'		: 'no',
							'titleShow'		: false,
							'onClosed'		: function() {
								$("#login_error").hide();
							}
						});
                    });
                </script>
                <!-- <script src="{$template-resources}js/easing.js" type="text/javascript"></script> -->
                <!-- <script type="text/javascript" src="http://chat.krible.ru/code/b9b2964bcb8b15a99008df281628be93.js"></script> -->
               <!--  <style type="text/css">#krible { width:250px; height:370px; position:fixed;
                    bottom:-400px; z-index:1000; display:block; }.krible_right { right:0px;
                    }.krible_left { left:0px; }
                </style> -->
                <script type="text/javascript">

                    $(document).ready(function(){
                    $(".main_leftheader").svrazv(speed=300, easing="easeInCirc");
                    });

                </script>
                <!--Для слайдера-->
                                <!--[if IE]>
                 <link href="{$template-resources}css/ie.css" rel="stylesheet" type="text/css"/>
                 <![endif]-->
                <!--Для слайдера-->
               

            </head>
            <body id="container">
                
                <div id="wrap">
                    <div class="content">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td>
                                        <!--Шапка-->
                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                                <tr valign="middle">
                                                    <td>
                                                        <div class="logo">
                                                            <a href="/">
                                                                <img alt="СЭТ - Современные энергетические технологии"
                                                                     title="СЭТ - Современные энергетические технологии"
                                                                     src="{$template-resources}images/setlogo2.png" border="0"/>
                                                            </a>
                                                            <strong style="font-size:15px;color: #40ade2;font-family:  Verdana, sans-serif;font-style: italic; visibility: hidden;">
                                                                &#160;&#160;&#160;&#160;Чистая энергия для дома и работы
                                                            </strong>
                                                        </div>
                                                    </td>
                                                    <td align="right" height="108px" width="680px">
                                                        <div class="hinttop"><span style="color: #000; font-size:17px;font-family: Arial;">

                                                            <!--Вовод Московского адреса-->
                                                            <xsl:value-of select="document('upage://175')/udata/page/properties/group/property[@id=391]/value" disable-output-escaping="yes" />
                                                            <!--<xsl:value-of select="document('upage://175')/udata/page/properties/group/property[@id=390]/value" disable-output-escaping="yes" />-->
                                                            </span>
                                                            <!--Вывод московского телефона-->
                                                            &#160;<xsl:value-of select="document('upage://175')/udata/page/properties/group/property[@id=393]/value" disable-output-escaping="yes" />

                                                            <br/>
                                                            <span style="color: #000; font-size:17px;font-family: Arial;">
                                                            <!--Вывод Питерского адреса-->
                                                            <xsl:value-of select="document('upage://175')/udata/page/properties/group/property[@id=390]/value" disable-output-escaping="yes" />
                                                            </span>
                                                            <!--Вывод питерского телефона-->
                                                            &#160;<xsl:value-of select="document('upage://175')/udata/page/properties/group/property[@id=392]/value" disable-output-escaping="yes" />
                                                            <!--<br/>-->
                                                            <!--(812) 920-62-03-->
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <!--меню -->
                                        <xsl:apply-templates select="document('udata://content/menu/0/2/katalogi')/udata" mode = "menu"/>
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                                <tr class="grad">
                                                    <td style="vertical-align: bottom;" align="center">&#160; </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <!--/Шапка-->
                                        
                                        <!--Table-->
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                                <tr>
                                                    <!--Левая колонка-->
                                                    <td class="center_left" valign="top">
                                                        

                                                                                <!--Кнопка АКЦИИ!-->
                                                                                <table class="akcii" cellpadding="0"
                                                                                       cellspacing="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <a href="/announcesecarchive">
                                                                                                    <img alt=""
                                                                                                         src="{$template-resources}images/akcii.png"
                                                                                                         title="Наши Акции!"/>
                                                                                                </a>
                                                                                                <a></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>


                                                        <!--Левое меню-->
                                                        <div class="main_left_block_top"></div>
                                                        <xsl:apply-templates select="document('udata://content/menu/0/0/3')/udata" mode = "left_menu"/>
                                                        <div class="main_left_block_bottom"></div>
                                                        
                                                        <div class="main_left_block_top"></div>
                                                        <xsl:apply-templates select="document('udata://menu/draw/1255')/udata" mode = "left_menu_content_page"/>
                                                        <div class="main_left_block_bottom"></div>
                                                        
                                                        <div class="main_left_block_top"></div>
                                                        <xsl:apply-templates select="document('udata://menu/draw/1256')/udata" mode = "left_menu_content_page"/>
                                                        <div class="main_left_block_bottom"></div>
                                                        
                                                        <div class="main_left_block_top"></div>
                                                        <xsl:apply-templates select="document('udata://menu/draw/1257')/udata" mode = "left_menu_content_page"/>
                                                        <div class="main_left_block_bottom"></div>

                                                        
                                                        
                                                        <!--vkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvk-->
                                                            <script type="text/javascript" src="//vk.com/js/api/openapi.js?95"></script>
                                                            <!-- VK Widget -->
                                                            <div id="vk_groups"></div>
                                                            <script type="text/javascript">
                                                                
                                                                VK.Widgets.Group("vk_groups", {mode: 1, width: "244", height: "400", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 51942193);
                                                                
                                                            </script>
                                                        <!--vkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvkvk-->
                                                        
                                                    </td>
                                                    <!--//Левая колонка-->

                                                    <!--Средняя колонка-->
                                                    <td class="center_middle" align="center" valign="top">
                                                        
                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="body" valign="top">
                                                                            <table class="breadcrumbs" width="100%" cellspacing="0" cellpadding="0">

                                                                            <xsl:if test="not(result/page/@is-default=1) and result/parents/page">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="result/parents/page[position()=1]/@id='3'">
                                                                                        <xsl:apply-templates select="document('udata://core/navibar//1/1')/udata"/>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                            <xsl:apply-templates select="document('udata://core/navibar')/udata"/>
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                                
                                                                            </xsl:if>
                                                                            </table>

                                                                            <!--Контент-->
                                                                            <xsl:apply-templates select="result"/>
                                                                            <!--фотоальбом-->

                                                                        </td>
                                                                        <!--//Средняя колонка-->
                                                                        </tr>
                                                                </tbody>
                                                            </table>
                                                        
                                                    </td>
                                                    <td valign="top">
                                                        
                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <!--Правая колонка-->
                                                                        <td class="center_right" valign="top">
                                                                            <div class="center_right_div">
                                                                                <div class="allnews"
                                                                                     style="padding-top:12px;">
                                                                                    <input class="new_goods_submit3"
                                                                                           onclick="window.location.href='http://dlr.tokanet.ru/'"
                                                                                           value="Для дилеров"
                                                                                           type="submit"/>
                                                                                    <br/>
                                                                                    <br/>
                                                                                </div>
                                                                                
                                                                                <xsl:apply-templates select="document('udata://emarket/cart')/udata" mode="basket_sticker" />
                                                                                
                                                                                
                                                                            </div>
                                                                            <div class="searchblock">

                                                                                    <table class="searchtable"
                                                                                           cellpadding="0"
                                                                                           cellspacing="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td colspan="3"
                                                                                                    class="searchstop"></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="searchleft">
                                                                                                    <img src="{$template-resources}images/searchleft.png"
                                                                                                         alt=""
                                                                                                         width="14"/>
                                                                                                </td>
                                                                                                <td class="searchcenter">

                                                                                                    <!--поиск по сайту-->
                                                                                                    <xsl:apply-templates select="document('udata://search/insert_form')/udata"/>

                                                                                                </td>
                                                                                                <td class="searchright">
                                                                                                    <img src="{$template-resources}images/searchright.png"
                                                                                                         alt=""
                                                                                                         width="16"/>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="3"
                                                                                                    class="searchbotbot"></td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>

                                                                            <!--Блок поиска модели-->
                                                                            <xsl:apply-templates select="document('udata://catalog/search/7')" mode="find_model"/>
                                                                            <!-- //Блок поиска -->

                                                                            <!-- Блок новостей -->
                                                                            <xsl:apply-templates select="document('udata://news/lastlist/(179)/0/2')/udata" mode="news"/>

                                                                            <!-- Блок спецпредложений -->
                                                                            <xsl:apply-templates select="document('udata://news/lastlist/(183)/0/2')/udata" mode="stock"/>

                                                                            <!-- Cписок сравнений -->
                                                                            <br/>
                                                                            <div class="allnews">
                                                                            </div>

                                                                            <!-- //Cписок сравнений -->
                                                                        </td>
                                                                        <!--//Правая колонка-->
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            
                                                            <!--&lt;!&ndash;//Table #1&ndash;&gt;-->
                                                          <!--<br/><br/><br/><br/>-->
                                                        <!---->
                                                         <!--<br/><br/><br/><br/>-->
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <!-- Подвал -->
                                        <div id="footer">
                                            <table class="brends_logos" border="0" cellpadding="0"
                                                   cellspacing="0" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td style="text-align:center;">
                                                            <a href="/geko_eisemann/" class="opacity">
                                                                <img alt="Электростанции Geko"
                                                                     src="{$template-resources}images/podval/GEKO.png"/>
                                                            </a>
                                                            <a href="/geko_eisemann/" class="opacity">
                                                                <img alt="Электростанции Eisemann"
                                                                     src="{$template-resources}images/podval/EISEMANN.png"/>
                                                            </a>
                                                            <a href="/genmac/" class="opacity">
                                                                <img alt="Электростанции Genmac"
                                                                     src="{$template-resources}images/podval/GENMAK.png"/>
                                                            </a>
                                                            <a href="/rid/" class="opacity">
                                                                <img alt="RID" src="{$template-resources}images/podval/RID.png"/>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="footerlinks">&#160;</div>
                                            <div class="footseparate"></div>
                                            <div class="footercopy">ООО «Современные Энергетические Технологии»
                                                <br/>
                                                Copyright © 2006—2014
                                            </div>

                                        </div>
                                        <!-- //Подвал -->




                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <script src="{$template-resources}js/svrazv.js" type="text/javascript"></script>
            
                <script type="text/javascript"
                        src="{$template-resources}js/modernizr-1.7.min.js"></script>
                <script type="text/javascript" src="http://tokanet.ru/share24/share42.js"></script>
                <script>
                  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

                  ga('create', 'UA-42155587-1', 'tokanet.ru');
                  ga('send', 'pageview');

                </script>
                
                <!-- Yandex.Metrika counter -->
                <script type="text/javascript">
                    (function (d, w, c) {
                        (w[c] = w[c] || []).push(function() {
                            try {
                                w.yaCounter14720374 = new Ya.Metrika({id:14720374, enableAll: true, webvisor:true});
                            } catch(e) {}
                        });
                        var n = d.getElementsByTagName("script")[0],
                                s = d.createElement("script"),
                                f = function () { n.parentNode.insertBefore(s, n); };
                        s.type = "text/javascript";
                        s.async = true;
                        s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";
                        if (w.opera == "[object Opera]") {
                            d.addEventListener("DOMContentLoaded", f);
                        } else { f(); }
                    })(document, window, "yandex_metrika_callbacks");
                </script>
                <noscript><div><img src="//mc.yandex.ru/watch/14720374" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
                <!-- /Yandex.Metrika counter -->
				<link href="https://clients.streamwood.ru/StreamWood/sw.css" rel="stylesheet" type="text/css" />
				<script type="text/javascript" src="https://clients.streamwood.ru/StreamWood/sw.js" charset="utf-8"></script>
				<script type="text/javascript">
				  swQ(document).ready(function(){
					swQ().SW({
					  swKey: 'c1e247e2235eb596c080297d6903cf39',
					  swDomainKey: '15adfe1bb4335e5a24205df427f9be0e'
					});
					swQ('body').SW('load');
				  });
</script>

        </body>
    </html>
   
</xsl:template>
        </xsl:stylesheet>