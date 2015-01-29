<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">


<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<!-- Список товаров -->

	

	<xsl:template match="result[@module = 'catalog' and @method = 'category']">

      
       <xsl:apply-templates select="$errors" />
			<xsl:value-of select=".//property[@name = 'content']/value"	disable-output-escaping="yes" />
	 	<xsl:apply-templates select="$errors" />


       <xsl:choose>
        	<xsl:when test="parents/page[position()=last()]/@parentId=0">

				 <xsl:apply-templates select="document('udata://core/navibar')/udata" mode="bread" />

				<div class="catalog_maingroup_cat_items">
					<xsl:apply-templates select="document(concat('udata://content/menu///', parents/page[position()=1]/@id))/udata/items/item" mode="level1catalog"/>
				</div>

				<span class="h1_of_catpage"> <xsl:value-of select="page/properties/group/property[@name='h1']/value" /></span>
				<div class="catalog_items_wrapper">
					 <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/', @pageId))/udata/items/item" mode="categorylist" /> 
					 <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/', @pageId))/udata/lines/item" mode="categorylist" /> 
				</div>

				<section>
					<article>
						 <xsl:value-of select="page/properties/group/property[@name='descr']/value" disable-output-escaping="yes"/>
					</article>
				</section>


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
		    <xsl:when test="page/@parentId=0">
		           	<div class="catalog_items_wrapper">
		           		<xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/', @pageId))/udata/items/item" mode="categorylist_main" />  
		           	</div>   
		    </xsl:when>
		    <xsl:otherwise>
		           	<xsl:apply-templates select="document('udata://core/navibar')/udata" mode="bread" />

					<div class="catalog_maingroup_cat_items">
						<xsl:apply-templates select="document(concat('udata://content/menu///', parents/page[position()=1]/@id))/udata/items/item" mode="level1catalog"/>
					</div>

					<span class="h1_of_catpage"> 
						<xsl:value-of select="page/properties/group/property[@name='h1']/value" disable-output-escaping="yes"/>
					</span>

					<div class="tovari_block clearfix">
						<xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/', @pageId))/udata" mode="catalogus_current"/>
						
						
					</div>
	                
	        			 
           </xsl:otherwise>
       </xsl:choose>

       
        
         

                       <!--  <xsl:choose>
                            <xsl:when test="page/@parentId='0'">
                                 <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList//(mode=all)/', $onpage,'///375/0'))/udata" mode="catalogus"/>
                            </xsl:when>
                            <xsl:otherwise>
                                 <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList//',@pageId,'/',$onpage,'//10/375/0'))/udata" mode="catalogus"/>
                            </xsl:otherwise>
                        </xsl:choose>
                          -->
                  
	
	</xsl:template>

    <xsl:template match="item" mode="categorylist">

        <xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />


	    

           
        <div class="catalog_one_block">
				 <a href="{@link}">
					<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$catalog_page/group/property[@name='image']/value" />
                        <xsl:with-param name="width" select="300" />
                        <xsl:with-param name="height">200</xsl:with-param>
                    </xsl:call-template>
                </a>

				<span> <a href="{@link}"><xsl:value-of select="."/></a></span>
				<xsl:value-of select="$catalog_page/group/property[@name='short']/value"  disable-output-escaping="yes"/>			
		</div>
		

        


        
    </xsl:template>

    <xsl:template match="item" mode="categorylist_main">
        
        <xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />

       
	    

           
            <div class="catalog_one_block">
	             <a href="{@link}">
	            	<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$catalog_page/group/property[@name='image']/value" />
                        <xsl:with-param name="width" select="300" />
                        <xsl:with-param name="height">200</xsl:with-param>
                    </xsl:call-template>
	            </a>
	            <span>
	            	<a href="{@link}"><xsl:value-of select="."/></a>
	            </span>
            </div>
       
        
    </xsl:template>



	<xsl:template match="field" mode="properties_title">
		<th><xsl:value-of select="@title"  disable-output-escaping="yes"/></th>
	</xsl:template>


	<xsl:template match="udata[lines|items]" mode="catalogus">
        <ul class="products">
                            
                           
                       
		     <xsl:apply-templates select="lines/item" mode="catalog_item" />
	 	     <xsl:apply-templates select="items/item" mode="catalog_item" />
        </ul>
	</xsl:template>
	<xsl:template match="udata" mode="catalogus">

		К сожалению таких товаров не найдено!

	</xsl:template>

	<xsl:template match="udata[lines|items]" mode="catalogus_current">
		
                        <xsl:apply-templates select="lines/item" mode="catalog_item" />
	 	     			<xsl:apply-templates select="items/item" mode="catalog_item" />
                       
                   
                            
                           
                       
		     
        
	</xsl:template>
	<xsl:template match="udata" mode="catalogus_current">


		
                    <p>
                        К сожалению таких товаров не найдено!
                       
                    </p>
                
		

	</xsl:template>

<!-- Товар в списке -->
	<xsl:template match="item" mode="catalog_item">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
        <!-- <xsl:variable name="art" select="$item/page/properties/group/property[@name='artikul']/value" /> -->
		<a href="{@link}"><xsl:value-of select="."/></a>
                       
		<div class="tovari_block_item">
					<a href="{@link}">
						<xsl:call-template name="thumbing">
	                        <xsl:with-param name="source" select="$item/page/properties/group/property[@name='image']/value" />
	                        <xsl:with-param name="width" select="236" />
	                        <xsl:with-param name="height">236</xsl:with-param>
	                    </xsl:call-template>
					</a>
					<a href="{@link}"><xsl:value-of select="."/></a>
					<span>
						<xsl:value-of select="$item/page/properties/group/property[@name='price']/value" /> руб.
					</span>
		</div>

	</xsl:template>

    <xsl:template match="page" mode="catalog_item">
        <xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
        <!-- <xsl:variable name="art" select="$item/page/properties/group/property[@name='artikul']/value" /> -->
		<a href="{@link}"><xsl:value-of select="."/></a>
                       
		<div class="tovari_block_item">
					<a href="{@link}">
						<xsl:call-template name="thumbing">
	                        <xsl:with-param name="source" select="$item/page/properties/group/property[@name='image']/value" />
	                        <xsl:with-param name="width" select="236" />
	                        <xsl:with-param name="height">236</xsl:with-param>
	                    </xsl:call-template>
					</a>
					<a href="{@link}"><xsl:value-of select="."/></a>
					<span>
						<xsl:value-of select="$item/page/properties/group/property[@name='price']/value" /> руб.
					</span>
		</div>
    </xsl:template>


	<!-- Страница товара -->
	<xsl:template match="result[@module = 'catalog' and @method = 'object']">
	
        <xsl:apply-templates select="$errors" />
        <xsl:call-template name="thumbing">
            <xsl:with-param name="source" select="page/properties/group/property[@name='izobrazhenie']/value" />
            <xsl:with-param name="width" select="auto" />
            <xsl:with-param name="height">auto</xsl:with-param>
            <xsl:with-param name="class">float_right</xsl:with-param>
        </xsl:call-template>
            <xsl:value-of select=".//property[@name = 'tekst']/value" disable-output-escaping="yes" />
            
        <xsl:apply-templates select="$errors" />

        <xsl:apply-templates select="document('udata://core/navibar')/udata" mode="bread" />

        <div class="catalog_maingroup_cat_items">
            <xsl:apply-templates select="document(concat('udata://content/menu///', parents/page[position()=1]/@id))/udata/items/item" mode="level1catalog"/>
        </div>

        <span class="h1_of_catpage"><xsl:value-of select="page/properties/group/property[@name='h1']/value" /></span>


      <div class="good_card">
          <section>
              <article>
                  <h3>Описание</h3>

                  <xsl:value-of select="page/properties/group/property[@name='opisanie']/value" disable-output-escaping="yes" />

              </article>
          </section>
          <div class="good_gallery">
              <div class="jcarousel-wrapper">
                  <div class="jcarousel slidewrap3">
                      <ul class="jcarousel_ul slider">
                      	<xsl:apply-templates select="page/properties/group[@name='izobrazheniya']/property" mode="property_image" />
                         
                          
                      </ul>

                  </div>
              </div>

          </div>
          <div class="clearfix"></div>

      </div>
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

                                        
                                       
                                            
                                            

                                        




	</xsl:template>






    <xsl:template match="udata" mode="brand">
              <a href="#"><xsl:value-of select="object/properties/group/property[@name='h1']/value"/></a>, <xsl:value-of select="object/properties/group/property[@name='strana']/value/item/@name"/>
    </xsl:template>

    <xsl:template match="property" mode="properties">
        <p><b><xsl:value-of select="title"/>:  </b><xsl:value-of select="value"  disable-output-escaping="yes"/> </p>

    </xsl:template>
	<xsl:template match="udata" mode="search_form">
			<form class="popup" action="/podbor" method="GET">
				<input type="hidden" name="fields_filter[non_filtered]" value="0" />
					<xsl:apply-templates select="group" mode="search" />
					<!-- <xsl:apply-templates select="document('udata://catalog/search/(/katalog/proizvoditel_1/)/')/udata" mode="search_form"/>	 -->

                </form>


	</xsl:template>

    <xsl:template match="property" mode="property_image">

    	 <li class="jcarousel_li slide">
                <xsl:call-template name="thumbing">
                    <xsl:with-param name="source" select="value" />
                    <xsl:with-param name="width" select="317" />
                    <xsl:with-param name="height">422</xsl:with-param>
                </xsl:call-template>
         </li>
            
    </xsl:template>





	<xsl:template match="group" mode="search">

				<div>
					<xsl:apply-templates select="field" mode="search" />
				</div>
	</xsl:template>
	<xsl:template match="group[@name='podbor_2']" mode="search">

				<div>
					<xsl:apply-templates select="field" mode="search" />
					<button type="submit">Искать</button>
				</div>
	</xsl:template>




	<xsl:template match="field[@data-type = 'boolean']" mode="search">
		<div class="box">
			<input id="n{@id}" name="fields_filter[{@name}]" type="checkbox" value="1" class="check">
			<xsl:if test="checked">
					<xsl:attribute name="checked">checked</xsl:attribute>
			</xsl:if>
		</input>
			<label for="n{@id}"><xsl:value-of select="@title" /></label>
		</div>
	</xsl:template>

	<xsl:template match="field[ @data-type = 'int' or @data-type = 'float' or @data-type = 'string' ]" mode="search">

		<div class="block slider-block">
		 	<span class="name"><xsl:value-of select="@title"/></span>
				
						<input type="text" class="input-text" name="fields_filter[{@name}]" value="{value_from}"/>
					
		</div>



	</xsl:template>






	<!-- <xsl:template
		match="field[@data-type = 'relation' or @data-type = 'symlink'][@name!='pennyj' or @name!='koncentrat']" mode="search">
		<span class="name"><xsl:value-of select="@title"/></span>
				<xsl:apply-templates select="values/item" mode="search">
					<xsl:sort select="@id"/>
					<xsl:with-param name="name" select="@name"/>
				</xsl:apply-templates>


	</xsl:template> -->

	<xsl:template match="field[@data-type = 'relation']" mode="search">

		<select id="{@name}" style="float: left; width:46%; margin: 5px;" name="fields_filter[{@name}]">
                <option value=""><xsl:value-of select="@title"/></option>
				<xsl:apply-templates select="values/item" mode="search_select"/>
		</select>




	</xsl:template>

	<xsl:template match="field/values/item" mode="search_select">
		<option value="{@id}">
			<xsl:value-of select="." />
		</option>



	</xsl:template>


	<xsl:template match="field/values/item" mode="search">
		<xsl:param name="name"/>
		<div class="box">

			<input id="n{@id}" name="fields_filter[{$name}][]" type="checkbox" value="{@id}" class="check">
				<xsl:if test="@selected">
						<xsl:attribute name="checked"></xsl:attribute>
				</xsl:if>
			</input>
			<label for="n{@id}"><xsl:value-of select="." /></label>
		</div>


	</xsl:template>










	<!--
		<xsl:template match="udata[@module = 'catalog' and @method =
		'getCategoryList']/items"> <ul umi:module="catalog"
		umi:element-id="{../@category-id}" umi:method="getCategoryList"
		umi:button-position="bottom left" umi:region="list"
		umi:sortable="sortable"> <xsl:apply-templates /> </ul> <br /> <br />
		</xsl:template> <xsl:template match="result[@module = 'catalog' and
		@method = 'object']"> <p> <xsl:apply-templates
		select="document(concat('udata://emarket/price/', page/@id))/udata" />
		</p> <p> <xsl:apply-templates
		select="document(concat('udata://emarket/stores/', page/@id))/udata"
		/> </p> <form method="post"
		action="/emarket/basket/put/element/{page/@id}/"> <input type="hidden"
		name="redirect-uri" value="{$request-uri}" /> <xsl:apply-templates
		select="page//group[@name = 'catalog_option_props']" /> <div
		class="buttons"> <input type="submit" value="Положить в корзину" />
		<xsl:text> </xsl:text> <input type="button" value="Добавить к
		сравнению" /> </div> </form> </xsl:template> <xsl:template
		match="group[@name = 'catalog_option_props']"> <h2> <xsl:text>Выберите
		дополнительные опции</xsl:text> </h2> <input type="hidden"
		name="redirect-uri" value="{$request-uri}" /> <xsl:apply-templates
		select="property[@type = 'optioned']" /> </xsl:template>
	-->
</xsl:stylesheet>