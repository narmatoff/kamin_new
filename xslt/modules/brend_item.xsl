<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	

	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='311']">
		<xsl:variable name="parent_obj" select="parents/page[position()=last()]/@object-id" />

<!--         <xsl:variable name="type_id" select="document(concat('upage://',page//property[@name='kategory']/value/page/@id))/udata/page//property[@name='tip_dannyh']/value" /> -->
        <xsl:variable name="type_id" select=".//property[@name = 'kategory']/value/page/@id" />
        <xsl:value-of select="$type_id" />/
        <xsl:value-of select="$parent_obj" />



        <xsl:variable name="total" select="document(concat('usel://item_brend/', $type_id,'/', $parent_obj))/udata/total" />
        <xsl:variable name="per_page">
            <xsl:choose>
                <xsl:when test="$pajax"><xsl:value-of select="12 * $pajax" /></xsl:when>
                <xsl:otherwise>12</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

		    <article>
            	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>
                <xsl:apply-templates select="$errors" />
                
                <div class="text_description">
                	<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
                </div>
        
				<xsl:apply-templates select="$errors" />            
            </article>
        <article>
            

            <!-- sort_catalog    -->
            <div class="sortnview">
                <span>Сортировать по:</span>
                <!-- <div class="back_filter_sort">
                        <div class="select_sortnview">
                            <p></p>
                            <select name="">
                                <option class="first" value="">Выберите вариант</option>
                                <option value="">Вариант номер один</option>
                                <option value="">Вариант номер два</option>
                                <option value="">Вариант номер три</option>
                            </select>
                        </div>
                    </div> -->

                <div class="floatinrgh_sort">
                    <span>Вид каталога:</span>
                    <img class="plitka_view" src="{$template-resources}img/sort_plit.png" height="18" width="31" alt="плитка" />
                    <img class="spisok_view" src="{$template-resources}img/sort_list.png" height="18" width="31" alt="список" />
                </div>
            </div>
            <div class="clearfix"></div>
            <!-- end_sort_catalog -->
            <xsl:variable name="filter">
                <xsl:choose>
                    <xsl:when test="contains(@request-uri, 'fields_filter')">
                        <xsl:value-of select="substring-after(@request-uri,'?')" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="not_filer" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div id="catalog_list" class="">
                <!--cat_item_list-->
                <!-- <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/')/udata/items/item" mode="categorylist" />  -->
               <!-- упрощаем вызов шаблона, формируем строку в запрос -->
               <xsl:variable name="template_param_ajax">
                   <xsl:choose>
                       <xsl:when test="$pajax">
                           <xsl:value-of select="$pajax" />
                       </xsl:when>
                       <xsl:otherwise>
                           <xsl:value-of select="1" />
                       </xsl:otherwise>
                   </xsl:choose>
               </xsl:variable>
               <xsl:variable name="template_param_sort">
                <xsl:choose>
                    <xsl:when test="$order_filter.price = 0">descending</xsl:when>
                    <xsl:otherwise>ascending</xsl:otherwise>
                </xsl:choose>
               </xsl:variable>
                <xsl:choose>
                    <xsl:when test="($filter != not_filer)">
                        <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList//', $type_id ,'///10/280/1'))/udata" mode="catalog_item">
                            <xsl:with-param name="filter" select="$filter" />
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="document(concat('usel://item_brend/', $type_id,'/', $parent_obj, '/', $template_param_ajax*12, '/', $template_param_sort))/udata/page" mode="catalog_item" />
                    </xsl:otherwise>
                </xsl:choose>
                    
            </div>
            <!--конец списка товаров-->

            <xsl:if test="$total&gt;$per_page">
                <!-- Фильтр для сортировки -->
                <xsl:variable name="sort_param">
                    <xsl:choose>
                        <xsl:when test="$order_filter.price = 0">
                            <xsl:value-of select="0" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="1" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                        
                         <a class="more_goods" id="{page//property[@name='kategory']/value/page/@id}" title="{$per_page}" parent="15" filter="fields_filter[brend]={$parent_obj}&amp;order_filter[price]={$sort_param}" rel="{$total}" alt="1" href="?p=1&amp;fields_filter[brend]={$parent_obj}">
                            <xsl:attribute name="data-per-page">
                                <xsl:value-of select="12" />
                            </xsl:attribute>
                            <xsl:if test="$pajax">
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="$pajax" />
                                </xsl:attribute>
                            </xsl:if>
                            показать еще</a>
                    <a class="all_goods" id="{page//property[@name='kategory']/value/page/@id}_all" title="{$per_page}" parent="15" filter="fields_filter[brend]={$parent_obj}&amp;order_filter[price]={$sort_param}" rel="{$total}" alt="1" href="?p=1&amp;fields_filter[brend]={$parent_obj}">
				<xsl:attribute name="data-per-page"><xsl:value-of select="12" /></xsl:attribute>
				<xsl:attribute name="data-total"><xsl:value-of select="$total" /></xsl:attribute>
					<xsl:if test="$pajax">
                        <xsl:attribute name="alt">
                            <xsl:value-of select="$pajax" />
                        </xsl:attribute>
                    </xsl:if>
				показать все</a>
              
                <!-- 
                    <xsl:call-template name="numpages">
                        <xsl:with-param name="total" select="document(concat('udata://catalog/getObjectsList/notemplate/', page//property[@name='kategory']/value/page/@id,'///15?fields_filter[brend]=', $parent_obj))/udata/total" />
                        <xsl:with-param name="limit" select="document(concat('udata://catalog/getObjectsList/notemplate/', page//property[@name='kategory']/value/page/@id,'///15?fields_filter[brend]=', $parent_obj))/udata/per_page" />
                    </xsl:call-template>  -->

                <span class="more_goods_inf">Показано
                    <xsl:choose>
                    <xsl:when test="$pajax">
                        <xsl:value-of select="$pajax*12" />
                    </xsl:when>
                    <xsl:otherwise>12</xsl:otherwise>
                </xsl:choose>
                    товаров из <xsl:value-of select="$total" /></span>
            </xsl:if>
            
            <div id="clickerator">
                <div class="loader">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>

            <!-- <span class="more_goods_inf">Товаров всего <xsl:value-of select="document(concat('udata://catalog/getObjectsList/notemplate/', page//property[@name='kategory']/value/page/@id,'///15?fields_filter[brend]=', $parent_obj))/udata/total" /></span> -->

            
        </article>
        <div style="display:none">
            <div id="show1" style="padding: 0 30px 0 25px;" class="contscts_form popuppriceenq">
                <article>
                <p class="error">
                            
                </p>
                <form id="opaopaopapa" action="/webforms/send/" method="post">
                    
                    <div class="cartform">
                    <div id="forminputter">
                        
                        


                    </div>
                    </div>
                    
                    <div class="cart_kont_buttons">
                        <input type="submit" value="Отправить"/>
                        <div class="clearfix"></div>
                    </div>
                </form>
                 </article>                  
            </div>
        </div>
						
				
                
	</xsl:template>

	
</xsl:stylesheet>
