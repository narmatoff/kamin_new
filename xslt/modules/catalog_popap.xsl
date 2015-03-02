<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:xlink="http://www.w3.org/TR/xlink"
                exclude-result-prefixes="xsl date udt xlink">
 
    <xsl:output encoding="utf-8" method="html" indent="yes" />
 
   
    <xsl:template match="udata">
    <div >

                        <xsl:apply-templates select="lines"/> 

    </div>
    </xsl:template>

    <xsl:template match="lines">
        
                        <xsl:apply-templates select="item"/>
                       
                   
                            
                           
                       
             
        
    </xsl:template>
  

<!-- Товар в списке -->
    <xsl:template match="item">
        <xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
        <xsl:variable name="brand" select="$item/page/properties/group/property[@name='brend']/value/item/@id" />
        <xsl:variable name="brand_name" select="document(concat('uobject://', $brand))/udata/object" />
        
         <!--список товаров-->
        <div class="cat_item_plits">
            <!--cat_item_list-->

            <div class="maingoodinfo">
                <a class="cat_goodimage" href="{@link}">
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$item/page/properties/group/property[@name='foto_1']/value" />
                        <xsl:with-param name="width" select="201" />
                        <xsl:with-param name="height">201</xsl:with-param>
                    </xsl:call-template>
                    
                    <!--закладка распродажи-->
                    <xsl:apply-templates select="$item/page/properties/group/property[@name='akcionnyj_tovar']/title" mode="akcii_sprite"/>
                    
                    <!--закладка Акции-->
                    <xsl:apply-templates select="$item/page/properties/group/property[@name='rasprodazha']/title" mode="rasp_sprite"/>
                    
                </a>
                <h4><a href="{@link}"><xsl:value-of select="$item/page/properties/group/property[@name='nazvanie']/value"/></a></h4> 
                <span class="manufacturer_block">Производитель: 
                        <a href="{$brand_name/properties/group/property[@name='linkthis']/value}">
                            <xsl:value-of select="$item/page/properties/group/property[@name='brend']/value/item/@name" disable-output-escaping="yes"/>
                        </a>
                    </span>
                <span class="articul_block">Артикул:  
                        <a href="{@link}">
                            <xsl:value-of select="$item/page/properties/group/property[@name='artikul']/value" disable-output-escaping="yes"/>
                        </a>
                    </span>

                <p>
                    <xsl:value-of select="$item/page/properties/group/property[@name='kratkoe_opisanie']/value" disable-output-escaping="yes" />
                </p>
                <div class="clearfix"></div>
            </div>

            <xsl:choose>
                <xsl:when test="$item/page/properties/group/property[@name='common_quantity']/value&gt;0">
                    <div class="pricenbuttons">
                        <xsl:apply-templates select="document(concat('udata://emarket/price/', $item/page/@id))/udata" mode="price" />
                        <input class="buybutton" onclick="site.basket.add({@id})" id="add_basket_{@id}" type="button" value="Купить" />
                        <span class="instok">в наличии</span>
                        <!-- <span class="goodcompare"><a href="/emarket/addToCompare/{@id}">сравнить</a></span> -->
                    </div>
                    <div class="clearfix"></div>
                </xsl:when>

                <xsl:otherwise>
                    <div class="pricenbuttons">
                        <div class="goodsprice">
							<span><xsl:value-of select="$item/page/properties/group/property[@name='price']/value" disable-output-escaping="yes"/></span>
                             <i class="icon-roub"></i>
                             
                        </div>
                        <a id="{$item/page/@id}" href="#show1" class="buybutton outnstock">Под заказ</a>
                        
                        <!-- <input class="buybutton outnstock" type="button" value="Под заказ" /> -->
                        <span class="not_instok">отсутствует</span>
                        <!-- <span class="goodcompare"><a href="/emarket/addToCompare/{@id}">сравнить</a></span> -->
                    </div>
                    <div class="clearfix"></div>

                </xsl:otherwise>
            </xsl:choose>




        </div>
    </xsl:template>

     
     
     <!--    шаблоны для ации и распродаж-->
   
    <xsl:template match="title" mode="akcii_sprite">
        <span class="akcii_sprite"> 
            <xsl:value-of select="." disable-output-escaping="yes" />
        </span>
    </xsl:template>   
    
    
    
    <xsl:template match="title" mode="rasp_sprite">
        <span class="rasp_sprite"> 
            <xsl:value-of select="." disable-output-escaping="yes" />
        </span>
    </xsl:template>
    
<!--    шаблоны для ации и распродаж-->
    
    
     
     
     
     
     
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
                <xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(./templates/kamin/img/no_image.jpg)/',$width,'/',$height,'//////100'))/udata" mode="temp">
                    <xsl:with-param name="class" select="$class" />
                    <xsl:with-param name="podpis" select="$podpis" /></xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    


    <xsl:template match="udata" mode="temp">
        <xsl:param name="class" />
        <xsl:param name="podpis" />
        <img class="{$class}" alt="{$podpis}" src="{src}" />
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
                    
                    
                    <span class="salepercent">-17%</span>
            </xsl:when>
            <xsl:otherwise>
                <div class="goodsprice">
					<span><xsl:value-of select="format-number($my_var2,'#')" /></span> <i class="icon-roub"></i>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <!-- цена со скидкой
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
        обычная цена<span class="price_word_usualy"> </span><font class="good_priceview_usualy"><span class="good_priceview_separate"></span><span class="rub"><span class="rur"></span></span></font><div class="clearfix"></div><xsl:choose><xsl:when test="$price_for"><span class="price_word">Обычная цена: </span><font class="good_priceview"><span class="good_priceview_separate" ><xsl:value-of select="$price_for"/></span><span class="rub"><span class="rur">p<span>уб.</span></span></span></font><br/><span class="price_word">Ваша цена: </span></xsl:when><xsl:otherwise><span class="price_word">Цена: </span></xsl:otherwise></xsl:choose><font class="good_priceview"><span class="good_priceview_separate" ><xsl:value-of select="price/actual"/></span><span class="rub"><span class="rur">p<span>уб.</span></span></span></font></xsl:otherwise></xsl:choose> --></xsl:template>


</xsl:stylesheet>