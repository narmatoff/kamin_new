<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:umi="http://www.umi-cms.ru/TR/umi">
						

					
	<xsl:template match="result[@module = 'photoalbum' and @method = 'album']">
        <xsl:choose>
        	<xsl:when test="page/@parentId=0">


                    <div class="catalog_items_wrapper">
                        <xsl:apply-templates select="document(concat('udata://photoalbum/albums/notemplate/0/0/', @pageId))/udata/items/item" mode="photoalbum_list_main" />  
                    </div>   


                
            </xsl:when>

            <xsl:when test="parents/page[position()=last()]/@parentId=0">
                
                <xsl:apply-templates select="document('udata://core/navibar')/udata" mode="bread" />

                <div class="catalog_maingroup2_cat_items">
                            <xsl:apply-templates select="document(concat('udata://content/menu///', page/@parentId))/udata/items/item" mode="level1catalog"/>
                </div>

                <span class="h1_of_catpage">
                    <xsl:value-of select="page/properties/group/property[@name='h1']/value" />
                </span>


                <div class="good_cab_card">



                    <div class="cab_img">
                        <xsl:call-template name="thumbing">
                            <xsl:with-param name="source" select="page/properties/group/property[@name='header_pic']/value" />
                            <xsl:with-param name="width" select="300" />
                            <xsl:with-param name="height">200</xsl:with-param>
                        </xsl:call-template>


                    </div>
                    <section>
                        <article>
                           <xsl:value-of select="page/properties/group/property[@name='descr']/value" disable-output-escaping="yes"/>

                        </article>
                    </section>
                    <div class="clearfix"></div>


                </div>

                <div class="catalog_items_wrapper">
                    <xsl:apply-templates select="document(concat('udata://photoalbum/album/',@id))/udata/items" mode="photoalbum"/>

                     <xsl:apply-templates select="document(concat('udata://photoalbum/albums/notemplate/0/0/', @pageId))/udata/items/item" mode="photoalbum_list_main" />  
                  
                    
                </div>
                <section>
                    <article>
                        <xsl:value-of select="page/properties/group/property[@name='descr_bottom']/value" disable-output-escaping="yes"/>
                    </article>
                </section>
                <div class="clearfix"></div>


                <div class="service_block clearfix">
                    <div class="service_block_item">
                        <a href="#"><img src="{$template-resources}img/service_img.jpg" alt=""/></a>
                        <a href="#">Ремонт и отделка квартир</a>
                    </div>
                    <div class="service_block_item">
                        <a href="#"><img src="{$template-resources}img/service_img.jpg" alt=""/></a>
                        <a href="#">Ремонт и отделка квартир</a>
                    </div>
                    <div class="service_block_item">
                        <a href="#"><img src="{$template-resources}img/service_img.jpg" alt=""/></a>
                        <a href="#">Ремонт и отделка квартир</a>
                    </div>
                </div>
            </xsl:when>
            
            <xsl:otherwise>

                 <xsl:apply-templates select="document('udata://core/navibar')/udata" mode="bread" />

				    <div class="catalog_maingroup2_cat_items">
				         <xsl:apply-templates select="document(concat('udata://content/menu///', page/@parentId))/udata/items/item" mode="level1catalog"/>
				    </div>

				    <span class="h1_of_catpage">
				    	<xsl:value-of select="page/properties/group/property[@name='h1']/value" />
				    </span>


				    <div class="good_cab_card">

				        <div class="cab_img">
				            <xsl:call-template name="thumbing">
                            <xsl:with-param name="source" select="page/properties/group/property[@name='header_pic']/value" />
                            <xsl:with-param name="width" select="300" />
                            <xsl:with-param name="height">200</xsl:with-param>
                        </xsl:call-template>


				        </div>
				        <section>
				            <article>
				                
				                 <xsl:value-of select="page/properties/group/property[@name='descr']/value" disable-output-escaping="yes"/>

				            </article>
				        </section>
				        <div class="clearfix"></div>


				    </div>




				    <xsl:apply-templates select="document('udata://photoalbum/album/')/udata/items" mode="photos"/>

				                   
				    <xsl:if test="page/properties/group/property[@name='svyazannye_stranicy']/value">

				    <div class="good_sec_gallery2">
				        <h3>Товары, использованные в проекте</h3>
				        <div class="jcarousel_sec-wrapper">
				            <div class="jcarousel_sec ">
				                <ul>
				                	
				                	<xsl:apply-templates select="page/properties/group/property[@name='svyazannye_stranicy']/value/page" mode="catalog_pages" />
				                    
				                </ul>
				            </div>

				            <a href="#" class="jcarousel_sec-control-prev">&gt;</a>
				            <a href="#" class="jcarousel_sec-control-next">&lt;</a>

				            <p class="jcarousel_sec-pagination"></p>
				        </div>
				    </div>	

				    </xsl:if>
				    



				    <div class="clearfix"></div>

				    <div class="service_block clearfix">
				        <div class="service_block_item">
				            <a href="#"><img src="img/service_img.jpg" alt=""/></a>
				            <a href="#">Ремонт и отделка квартир</a>
				        </div>
				        <div class="service_block_item">
				            <a href="#"><img src="img/service_img.jpg" alt=""/></a>
				            <a href="#">Ремонт и отделка квартир</a>
				        </div>
				        <div class="service_block_item">
				            <a href="#"><img src="img/service_img.jpg" alt=""/></a>
				            <a href="#">Ремонт и отделка квартир</a>
				        </div>
				    </div>



            </xsl:otherwise>
       </xsl:choose>



		<!-- <xsl:apply-templates select="document('udata://photoalbum/album')/udata" /> -->
	</xsl:template>

	<xsl:template match="item" mode="photoalbum_list_main">

	<xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />

       
	    

           
            <div class="catalog_one_block">
	             <a href="{@link}">
	            	<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$catalog_page/group/property[@name='header_pic']/value" />
                        <xsl:with-param name="width" select="300" />
                        <xsl:with-param name="height">200</xsl:with-param>
                    </xsl:call-template>
	            </a>
	            <span>
	            	<a href="{@link}"><xsl:value-of select="."/></a>
	            </span>
            </div>

    </xsl:template>

	
	<xsl:template match="items[count(item) &gt; 0]" mode="photos">
						
		

		
				    <div class="good_sec_gallery">
				        <h3>Фотогалерея проекта</h3>
				        <div class="jcarousel_sec-wrapper">
				            <div class="jcarousel_sec">



				                <ul>
                                    
                                    <xsl:apply-templates select="item" />
                                </ul>
                                
				            </div>

				            <a href="#" class="jcarousel_sec-control-prev">&gt;</a>
				            <a href="#" class="jcarousel_sec-control-next">&lt;</a>

				            <p class="jcarousel_sec-pagination"></p>
				        </div>
				    </div>
	</xsl:template>

	<xsl:template match="page" mode="catalog_pages">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="photo" select="$item//property[@name = 'image']/value" />
		<xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.',$photo,')/744/525///1/1//100'))/udata/src"/>



		<li>
            <a href="{@link}" title="{.}">
                <xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$photo" />
					<xsl:with-param name="width" select="200" />
					<xsl:with-param name="height">150</xsl:with-param>
				</xsl:call-template>
            </a>
         </li>
	</xsl:template>

    <xsl:template match="item" mode="photoalbum_list_mainpage">

    <xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />

       
        <div class="project_item">
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$catalog_page/group/property[@name='header_pic']/value" />
                        <xsl:with-param name="width" select="200" />
                        <xsl:with-param name="height">200</xsl:with-param>
                    </xsl:call-template>
                <p> <a href="{@link}"><xsl:value-of select="." /></a></p>
                <div class="clearfix"></div>
                <div class="after_block"></div>


            </div>

           
            
    </xsl:template>
	
	
           


	<xsl:template match="udata[@module = 'photoalbum' and @method = 'album']/items/item">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="photo" select="$item//property[@name = 'photo']/value" />
		<xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.',$photo,')/744/525///1/1//100'))/udata/src"/>



		<li>
            <a class="fancybox" href="{$src}" title="{.}">
                <xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$photo" />
					<xsl:with-param name="width">200</xsl:with-param>
					<xsl:with-param name="height">150</xsl:with-param>
				</xsl:call-template>
            </a>
         </li>
		
		
	</xsl:template>




	
	
	<xsl:template match="result[@module = 'photoalbum' and @method = 'photo']">
		<xsl:variable name="photo" select="page//property[@name = 'photo']/value" />
		<img src="{$photo}" width="150" umi:field-name="photo" umi:element-id="{page/@id}" />
	</xsl:template>

</xsl:stylesheet>