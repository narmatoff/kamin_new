<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <xsl:template match="page" mode="contacts">
        <li>
            <a href="{@id}">
                <xsl:value-of select="name" />
            </a>
        </li>
    </xsl:template>
    <xsl:template match="banner[@type='image']" mode="banner">
        <div class="service_block_item">
            <a href="{href}" title="{alt}" target="{@target}">
                <xsl:call-template name="thumbing">
                    <xsl:with-param name="source" select="source" />
                    <xsl:with-param name="width" select="200" />
                    <xsl:with-param name="height" select="120" /></xsl:call-template>
            </a>
            <a href="{href}">
                <xsl:value-of select="alt" />
            </a>
        </div>
    </xsl:template>
    <xsl:template match="banner[@type='html']" mode="banner">
        <xsl:value-of select="source" disable-output-escaping="yes" /></xsl:template>
    <xsl:template match="item" mode="main_slider">
        <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />
        <li class="jcarousel_li slide">
            <!-- <img src="{$template-resources}img/slides/slide1.jpg" alt="Image 1"/> -->
            <xsl:call-template name="thumbing">
                <xsl:with-param name="source" select="$page/page/properties/group/property[@name='photo']/value" />
                <xsl:with-param name="width" select="1440" />
                <xsl:with-param name="height">auto</xsl:with-param>
            </xsl:call-template><span>проект <xsl:value-of select="." /></span>
            <!-- <a href="{@link}">посмотреть проект</a> -->
        </li>
    </xsl:template>
    <!-- Случайная статья на главной -->
    <xsl:template match="udata" mode="box_info">
        <xsl:variable name="page" select="document(concat('upage://',.))/udata" />
        <div class="box box-inform">
            <h2>Полезная информация</h2>
            <ul class="list">
                <li>
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$page/page/properties/group/property[@name='header_pic']/value" />
                        <xsl:with-param name="width" select="179" />
                        <xsl:with-param name="height" select="142" /></xsl:call-template><span class="text"><a href="{$page/page/@link}"><xsl:value-of select="$page/page/properties/group/property[@name='short']/value" disable-output-escaping="yes" /></a></span>
                </li>
            </ul>
        </div>
    </xsl:template>
    <!-- Шаблон создания миниатюры -->
    <xsl:template name="thumbing">
        <xsl:param name="source" />
        <xsl:param name="width" select='60' />
        <xsl:param name="height">auto</xsl:param>
        <xsl:param name="class" />
        <xsl:param name="podpis" />
        <!--<xsl:choose> <xsl:when test="$width"> </xsl:when> <xsl:otherwise><xsl:variable name="width" select=""></xsl:variable> </xsl:otherwise></xsl:choose>-->
        <xsl:choose>
            <xsl:when test="$source">
                <xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$source,')/',$width,'/',$height,'///1/5//100'))/udata" mode="temp">
                    <xsl:with-param name="class" select="$class" />
                    <xsl:with-param name="podpis" select="$podpis" /></xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$template-resources,'img/no_image.jpg)/',$width,'/',$height,'//////100'))/udata" mode="temp">
                    <xsl:with-param name="class" select="$class" />
                    <xsl:with-param name="podpis" select="$podpis" /></xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="thumsrc">
        <xsl:param name="source" />
        <xsl:param name="width" select='60' />
        <xsl:param name="height">auto</xsl:param>
        <!--<xsl:choose> <xsl:when test="$width"> </xsl:when> <xsl:otherwise><xsl:variable name="width" select=""></xsl:variable> </xsl:otherwise></xsl:choose>-->
        <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.',$source,')/',$width,'/',$height,'//////100'))/udata/src" /></xsl:template>
    <xsl:template match="udata" mode="temp">
        <xsl:param name="class" />
        <xsl:param name="podpis" />
        <img class="{$class}" alt="{$podpis}" src="{src}" />
    </xsl:template>
    <!-- Шаблон обработки ошибок -->
    <xsl:template match="udata[@module = 'system' and @method = 'listErrorMessages']" />
    <xsl:template match="udata[@module = 'system' and @method = 'listErrorMessages'][count(items/item) &gt; 0]">
        <div class="errors">
            <h3><xsl:text>При выполнени запроса возникли следующие ошибки:</xsl:text></h3>
            <ul>
                <xsl:apply-templates select="items/item" mode="error" />
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="item" mode="error">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>
    <xsl:template match="error">
        <div class="errors">
            <h3><xsl:text>При выполнени запроса возникли следующие ошибки:</xsl:text></h3>
            <ul>
                <li>
                    <xsl:value-of select="." />
                </li>
            </ul>
        </div>
    </xsl:template>
    <!-- �агинатор -->
    <!-- Пейджер для новостей -->
    <xsl:template name="numpages">
        <xsl:param name="limit" />
        <xsl:param name="total" />
        <xsl:if test="$total > $limit">
            <xsl:apply-templates select="document(concat('udata://system/numpages/', $total, '/', $limit))/udata" mode="news-pager" /></xsl:if>
    </xsl:template>
    <xsl:template match="udata[@module = 'system' and @method = 'numpages']" mode="news-pager">
       
        <div class="breadcrumbs2_wrapper">
            <ul class="breadcrumbs2">
                <xsl:apply-templates select="toprev_link" mode="num-news" />
                <xsl:apply-templates select="items/item" mode="num-news" />
                <xsl:apply-templates select="tonext_link" mode="num-news" />
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="item[@is-active='1']" mode="num-news">
        <li><span><xsl:value-of select="." disable-output-escaping="no" /></span>
        </li>
    </xsl:template>
    <xsl:template match="item" mode="num-news">
        <li>
            <a href="{@link}">
                <xsl:value-of select="." disable-output-escaping="no" />
            </a>
        </li>
    </xsl:template>
    <xsl:template match="tonext_link" mode="num-news">
        <li><a href="{.}" class="arrow-forward"><u></u></a>
        </li>
    </xsl:template>
    <xsl:template match="toprev_link" mode="num-news">
        <li><a class="arrow-back" href="{.}"><u></u></a>
        </li>
    </xsl:template>
    <!-- формы -->
    <xsl:template match="field">
        <div>
            <label for="{@id}">
                <xsl:value-of select="@title" disable-output-escaping="no" /><em>*</em>:</label>
            <input id="{@id}" placeholder="{@tip}" name="{@input_name}" type="text" value="{.}" class="input ntSaveForms" />
        </div>
    </xsl:template>
    <xsl:template match="field[@name='country']">
        <input type="hidden" name="data[new][country]" value="4" />
    </xsl:template>
    <xsl:template match="field[type='relation']"><span class="citylabel"><xsl:value-of select="@title" disable-output-escaping="no" /></span>
        <div class="chul_towns">
            <p></p>
            <select id="{@id}" name="{@input_name}">
                <xsl:apply-templates select="values/item" mode="select_options" />
            </select>
        </div>
    </xsl:template>
    <xsl:template match="item" mode="select_options">
        <option value="{@id}">
            <xsl:if test="@selected">
                <xsl:attribute name="selected">selected</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="." />
        </option>
    </xsl:template>
    <!-- капча!!!! -->
    <xsl:template match="udata[@method='captcha']"><u>Пожалуйста, введите&br;изображенный на рисунке код:</u><u><img src="{url}{@random_string}" border="0" alt="" title="" /></u><u><input type="text" name="captcha" id="captcha" /></u>
    </xsl:template>
    
    
    
    
    <xsl:template match="udata" mode="price">
        <xsl:param name="price_for" />
        <xsl:variable name="my_var2" select="price/actual" />
        <xsl:choose>
            <xsl:when test="discount">
               
             <p class="price_word_usualy"><span><xsl:value-of select="price/original"/> </span><i class="icon-roub"></i></p>
               
                
                    <div class="goodsprice" >
						<span><xsl:value-of select="format-number($my_var2,'#')" /></span> <i class="icon-roub"></i>
                    </div>
                    
                    
                    <span class="salepercent"> - <xsl:value-of select="discount/description" disable-output-escaping="yes" /></span>
            </xsl:when>
            <xsl:otherwise>
                <div class="goodsprice">
					<span><xsl:value-of select="format-number($my_var2,'#')" /></span> <i class="icon-roub"></i>
                </div>
            </xsl:otherwise>
        </xsl:choose>
<<<<<<< HEAD
           

             

=======
>>>>>>> 37ce8d8d425dac55521f865dbe9cc165c7b3c983
        
        
        
        
<<<<<<< HEAD
		
       
		
       
		
       
		
       

=======
>>>>>>> 37ce8d8d425dac55521f865dbe9cc165c7b3c983
        
        
        
<!--         цена со скидкой-->
<!--
        <xsl:choose>
            <xsl:when test="discount">
                <span class="price_word_usualy">Обычная цена: </span>
                <font class="good_priceview_usualy">
                    <span class="good_priceview_separate" >
                        <xsl:value-of select="price/original"/>
                    </span>
                    <span class="rub">
                        <span class="rur">p<span>уб.</span>
                    </span>
                
                </font><br/>
                <span class="price_word">Cо скидкой: </span>
                <font class="good_priceview">
                    <span class="good_priceview_separate" >
                    <xsl:variable name = "my_var2" > 
                        <xsl:value-of select="price/actual"/>
                    </xsl:variable>
                    <xsl:value-of select = "format-number($my_var2,'#')" />
                    </span>
                <span class="rub">
                    <span class="rur">p<span>уб.</span>
                </span>
            </span>
        </font>
    </xsl:when>
    <xsl:otherwise>
-->
       
<!--         обычная цена-->
        
<!--        <span class="price_word_usualy"> </span><font class="good_priceview_usualy"><span class="good_priceview_separate"></span><span class="rub"><span class="rur"></span></span></font><div class="clearfix"></div><xsl:choose><xsl:when test="$price_for"><span class="price_word">Обычная цена: </span><font class="good_priceview"><span class="good_priceview_separate" ><xsl:value-of select="$price_for"/></span><span class="rub"><span class="rur">p<span>уб.</span></span></span></font><br/><span class="price_word">Ваша цена: </span></xsl:when><xsl:otherwise><span class="price_word">Цена: </span></xsl:otherwise></xsl:choose><font class="good_priceview"><span class="good_priceview_separate" ><xsl:value-of select="price/actual"/></span><span class="rub"><span class="rur">p<span>уб.</span></span></span></font></xsl:otherwise>
       
       </xsl:choose> -->
        
        
        
        
        
        
        
        
        
        
        </xsl:template>




        <xsl:template match="property" mode="dop_goods_connected">
          
            <li>
                       
                <xsl:apply-templates select="document(concat('usel://artikul/', value))/udata/page" mode="catalog_item" /> 
               
            </li>
            
        </xsl:template>

        <xsl:template match="page" mode="dop_goods_connected_tree">
          
            <li>
                       
                <xsl:apply-templates select="." mode="catalog_item" /> 
               
            </li>
            
        </xsl:template>

        <xsl:template match="ip-answer" mode="ipget">
            <xsl:value-of select="//region"/>
        </xsl:template>

        <xsl:template match="udata" mode="regions">
            
<!--
            <select name="" id="region" title="">
               <xsl:apply-templates select="page" mode="regions" />             
            </select>    
-->
            <div id="fancyreg" style="display:none;">
               <h3>Выберите ваш регион</h3>
                <ul name="" id="region" title="">
                   <xsl:apply-templates select="page" mode="regions" />             
                </ul>  
            </div>
            
                
        </xsl:template>

        <xsl:template match="page" mode="regions">
<!--
            <option value="{@id}">
                <xsl:if test="$systempage=@id">
                    <xsl:attribute name="class">first</xsl:attribute>
                     <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="name" />
            </option>      
-->
               
                
            <li id="{@id}" class="itemregion">
                <xsl:choose>
                    <xsl:when test="$systempage = 0">
                        <xsl:if test="$region-id = @id">
                            <xsl:attribute name="class">first itemregion</xsl:attribute>
                            <xsl:attribute name="selected">selected</xsl:attribute>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                         <xsl:if test="$systempage = @id">
                            <xsl:attribute name="class">first itemregion</xsl:attribute>
                            <xsl:attribute name="selected">selected</xsl:attribute>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                   
                    <xsl:value-of select="name" />
            </li>
        </xsl:template>

        <xsl:template match="page" mode="brends">
<!--
            <option value="{@id}">
                <xsl:if test="$systempage=@id">
                    <xsl:attribute name="class">first</xsl:attribute>
                     <xsl:attribute name="selected">selected</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="name" />
            </option>      
-->
<<<<<<< HEAD
              
              <xsl:variable name="uobject_country" select="extended/properties/property[@name='strana_proizvoditelya']/value/item/@id" />
                           

                
            <li id="{@id}">
               <a href="{@link}">  
               
               
				   	<xsl:call-template name="thumbing">
						<xsl:with-param name="source" select="document(concat('uobject://',$uobject_country))/udata/object/properties/group/property[@name='flag_strany']/value" />
<!--						<xsl:with-param name="class" select="country_img" />-->
						<xsl:with-param name="width" select="17" />
						<xsl:with-param name="height">12</xsl:with-param>
						<xsl:with-param name="class">country_img</xsl:with-param>
					</xsl:call-template>

               
               
               
               
               
<!--    <img src="{document(concat('uobject://',$uobject_country))/udata/object/properties/group/property[@name='flag_strany']/value}" alt="{document(concat('uobject://',$uobject_country))/udata/object/properties/group/property[@name='country_iso_code']/value}"/>-->
               
               
<!--               |<xsl:value-of select="$uobject_country" />| -->
               		<xsl:value-of select="name" />
               </a>
=======
               
                
            <li id="{@id}">
               <a  href="{@link}"> <xsl:value-of select="name" /></a>
>>>>>>> 37ce8d8d425dac55521f865dbe9cc165c7b3c983
            </li>
        </xsl:template>
        
<!-- Вывод карты на всех страницах! -->

<xsl:template name="contcat_map">
    <xsl:param name="listregionid" />
    <script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
    <script type="text/javascript">
        var myMap;
        ymaps.ready(init);

        function init () {
            myMap = new ymaps.Map('yamapsdlr', {
                center: [59.939095, 30.315868],
                zoom: 9,
                controls: ['zoomControl', 'typeSelector']
            });
            clusterer = new ymaps.Clusterer({
            preset: 'islands#invertedOrangeClusterIcons',
            groupByCoordinates: false,
            clusterDisableClickZoom: false,
            clusterHideIconOnBalloonOpen: false,
            geoObjectHideIconOnBalloonOpen: true
        });

            clusterer_dlr = new ymaps.Clusterer({
            preset: 'islands#invertedDarkOrangeClusterIcons',
            groupByCoordinates: false,
            clusterDisableClickZoom: false,
            clusterHideIconOnBalloonOpen: false,
            geoObjectHideIconOnBalloonOpen: true
        });

        cord = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'//1'))/udata/page/extended/groups/group/property[@name='koordinaty']" mode="maps" />];
        head = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'//1'))/udata/page/extended/groups/group/property[@name='nazvanie']" mode="maps" />];
        adr = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'//1'))/udata/page/extended/groups/group/property[@name='adres']" mode="maps" />];
        footer = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'//1'))/udata/page/extended/groups/group/property[@name='phone']" mode="maps" />];
        cont = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'//1'))/udata/page/extended/groups/group/property[@name='e_mail']" mode="maps" />];

        cord_dlr = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'/1/'))/udata/page/extended/groups/group/property[@name='koordinaty']" mode="maps" />];
        head_dlr = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'/1/'))/udata/page/extended/groups/group/property[@name='nazvanie']" mode="maps" />];
        adr_dlr = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'/1/'))/udata/page/extended/groups/group/property[@name='adres']" mode="maps" />];
        footer_dlr = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'/1/'))/udata/page/extended/groups/group/property[@name='phone']" mode="maps" />];
        cont_dlr = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid,'/1/'))/udata/page/extended/groups/group/property[@name='e_mail']" mode="maps" />];

            geoObjects = [];
            

            for(var i = 0, len = cord.length; i &lt; len; i++) {
                    geoObjects[i] = new ymaps.Placemark(cord[i], {balloonContentHeader:head[i], balloonContentBody:adr[i]+cont[i], balloonContentFooter:footer[i]}, {preset: 'islands#orangeIcon'});
            }

            geoObjects_dlr = [];
            
            for(var i = 0, len = cord_dlr.length; i &lt; len; i++) {
                    geoObjects_dlr[i] = new ymaps.Placemark(cord_dlr[i], {balloonContentHeader:head_dlr[i], balloonContentBody:adr_dlr[i]+cont_dlr[i], balloonContentFooter:footer_dlr[i]}, {iconLayout: 'default#image',iconImageHref:'<xsl:value-of select="$template-resources"/>img/map/map-icon-logo.png'});
            }
            clusterer_dlr.add(geoObjects_dlr);
    myMap.geoObjects.add(clusterer_dlr);
            clusterer.add(geoObjects);
    myMap.geoObjects.add(clusterer);
    pid = <xsl:value-of select="$page-id"/>; 
    if (pid == 9750){
        myMap.setCenter([60.28302266, 29.61007870], 8);
    }
    else {
        myMap.setBounds(clusterer.getBounds());
    }
    if (cord.length == 1){
        myMap.setZoom(9);
    }
        }

    </script>
</xsl:template>

<!-- Вывод карты на всех страницах! -->
                            
</xsl:stylesheet>