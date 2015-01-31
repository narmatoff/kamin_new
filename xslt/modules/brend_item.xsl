<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	

	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='311']">
		<xsl:variable name="parent_obj" select="parents/page[position()=last()]/@object-id" />

        <xsl:variable name="type_id" select="document(concat('upage://',page//property[@name='kategory']/value/page/@id))/udata/page//property[@name='tip_dannyh']/value" />
        <!-- <xsl:value-of select="$type_id" /> -->

        <xsl:variable name="total" select="document(concat('usel://item_brend/', $type_id,'/', $parent_obj))/udata/total" />

        <xsl:variable name="per_page" select="12+1-1"/>
            
            
		    <article>
            	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>
                <xsl:apply-templates select="$errors" />
                <xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
        
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
            <!-- end_sort_catalog -->


            <div id="catalog_list" class="cat_item_list">
                <!--cat_item_list-->
                <!-- <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/')/udata/items/item" mode="categorylist" />  -->
               
                   
                        <xsl:apply-templates select="document(concat('usel://item_brend/', $type_id,'/', $parent_obj))/udata/page" mode="catalog_item" />
                    
            </div>
            <!--конец списка товаров-->
            <xsl:if test="$total&gt;$per_page">
              
                        
                         <a class="more_goods" id="{page//property[@name='kategory']/value/page/@id}" title="{$per_page}" rel="{$total}" alt="1" href="/280/1?p=1&amp;fields_filter[brend]={$parent_obj}">показать еще</a>
                    
              
                <!-- 
                    <xsl:call-template name="numpages">
                        <xsl:with-param name="total" select="document(concat('udata://catalog/getObjectsList/notemplate/', page//property[@name='kategory']/value/page/@id,'///15?fields_filter[brend]=', $parent_obj))/udata/total" />
                        <xsl:with-param name="limit" select="document(concat('udata://catalog/getObjectsList/notemplate/', page//property[@name='kategory']/value/page/@id,'///15?fields_filter[brend]=', $parent_obj))/udata/per_page" />
                    </xsl:call-template>  -->

                <span class="more_goods_inf">Показано 12 товаров из <xsl:value-of select="$total" /></span>
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
