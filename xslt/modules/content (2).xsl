<<<<<<< HEAD
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">


	


	<xsl:template match="result[@module = 'content' and @method = 'content']">
		
				
					 <section class="full_width_text">
						<aricle>
							<div class="polaroid_photo">
								<xsl:if test="page/properties/group/property[@name= 'kartinka_1' ]/value">
					                <div id="gallery" class="b1njPolaroidGallery">
					                    <ul>
					                        <li style="left: 0px; top: 0px; z-index: 3;" class="ui-draggable">
					                        	<img src="{page/properties/group/property[@name= 'kartinka_1' ]/value}"/>
					                        	<!-- <xsl:call-template name="thumbing">
							                        <xsl:with-param name="source" select="page/properties/group/property[@name= 'kartinka_1' ]/value" />
							                        <xsl:with-param name="width" select="425" />
							                        <xsl:with-param name="height">auto</xsl:with-param>
							                    </xsl:call-template> -->
					                        </li>
					                        <li style="left: 37px; top: 81px;" class="ui-draggable">
					                        	<img src="{page/properties/group/property[@name= 'kartinka_2' ]/value}"/>
						                      <!--   <xsl:call-template name="thumbing">
							                        <xsl:with-param name="source" select="page/properties/group/property[@name= 'kartinka_2' ]/value" />
							                        <xsl:with-param name="width" select="425" />
							                        <xsl:with-param name="height">auto</xsl:with-param>
							                    </xsl:call-template> -->
						                    </li>
					                        <li style="left: 278px; top: 320px;" class="ui-draggable">
					                        	<img src="{page/properties/group/property[@name= 'kartinka_3' ]/value}"/>
					                        	<!-- <xsl:call-template name="thumbing">
							                        <xsl:with-param name="source" select="page/properties/group/property[@name= 'kartinka_3' ]/value" />
							                        <xsl:with-param name="width" select="425" />
							                        <xsl:with-param name="height">auto</xsl:with-param>
							                    </xsl:call-template> -->
					                        </li>
					                    </ul>
					                </div>
				                </xsl:if>

				                	<xsl:value-of select="page/properties/group/property[@name= 'dopolnitelnyj_tekst' ]/value" disable-output-escaping="yes" />
				                

				            </div>
				            <xsl:apply-templates select="$errors" />
				            	<xsl:value-of select=".//property[@name = 'content']/value"	disable-output-escaping="yes" />
				            	<xsl:apply-templates select="$errors" />
		 					
	 					</aricle>
						
					</section>
					



	</xsl:template>




	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='116']">
				
					
		<aside class="contakts_menutowns">
					<ul>
						<xsl:apply-templates select="document('udata://content/menu///5')/udata/items/item" mode="level2contacts"/>
						
					</ul>
			</aside>
	        <section class="contacts_section">
		        <article class="contacts_map_article">
		        	<xsl:value-of select=".//property[@name = 'karta']/value"	disable-output-escaping="yes" />

			     
		        </article>
		        <article class="contacts_adress_article">
				<h3>Контактная информация:</h3>
		        	<xsl:value-of select=".//property[@name = 'adres']/value"	disable-output-escaping="yes" />

		        	<xsl:value-of select=".//property[@name = 'dopolnitelnaya_informaciya']/value"	disable-output-escaping="yes" />
			        
		        </article>
		       <!--  <article class="contacts_adressforqustions_article">
				<h3>Дополнительная информация:  </h3>
		        	
			        
		        </article> -->
	        </section>
				

	</xsl:template>

	<xsl:template match="result[@module = 'content' and @method = 'content'][@pageId='5']">
				
		<xsl:value-of select="document(concat('udata://content/redirect/', $systempage))" />

				

	</xsl:template>

	

		<xsl:template match="result[@module = 'content' and @method = 'getRecentPages']">
				
					
						<xsl:apply-templates select="$errors" />
			            	<xsl:value-of select=".//property[@name = 'content']/value"	disable-output-escaping="yes" />
	 					<xsl:apply-templates select="$errors" />
					<ul>
						<xsl:apply-templates select="udata/items/item" mode="level1top"/>
					</ul>

	</xsl:template>
	

	

	<xsl:template match="result[@module = 'content' and @method = 'notfound']">
		<xsl:apply-templates select="document('udata://content/sitemap')/udata" />
	</xsl:template>
	
	
	<xsl:template match="result[@module = 'content' and @method = 'sitemap']">
		<xsl:apply-templates select="document('udata://content/sitemap')/udata/items" />
	</xsl:template>
	
	
	
	<xsl:template match="udata[@method = 'sitemap']//items">
		<ul class="menu" umi:module='content' umi:method='menu' umi:element-id="0" umi:button-position="bottom left" umi:region="list" umi:sortable="sortable">
			<xsl:apply-templates select="item" />
		</ul>
	</xsl:template>
	
	<xsl:template match="udata[@method = 'sitemap']//item">
		<li umi:region="row">
			<a href="{@link}" umi:element-id="{@id}" umi:field-name="name" umi:delete="delete" umi:empty="Название страницы">
				<xsl:value-of select="@name" />
			</a>
			
			<xsl:apply-templates select="items" />
		</li>
	</xsl:template>














<xsl:template match="result[@module = 'filemanager'][@method = 'shared_file']">
		<div class="special-order-v3">
			<div class="text">
				<div><xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" /></div>
			</div>

			<xsl:apply-templates select="document(concat('udata://filemanager/shared_file//', @pageId))/udata" />
		</div>
	</xsl:template>

	<xsl:template match="udata[@module = 'filemanager'][@method = 'shared_file']">
		
			<p>
				<xsl:text>Имя файла: </xsl:text>
				<xsl:value-of select="file_name" />
			</p>
			<p>
				<xsl:text>Размер файла: </xsl:text>
				<xsl:value-of select="file_size" />
				<xsl:text> Kb</xsl:text>
			</p>
			
			<p>
				<xsl:text>Если закачивание файла не начнется через 10 сек, кликните </xsl:text>
				<a href="{download_link}">
					<xsl:text>по этой ссылке</xsl:text>
				</a>
			</p>
			<script languge="text/javascript">
				<xsl:text>window.setTimeout('document.location.href="</xsl:text>
				<xsl:value-of select="download_link" />
				<xsl:text>";', 10000);</xsl:text>
			</script>
		
	</xsl:template>

</xsl:stylesheet>
=======
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">


	


	<xsl:template match="result[@module = 'content' and @method = 'content']">
		
				
					 <section class="full_width_text">
						<aricle>
							<div class="polaroid_photo">
								<xsl:if test="page/properties/group/property[@name= 'kartinka_1' ]/value">
					                <div id="gallery" class="b1njPolaroidGallery">
					                    <ul>
					                        <li style="left: 0px; top: 0px; z-index: 3;" class="ui-draggable">
					                        	<img src="{page/properties/group/property[@name= 'kartinka_1' ]/value}"/>
					                        	<!-- <xsl:call-template name="thumbing">
							                        <xsl:with-param name="source" select="page/properties/group/property[@name= 'kartinka_1' ]/value" />
							                        <xsl:with-param name="width" select="425" />
							                        <xsl:with-param name="height">auto</xsl:with-param>
							                    </xsl:call-template> -->
					                        </li>
					                        <li style="left: 37px; top: 81px;" class="ui-draggable">
					                        	<img src="{page/properties/group/property[@name= 'kartinka_2' ]/value}"/>
						                      <!--   <xsl:call-template name="thumbing">
							                        <xsl:with-param name="source" select="page/properties/group/property[@name= 'kartinka_2' ]/value" />
							                        <xsl:with-param name="width" select="425" />
							                        <xsl:with-param name="height">auto</xsl:with-param>
							                    </xsl:call-template> -->
						                    </li>
					                        <li style="left: 278px; top: 320px;" class="ui-draggable">
					                        	<img src="{page/properties/group/property[@name= 'kartinka_3' ]/value}"/>
					                        	<!-- <xsl:call-template name="thumbing">
							                        <xsl:with-param name="source" select="page/properties/group/property[@name= 'kartinka_3' ]/value" />
							                        <xsl:with-param name="width" select="425" />
							                        <xsl:with-param name="height">auto</xsl:with-param>
							                    </xsl:call-template> -->
					                        </li>
					                    </ul>
					                </div>
				                </xsl:if>

				                	<xsl:value-of select="page/properties/group/property[@name= 'dopolnitelnyj_tekst' ]/value" disable-output-escaping="yes" />
				                

				            </div>
				            <xsl:apply-templates select="$errors" />
				            	<xsl:value-of select=".//property[@name = 'content']/value"	disable-output-escaping="yes" />
				            	<xsl:apply-templates select="$errors" />
		 					
	 					</aricle>
						
					</section>
					



	</xsl:template>




	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='116']">
				
					
		<aside class="contakts_menutowns">
					<ul>
						<xsl:apply-templates select="document('udata://content/menu///5')/udata/items/item" mode="level2contacts"/>
						
					</ul>
			</aside>
	        <section class="contacts_section">
		        <article class="contacts_map_article">
		        	<xsl:value-of select=".//property[@name = 'karta']/value"	disable-output-escaping="yes" />

			     
		        </article>
		        <article class="contacts_adress_article">
				<h3>Контактная информация:</h3>
		        	<xsl:value-of select=".//property[@name = 'adres']/value"	disable-output-escaping="yes" />

		        	<xsl:value-of select=".//property[@name = 'dopolnitelnaya_informaciya']/value"	disable-output-escaping="yes" />
			        
		        </article>
		       <!--  <article class="contacts_adressforqustions_article">
				<h3>Дополнительная информация:  </h3>
		        	
			        
		        </article> -->
	        </section>
				

	</xsl:template>

	<xsl:template match="result[@module = 'content' and @method = 'content'][@pageId='5']">
				
		<xsl:value-of select="document(concat('udata://content/redirect/', $systempage))" />

				

	</xsl:template>

	

		<xsl:template match="result[@module = 'content' and @method = 'getRecentPages']">
				
					
						<xsl:apply-templates select="$errors" />
			            	<xsl:value-of select=".//property[@name = 'content']/value"	disable-output-escaping="yes" />
	 					<xsl:apply-templates select="$errors" />
					<ul>
						<xsl:apply-templates select="udata/items/item" mode="level1top"/>
					</ul>

	</xsl:template>
	

	

	<xsl:template match="result[@module = 'content' and @method = 'notfound']">
		<xsl:apply-templates select="document('udata://content/sitemap')/udata" />
	</xsl:template>
	
	
	<xsl:template match="result[@module = 'content' and @method = 'sitemap']">
		<xsl:apply-templates select="document('udata://content/sitemap')/udata/items" />
	</xsl:template>
	
	
	
	<xsl:template match="udata[@method = 'sitemap']//items">
		<ul class="menu" umi:module='content' umi:method='menu' umi:element-id="0" umi:button-position="bottom left" umi:region="list" umi:sortable="sortable">
			<xsl:apply-templates select="item" />
		</ul>
	</xsl:template>
	
	<xsl:template match="udata[@method = 'sitemap']//item">
		<li umi:region="row">
			<a href="{@link}" umi:element-id="{@id}" umi:field-name="name" umi:delete="delete" umi:empty="Название страницы">
				<xsl:value-of select="@name" />
			</a>
			
			<xsl:apply-templates select="items" />
		</li>
	</xsl:template>














<xsl:template match="result[@module = 'filemanager'][@method = 'shared_file']">
		<div class="special-order-v3">
			<div class="text">
				<div><xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" /></div>
			</div>

			<xsl:apply-templates select="document(concat('udata://filemanager/shared_file//', @pageId))/udata" />
		</div>
	</xsl:template>

	<xsl:template match="udata[@module = 'filemanager'][@method = 'shared_file']">
		
			<p>
				<xsl:text>Имя файла: </xsl:text>
				<xsl:value-of select="file_name" />
			</p>
			<p>
				<xsl:text>Размер файла: </xsl:text>
				<xsl:value-of select="file_size" />
				<xsl:text> Kb</xsl:text>
			</p>
			
			<p>
				<xsl:text>Если закачивание файла не начнется через 10 сек, кликните </xsl:text>
				<a href="{download_link}">
					<xsl:text>по этой ссылке</xsl:text>
				</a>
			</p>
			<script languge="text/javascript">
				<xsl:text>window.setTimeout('document.location.href="</xsl:text>
				<xsl:value-of select="download_link" />
				<xsl:text>";', 10000);</xsl:text>
			</script>
		
	</xsl:template>

</xsl:stylesheet>
>>>>>>> 2fae45de4042c059b8573aa1a8f6ff71a028e71b
