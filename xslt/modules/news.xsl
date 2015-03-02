<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- лента новостей на главной -->
   
    <xsl:template match="items" mode="news.lents.main">
        <ul>
            <xsl:apply-templates select="item" mode="news.lents.main" />
        </ul><a href="/testovaya" class="learn_more">все новости</a>
    </xsl:template>
    
    <xsl:template match="item" mode="news.lents.main">
        <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />
        <li><span class="aside_date"><xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, '/(d.m.Y)'))/udata" disable-output-escaping="yes"/></span>
            <a href="{@link}" title="">
                <xsl:value-of select="$page/page/name" disable-output-escaping="yes" />
            </a>
        </li>
    </xsl:template>
    <!-- лента новостей слева -->
    
    <xsl:template match="items" mode="news.lents">
        <xsl:apply-templates select="item" mode="news.lents" />
    </xsl:template>

    <xsl:template match="item" mode="news.lents">
        <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />
        <li><span class="aside_date"><xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, '/(d.m.Y)'))/udata"  disable-output-escaping="yes"/></span>
            <a href="{@link}" title="">
                <xsl:value-of select="$page/page/name" disable-output-escaping="yes" />
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="item" mode="news">
        <div class="newsblock">
            <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />

           
           
              <span class="dateofnews">
               
               <xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, '/(d)'))/udata"  disable-output-escaping="yes"/>
              
                <xsl:choose>
                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 1"> января</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 2"> февраля</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 3"> марта</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 4"> апреля</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 5"> мая</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 6"> июня </xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 7"> июля </xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 8"> августа</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 9"> сентября</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 10"> октября</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 11"> ноября</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 12"> декабря</xsl:when>
                        </xsl:choose>
                        <br/>

                <xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, '/(Y)'))/udata"  disable-output-escaping="yes"/>
            </span>
            
            <div class="newsfromdatemarg">
            <h3><a href="{@link}"><xsl:value-of select="."/></a></h3>
                        <xsl:if test="$page/page/properties/group/property[@name='publish_pic']/value">
                <a class="newsaimg" href="{@link}">
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$page/page/properties/group/property[@name='publish_pic']/value" />
                        <xsl:with-param name="width" select="150" />
                        <xsl:with-param name="height">200</xsl:with-param>
                    </xsl:call-template>
                </a>
            </xsl:if>



            <xsl:value-of select="$page/page/properties/group/property[@name='anons']/value" disable-output-escaping="yes" />
                       <div class="clearfix"></div>
            </div>
             <div class="clearfix"></div>
<!--            <div class="clearfix"></div>-->
<!--            <a class="newsmorelink" href="{@link}">подробнее</a> -->
        

            <!-- <div class="news"><span>[<xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, '/(d.m.Y)'))/udata"  disable-output-escaping="yes"/>]</span>&br;<strong><xsl:value-of select="$page/page/properties/group/property[@name='h1']/value" disable-output-escaping="yes"/></strong>&br;<xsl:value-of select="$page/page/properties/group/property[@name='anons']/value" disable-output-escaping="yes"/><a  href="{@link}" ><strong>[...]</strong></a></div>&br;	 -->
<!--            <div class="clearfix"></div>-->
        </div>
         
    </xsl:template>
<!-- Новости в салонах... -->
       <xsl:template match="page" mode="news_salon">
        <div class="newsblock">
            <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />

           
           
              <span class="dateofnews">
               
               <xsl:value-of select="document(concat('udata://system/convertDate/', @update-time, '/(d)'))/udata"  disable-output-escaping="yes"/>
              
                <xsl:choose>
                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 1"> января</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 2"> февраля</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 3"> марта</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 4"> апреля</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 5"> мая</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 6"> июня </xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 7"> июля </xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 8"> августа</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 9"> сентября</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 10"> октября</xsl:when>
                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 11"> ноября</xsl:when>

                        <xsl:when test="document(concat('udata://system/convertDate/', @update-time, './(n)'))/udata = 12"> декабря</xsl:when>
                        </xsl:choose>
                        <br/>

                <xsl:value-of select="document(concat('udata://system/convertDate/', @update-time, '/(Y)'))/udata"  disable-output-escaping="yes"/>
            </span>
            
            <div class="newsfromdatemarg">
            <h3><a href="{@link}"><xsl:value-of select="name"/></a></h3>
                        <xsl:if test="$page/page/properties/group/property[@name='publish_pic']/value">
                <a class="newsaimg" href="{@link}">
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$page/page/properties/group/property[@name='publish_pic']/value" />
                        <xsl:with-param name="width" select="150" />
                        <xsl:with-param name="height">150</xsl:with-param>
                    </xsl:call-template>
                </a>
            </xsl:if>



            <xsl:value-of select="$page/page/properties/group/property[@name='anons']/value" disable-output-escaping="yes" />
                       <div class="clearfix"></div>
            </div>
             <div class="clearfix"></div>
<!--            <div class="clearfix"></div>-->
<!--            <a class="newsmorelink" href="{@link}">подробнее</a> -->
        

            <!-- <div class="news"><span>[<xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, '/(d.m.Y)'))/udata"  disable-output-escaping="yes"/>]</span>&br;<strong><xsl:value-of select="$page/page/properties/group/property[@name='h1']/value" disable-output-escaping="yes"/></strong>&br;<xsl:value-of select="$page/page/properties/group/property[@name='anons']/value" disable-output-escaping="yes"/><a  href="{@link}" ><strong>[...]</strong></a></div>&br;     -->
<!--            <div class="clearfix"></div>-->
        </div>
         
    </xsl:template>
<!-- Новости в салонах... -->

       <xsl:template match="item" mode="stateyki">
        <div class="newsblock">
            <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />
            <xsl:if test="$page/page/properties/group/property[@name='publish_pic']/value">
                <a class="newsaimg" href="{@link}">
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$page/page/properties/group/property[@name='publish_pic']/value" />
                        <xsl:with-param name="width" select="150" />
                        <xsl:with-param name="height">auto</xsl:with-param>
                    </xsl:call-template>
                </a>
            </xsl:if>
            <h3><a href="{@link}"><xsl:value-of select="."/></a></h3>



            <xsl:value-of select="$page/page/properties/group/property[@name='anons']/value" disable-output-escaping="yes" />
            
            <a class="newsmorelink" href="{@link}">подробнее</a> 

            
            <div class="clearfix"></div>
        </div>
    </xsl:template>
       
       
       


    <xsl:template match="result[@module = 'news' and @method = 'item']">
        <article class="news_item">
            <xsl:apply-templates select="$errors" />
            <xsl:variable name="date" select="document(concat('udata://system/convertDate/', page//property[@name = 'publish_time']/value/@unix-timestamp, '/(d.m.Y)'))/udata" />
            <h1><xsl:value-of select="page/name" disable-output-escaping="yes" /></h1>
              
              
              
              
               
            <span class="opened_news_date">Дата публикации: <xsl:value-of select="$date" /></span>
            <xsl:call-template name="thumbing">
                <xsl:with-param name="source" select="page/properties/group/property[@name='publish_pic']/value" />
                <xsl:with-param name="width" select="150" />
                <xsl:with-param name="height">200</xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="page//property[@name = 'content']/value" disable-output-escaping="yes" />
            <xsl:if test="page/properties/group/property[@name='fotogalereya']/value/page">

                <xsl:apply-templates select="document(concat('udata://photoalbum/album/',page/properties/group/property[@name='fotogalereya']/value/page/@id ))/udata/items" mode="photos" />                
            </xsl:if>
            <xsl:apply-templates select="page/properties/group/property[@name='otdelnye_foto_iz_fotogalarei']/value/page" mode="only_photo" />
               
                
                
                   
                    
                     
                
                <xsl:if test="page/properties/group/property[@name='video']/value">
                    <h3>Видео</h3>
                    <ul class="content_gallery">
                        <xsl:apply-templates select="page/properties/group/property[@name='video']/value/page" mode="slider2_video" />
<!--                         <xsl:value-of select="page/properties/group/property[@name='video']/value" disable-output-escaping="yes" /> -->
                    </ul>
                </xsl:if>
                
 <xsl:if test="page/properties/group[@name='svyazannye_tovary'] or page/properties/group/property[@name='tovary']/value">
                   <div class="clearfix"></div>
                    <h3>Обратите внимание на товары, которые описаны выше</h3>
                        <div id="catalog_list" class="cat_item_list">
                            <div id="towars" class="flexslider">
                                <ul class="slides">
                                    <xsl:apply-templates select="page/properties/group[@name='svyazannye_tovary']/property" mode="dop_goods_connected" /> 
                                    <xsl:apply-templates select="page/properties/group/property[@name='tovary']/value/page" mode="dop_goods_connected_tree" /> 
                                </ul>
                            </div>
                        </div>
                </xsl:if>

        </article>
    </xsl:template>




        <xsl:template match="result[@module = 'news' and @method = 'rubric']">
            <article>
                <h1 class="dialog_par"><xsl:value-of select="@header"/></h1>
                <div class="sortnview"><span>Архив за:</span>
                    <div class="back_filter_sort">
                        <div class="select_sortnview">
                            <p>Выберите вариант</p>
                            <select name="">
                                <option class="first" value="">Все время</option>
                                <option value="">Все время2</option>
                                <option value="">Все время3</option>
                                <option value="">Все время4</option>
                            </select>
                        </div>
                    </div>
                </div>
                <xsl:choose>
                    <xsl:when test="@pageId='5441'">
                        <xsl:apply-templates select="document(concat('udata://news/lastlist/', @pageId))/udata/items/item" mode="news" />                              </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="document(concat('udata://news/lastlist/', @pageId))/udata/items/item" mode="stateyki" />                        </xsl:otherwise>
                </xsl:choose>
                <!--        <xsl:apply-templates select="document(concat('udata://news/lastlist/', @pageId))/udata/items/item" mode="news" />-->
                <xsl:call-template name="numpages">
                    <xsl:with-param name="total" select="document('udata://news/lastlist/')/udata/total" />
                    <xsl:with-param name="limit" select="document('udata://news/lastlist/')/udata/per_page" />
                </xsl:call-template>
            </article>
        </xsl:template>
<!--
        <xsl:template match="result[@module = 'news' and @method = 'rubric']">
        <article>
            <h1 class="dialog_par"><xsl:value-of select="@header"/></h1>

            <xsl:apply-templates select="document(concat('udata://news/lastlist/', @pageId))/udata/items/item" mode="statyi" />
            <xsl:call-template name="numpages">
                <xsl:with-param name="total" select="document('udata://news/lastlist/')/udata/total" />
                <xsl:with-param name="limit" select="document('udata://news/lastlist/')/udata/per_page" />
            </xsl:call-template>
        </article>
    </xsl:template>
-->
    
    
    
    
    <xsl:template match="udata[@module = 'news' and @method = 'lastlist']">
        <ul>
            <xsl:apply-templates select="items">
                <xsl:with-param name="list-class">
                    <xsl:text>news-lastlist</xsl:text>
                </xsl:with-param>
            </xsl:apply-templates>
        </ul>
    </xsl:template>
    <xsl:template match="udata[@method = 'lastlist']//item">
        <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />
        <li>
            <xsl:value-of select="." /><b><small><xsl:value-of select="$date" /></small></b>&nbsp;
            <xsl:variable name="page" select="document(concat('upage://',@id))/udata" />
            <a href="{@link}" umi:element-id="{@id}" umi:field-name="name">
                <xsl:value-of select="$page/page/properties/group/property[@name='anons']/value" disable-output-escaping="yes" />
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>