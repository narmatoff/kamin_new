<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:umi="http://www.umi-cms.ru/TR/umi">
		

	<xsl:template match="udata" mode="jobs">
			<xsl:variable name="first_cat" select="document(concat('udata://photoalbum/album_sort/', items/item[position()=1]/@id))/udata/items/item[position()=1]/@id" />
			<xsl:variable name="first_image" select="document(concat('upage://', $first_cat,'.photo'))/udata/property/value" />
						
		 			<ul>
                        <li>
                            <a href="{items/item[position()=1]/@link}">
                            	<xsl:call-template name="thumbing">
		                            <xsl:with-param name="source" select="$first_image" />
		                            <xsl:with-param name="width" select="253" />
		                            <xsl:with-param name="height">182</xsl:with-param>
		                        </xsl:call-template>

                            	
                            </a>
                            <a href="{items/item[position()=1]/@link}"><xsl:value-of select="items/item[position()=1]/."/></a>
                        </li>
                    </ul>
                    <ul class="more_anys">
                    	<xsl:apply-templates select="items/item" mode="jobs" />
                        
                        
                    </ul>
                    <a href="/poleznaya_informaciya/nashi_raboty/" class="learn_more">все работы</a>

	</xsl:template>

	<xsl:template match="item" mode="jobs">
			<xsl:variable name="first_cat" select="document(concat('udata://photoalbum/album_sort/', @id))/udata/items/item[position()=1]/@id" />
			<xsl:variable name="first_image" select="document(concat('upage://', $first_cat,'.photo'))/udata/property/value" />
	
						<li>
                            <a href="{@link}">
								<xsl:call-template name="thumbing">
		                            <xsl:with-param name="source" select="$first_image" />
		                            <xsl:with-param name="width" select="81" />
		                            <xsl:with-param name="height">59</xsl:with-param>
		                        </xsl:call-template>
                            	
                            </a>
                        </li>

	</xsl:template>	

	<xsl:template match="udata" mode="jobs_photo">
			
						
		 			<ul>
                        <li>
                            <a href="{items/item[position()=1]/extended/properties/property[@name='photo']/value}" title="{items/item[position()=1]/extended/properties/property[@name='h1']/value}" rel="group" class="fancybox">
                            	<xsl:call-template name="thumbing">
		                            <xsl:with-param name="source" select="items/item[position()=1]/extended/properties/property[@name='photo']/value" />
		                            <xsl:with-param name="width" select="253" />
		                            <xsl:with-param name="height">182</xsl:with-param>
		                        </xsl:call-template>

                            	
                            </a>
                            <a href="{items/item[position()=1]/extended/properties/property[@name='photo']/value}" title="{items/item[position()=1]/extended/properties/property[@name='h1']/value}" rel="group" class="fancybox">
                            	<xsl:value-of select="items/item[position()=1]/extended/properties/property[@name='h1']/value"/>
                            </a> 
                        </li>
                    </ul>
                    <ul class="more_anys">
                    	<xsl:apply-templates select="items/item[position()&gt;1]" mode="jobs_photo" />
                        
                        
                    </ul>
                    <a href="/poleznaya_informaciya/nashi_raboty/" class="learn_more">все работы</a>

	</xsl:template>

	<xsl:template match="item" mode="jobs_photo">
			
	
						<li>
                            <a href="{extended/properties/property[@name='photo']/value}" class="fancybox" title="{extended/properties/property[@name='h1']/value}" rel="group">
								<xsl:call-template name="thumbing">
		                            <xsl:with-param name="source" select="extended/properties/property[@name='photo']/value" />
		                            <xsl:with-param name="width" select="81" />
		                            <xsl:with-param name="height">59</xsl:with-param>
		                        </xsl:call-template>
                            	
                            </a>
                        </li>

	</xsl:template>	



	<!-- видео на главной -->
	<xsl:template match="udata" mode="jobs_video">
			
						
		 			<ul>
                        <li>
                            <a href="{items/item[position()=1]/@link}" title="{items/item[position()=1]/extended/properties/property[@name='h1']/value}" rel="group" >
                            	<xsl:call-template name="thumbing">
		                            <xsl:with-param name="source" select="items/item[position()=1]/extended/properties/property[@name='photo']/value" />
		                            <xsl:with-param name="width" select="253" />
		                            <xsl:with-param name="height">182</xsl:with-param>
		                        </xsl:call-template>

                            	
                            </a>
                            <a href="{items/item[position()=1]/@link}">
                            	<xsl:value-of select="items/item[position()=1]/extended/properties/property[@name='h1']/value"/>
                            </a>
                        </li>
                    </ul>
                    <ul class="more_anys">
                    	<xsl:apply-templates select="items/item[position()&gt;1]" mode="jobs_video" />
                        
                        
                    </ul>
                    <a href="/poleznaya_informaciya/video/" class="learn_more">все видео</a>

	</xsl:template>

	<xsl:template match="item" mode="jobs_video">
			
	
						<li>
                            <a href="{@link}" class="fancybox" title="{extended/properties/property[@name='h1']/value}" rel="group">
								<xsl:call-template name="thumbing">
		                            <xsl:with-param name="source" select="extended/properties/property[@name='photo']/value" />
		                            <xsl:with-param name="width" select="81" />
		                            <xsl:with-param name="height">59</xsl:with-param>
		                        </xsl:call-template>
                            	
                            </a>
                        </li>

	</xsl:template>	


	<xsl:template match="item" mode="jobs_inner">
			<xsl:variable name="first_cat" select="document(concat('udata://photoalbum/album_sort/', @id))/udata/items/item[position()=1]/@id" />
			<xsl:variable name="first_image" select="document(concat('upage://', $first_cat,'.photo'))/udata/property/value" />
	
						<li>
                            <a href="{@link}">
								<xsl:call-template name="thumbing">
		                            <xsl:with-param name="source" select="$first_image" />
		                            <xsl:with-param name="width" select="200" />
		                            <xsl:with-param name="height">auto</xsl:with-param>
		                        </xsl:call-template>
                            	
                            </a>
                        </li>

	</xsl:template>	


	<xsl:template match="item" mode="photoalbums_all">
			
	
						<li>
                            <a href="{@link}">

								<xsl:value-of select="."/>
                            	
                            </a>                            
                        </li>

	</xsl:template>			

					
	<xsl:template match="result[@module = 'photoalbum' and @method = 'album']">
        <xsl:choose>
        	<xsl:when test="page/@parentId=0">

                


			        <article>
				 	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>
                    		<xsl:apply-templates select="document(concat('udata://photoalbum/album_sort/',@id))/udata" mode="photos"/>
									<ul>	
	                     				<xsl:apply-templates select="document(concat('udata://photoalbum/albums/notemplate/0/0/', @pageId))/udata/items/item" mode="jobs_inner" />  

	                  				</ul>
                    
              
                       		 <xsl:value-of select="page/properties/group/property[@name='descr_bottom']/value" disable-output-escaping="yes"/>
                    </article>
              

            </xsl:when>
            
            <xsl:otherwise>



             <article> 
	 	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>

 			<xsl:choose>
 				<xsl:when test="page/@type-id='284'">
 					<xsl:apply-templates select="document('udata://photoalbum/album_sort/')/udata" mode="videos"/>
 				</xsl:when>
 				<xsl:otherwise>
 					<xsl:apply-templates select="document('udata://photoalbum/album_sort/')/udata" mode="photos"/>
 				</xsl:otherwise>
 			</xsl:choose>
   			
			
			</article>

            <article>
				        <xsl:value-of select="page/properties/group/property[@name='descr']/value" disable-output-escaping="yes"/>
			</article>
				       
            </xsl:otherwise>
       </xsl:choose>



		<!-- <xsl:apply-templates select="document('udata://photoalbum/album')/udata" /> -->
	</xsl:template>

	<!-- фото -->

    <xsl:template match="udata" mode="photos">
						
		 	<xsl:call-template name="numpages"> 
                <xsl:with-param name="total" select="total" />
                <xsl:with-param name="limit" select="per_page" />
            </xsl:call-template>

				    
				    
				    
   
                   <xsl:apply-templates select="items"  mode="photos"/>

				    
				    
			<xsl:call-template name="numpages">
                <xsl:with-param name="total" select="total" />
                <xsl:with-param name="limit" select="per_page" />
            </xsl:call-template>	    
				    
				    
				    
				    
				    
				    
	</xsl:template>

	
	<xsl:template match="items[count(item) &gt; 0]" mode="photos">
	   
            <ul class="content_gallery">

                   <xsl:apply-templates select="item" />

            </ul>
        
				    
	</xsl:template>

	
	
	
           


	<xsl:template match="udata[@module = 'photoalbum' and @method = 'album_sort']/items/item">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="photo" select="$item//property[@name = 'photo']/value" />
		<xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.',$photo,')/744/525///1/1//100'))/udata/src"/>



		<li style="width:200px; display: inline-table;">
            <a class="fancybox" rel="group" href="{$photo}" title="{.}">
                <xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$photo" />
					<xsl:with-param name="width">200</xsl:with-param>
					<xsl:with-param name="height">150</xsl:with-param>
				</xsl:call-template>
            </a>
            <a style="display: block" href="{@link}" title="{.}"><xsl:value-of select="."/></a>
        </li>
		
		
	</xsl:template>

	<xsl:template match="udata[@module = 'photoalbum' and @method = 'album']/items/item">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="photo" select="$item//property[@name = 'photo']/value" />
		<xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.',$photo,')/744/525///1/1//100'))/udata/src"/>



		<li style="width:200px; display: inline-table;">
            <a class="fancybox" rel="group" href="{$photo}" title="{.}">
                <xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$photo" />
					<xsl:with-param name="width">200</xsl:with-param>
					<xsl:with-param name="height">150</xsl:with-param>
				</xsl:call-template>
            </a>
<!--            <a style="display: block" href="{@link}" title="{.}"><xsl:value-of select="."/></a>-->
        </li>
		
		
	</xsl:template>



	<!-- видео -->

	<xsl:template match="udata" mode="videos">
						
<!--
		 	<xsl:call-template name="numpages"> 
                <xsl:with-param name="total" select="total" />
                <xsl:with-param name="limit" select="per_page" />
            </xsl:call-template>
-->

				    
				    
				    
   
                   <xsl:apply-templates select="items"  mode="videos"/>

				    
				    
			<xsl:call-template name="numpages">
                <xsl:with-param name="total" select="total" />
                <xsl:with-param name="limit" select="per_page" />
            </xsl:call-template>	    
				    
				    
				    
				    
				    
				    
	</xsl:template>

	
	<xsl:template match="items[count(item) &gt; 0]" mode="videos">
	   
            <ul class="content_video_gallery">
                   <xsl:apply-templates select="item" mode="videos"/>

            </ul>
        
				    
	</xsl:template>

	
	

	<xsl:template match="item" mode="videos">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="photo" select="$item//property[@name = 'photo']/value" />
		<xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.',$photo,')/744/525///1/1//100'))/udata/src"/>



		<li class="video_itemn">
            <a href="{@link}" title="{.}">
                <xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$photo" />
					<xsl:with-param name="width">200</xsl:with-param>
					<xsl:with-param name="height">150</xsl:with-param>
				</xsl:call-template>
            </a>
            <a class="video_name" href="{@link}" title="{.}">
            	<xsl:value-of select="."/><!-- <span>(4:39)</span> -->
            </a>
            <a class="video_descr" href="{@link}" title="{.}">
            	<xsl:value-of select="$item//property[@name = 'kratkoe_opisani']/value" disable-output-escaping="yes" />
            </a>
        </li>
		
		
	</xsl:template>

	
	
	<xsl:template match="result[@module = 'photoalbum' and @method = 'photo']">


		

	 	


            <article>
            	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>

                <xsl:apply-templates select="$errors" />
                <xsl:if test="page/properties/group/property[@name='video']/value">
					<xsl:value-of select="page/properties/group/property[@name='video']/value" disable-output-escaping="yes" />
				</xsl:if>
				<xsl:if test="not(page/properties/group/property[@name='video']/value)">
					
					<xsl:variable name="photo" select="page//property[@name = 'photo']/value" />
					<img src="{$photo}" width="150" umi:field-name="photo" umi:element-id="{page/@id}" />

				</xsl:if>
                <xsl:value-of select="page/properties/group/property[@name='descr']/value" disable-output-escaping="yes"/>

				

				<xsl:if test="page/properties/group/property[@name='forma_obratnoj_svyazi']/value/page">
					<div style="display:none;">	
						<div id="form_for" style="padding: 0 30px 0 25px;">	
						<xsl:apply-templates select="document(concat('upage://', page/properties/group/property[@name='forma_obratnoj_svyazi']/value/page/@id ))/udata" mode="form_in_page"/>
						</div>
					</div>
				</xsl:if>

                <xsl:if test="page/properties/group[@name='svyazannye_tovary'] or page/properties/group/property[@name='tovary']/value">
				
                   <div class="clearfix"></div>
                    <h3>Обратите внимание на товары, которые описаны ниже</h3>
                       <div id="catalog_list" class="cat_item_list">
                            <div id="towars" class="flexslider">
                                <ul class="slides">
                                    <xsl:apply-templates select="page/properties/group[@name='svyazannye_tovary']/property" mode="dop_goods_connected" /> 
                                    <xsl:apply-templates select="page/properties/group/property[@name='tovary']/value/page" mode="dop_goods_connected_tree" /> 
                                </ul>
                            </div>
                        </div>
                </xsl:if>
                <xsl:apply-templates select="$errors" />            
            </article>
					



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
            <a href="{@link}" title="{.}"><xsl:value-of select="."/></a>
         </li>
	</xsl:template>

	<xsl:template match="page" mode="only_photo">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="photo" select="$item//property[@name = 'photo']/value" />
		<xsl:variable name="src" select="document(concat('udata://system/makeThumbnailFull/(.',$photo,')/744/525///1/1//100'))/udata/src"/>



		<li style="width:200px; display: inline-table;">
            <a class="fancybox" rel="group" href="{$photo}" title="{.}">
                <xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$photo" />
					<xsl:with-param name="width">200</xsl:with-param>
					<xsl:with-param name="height">150</xsl:with-param>
				</xsl:call-template>
            </a>
            <a style="display: block" href="{@link}" title="{.}"><xsl:value-of select="name"/></a>
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



</xsl:stylesheet>