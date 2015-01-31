<<<<<<< HEAD
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">





	<xsl:template match="udata[@method = 'insert_form']">
	<!-- <form class="search" method="get" action="/search/search_do/">
                        
                        <input type="text"  name="search_string" placeholder="Найти товар..." /><button type="submit">Найти</button>
                        
    </form> -->

  <form class="search_hform" method="get" action="/search/search_do" >
                            <input  type="search" name="search_string"/>
                          <!--   <div class="select_main">
                                <p></p>
                              <select class="type_serch" name="" id="">
                                    <option value="">по каталогу</option>
                                    <option value="">по цене</option>
                                    <option value="">по типу</option>
                                    
                                </select>
                            </div> -->
                        </form>
                        
   <!-- <form method="get" action="/search/search_do" class="searchform">
                <label>
                    <input type="search" name="search_string" class="search_input" title="поиск по сайту"/>
                </label>
                <input type="image" src="{$template-resources}img/searchbuttononinput.png" value="" title="начать поиск" class="searchbutton"/>
    </form> -->
	

	</xsl:template>

	<!-- шаблон страницы с результатами поиска -->

	<xsl:template match="result[@module = 'search'][@method = 'search_do']">

		
			<xsl:variable name="search-results"
			select="document('udata://search/search_do/')/udata" />
			
<div class="inside_productions_items">
									<div class="productions">
										<xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/(/katalog)')/udata/items/item" mode="categorylistimage" /> 
									</div>
								</div>
								<div class="widthtxtcont">
									<div class="inside_txtwrapper">
										<xsl:apply-templates select="document('udata://core/navibar/')/udata" mode="bread"/>
										<h1><xsl:value-of select="@header"/></h1>



										<div class="mainsearch_blockishe">
											<div class="searchblock">
										<form class="search_hform" method="get" action="/search/search_do">
											<input type="search_string" value="{$search_string}"/>
											<input class="srch_btn" type="button" value="найти"/>
										</form>
										
									</div>
									<div class="clearfix"></div>
										</div>






										<p class="search_pop">По вашему запросу найдено <xsl:value-of select="$search-results/total" /> товаров и две страницы</p>		
										<aside>
											<div onclick="" class="aside_searchbtns active">
												<p>Каталог товаров</p>
											</div>
											<div onclick="" class="aside_searchbtns">
												
													<p>Текстовые страницы</p>
												</div>
											
										</aside>
										<div class="inside_txtcontent">
					
											<xsl:apply-templates select="$search-results" />
			<xsl:call-template name="numpages">
				<xsl:with-param name="total"
					select="$search-results/total" />
				<xsl:with-param name="limit"
					select="$search-results/per_page" />
			</xsl:call-template>
											<div class="clearfix"></div>
											
											<!-- <article>
												<section>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum eum nesciunt excepturi quod harum fugit, dolorum ipsa. Id reiciendis tempore eligendi voluptas non hic optio, dolorum mollitia rem sapiente tempora amet sint temporibus, delectus, dicta fuga officiis. Natus sunt in numquam eos adipisci quaerat non commodi ratione minus corporis blanditiis cum ea dolore nihil totam quo nesciunt ex inventore est, amet tenetur vitae tempora ducimus aut praesentium? Veniam id, ipsam consequatur tenetur illo esse doloremque odit, sunt ipsum quae quasi.</p>
													<p>Distinctio in eveniet ratione nobis sequi doloribus, quae, qui asperiores ab minima aut, cumque consequatur mollitia sed reprehenderit rem quisquam porro numquam. Ipsa quibusdam corrupti sint, provident fugit, tempora consectetur nostrum minus cumque voluptas excepturi dignissimos quasi labore? Quis libero iure dicta accusamus nam, amet accusantium. Autem accusantium explicabo, in, repudiandae esse ut! Dicta quidem culpa doloribus minima, at mollitia placeat aut et facilis temporibus! Nostrum neque doloremque in distinctio vero. Facilis et nulla maiores quis nisi tempore ipsa consequuntur?</p>
												</section>
											</article> -->
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="clearfix"></div>
								</div>
							
			
		
		
		


	</xsl:template>

	<!-- когда ничего не найдено -->

	<xsl:template
		match="udata[@module = 'search'][@method = 'search_do'][not(items/item)]">
		
			<xsl:text>По запросу </xsl:text>
			<span>
				&#171;
				<xsl:value-of select="$search_string" />
				&#187;
			</span>
			<xsl:text> ничего не найдено.</xsl:text>
		
	</xsl:template>

	<!-- обработка результатов поиска -->

	<xsl:template
		match="udata[@module = 'search'][@method = 'search_do'][items/item]">

		<p>По запросу  
			<span class="textcolor_red">
				&#171;
				<xsl:value-of select="$search_string" />
				&#187;
			</span> 
			найдено <xsl:value-of select="total" /> результата:   </p>
		<div class="search_message">
			<xsl:text>Найдено страниц: </xsl:text>
			<xsl:value-of select="total" />
		</div>

		<ul class="search_results">
			<xsl:apply-templates select="items/item" mode="search.results" />
		</ul>
	</xsl:template>

	<!-- отдельный результат из списка -->

	<xsl:template match="item" mode="search.results">
		<li>
			<a href="{@link}">
				<xsl:value-of select="@name" />
			</a>
			<span class="dark_grey no_bold">
				<xsl:value-of select="." disable-output-escaping="yes" />
			</span>
		</li>
	</xsl:template>
=======
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">





	<xsl:template match="udata[@method = 'insert_form']">
	<!-- <form class="search" method="get" action="/search/search_do/">
                        
                        <input type="text"  name="search_string" placeholder="Найти товар..." /><button type="submit">Найти</button>
                        
    </form> -->

  <form class="search_hform" method="get" action="/search/search_do" >
                            <input  type="search" name="search_string"/>
                          <!--   <div class="select_main">
                                <p></p>
                              <select class="type_serch" name="" id="">
                                    <option value="">по каталогу</option>
                                    <option value="">по цене</option>
                                    <option value="">по типу</option>
                                    
                                </select>
                            </div> -->
                        </form>
                        
   <!-- <form method="get" action="/search/search_do" class="searchform">
                <label>
                    <input type="search" name="search_string" class="search_input" title="поиск по сайту"/>
                </label>
                <input type="image" src="{$template-resources}img/searchbuttononinput.png" value="" title="начать поиск" class="searchbutton"/>
    </form> -->
	

	</xsl:template>

	<!-- шаблон страницы с результатами поиска -->

	<xsl:template match="result[@module = 'search'][@method = 'search_do']">

		
			<xsl:variable name="search-results"
			select="document('udata://search/search_do/')/udata" />
			
<div class="inside_productions_items">
									<div class="productions">
										<xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/(/katalog)')/udata/items/item" mode="categorylistimage" /> 
									</div>
								</div>
								<div class="widthtxtcont">
									<div class="inside_txtwrapper">
										<xsl:apply-templates select="document('udata://core/navibar/')/udata" mode="bread"/>
										<h1><xsl:value-of select="@header"/></h1>



										<div class="mainsearch_blockishe">
											<div class="searchblock">
										<form class="search_hform" method="get" action="/search/search_do">
											<input type="search_string" value="{$search_string}"/>
											<input class="srch_btn" type="button" value="найти"/>
										</form>
										
									</div>
									<div class="clearfix"></div>
										</div>






										<p class="search_pop">По вашему запросу найдено <xsl:value-of select="$search-results/total" /> товаров и две страницы</p>		
										<aside>
											<div onclick="" class="aside_searchbtns active">
												<p>Каталог товаров</p>
											</div>
											<div onclick="" class="aside_searchbtns">
												
													<p>Текстовые страницы</p>
												</div>
											
										</aside>
										<div class="inside_txtcontent">
					
											<xsl:apply-templates select="$search-results" />
			<xsl:call-template name="numpages">
				<xsl:with-param name="total"
					select="$search-results/total" />
				<xsl:with-param name="limit"
					select="$search-results/per_page" />
			</xsl:call-template>
											<div class="clearfix"></div>
											
											<!-- <article>
												<section>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum eum nesciunt excepturi quod harum fugit, dolorum ipsa. Id reiciendis tempore eligendi voluptas non hic optio, dolorum mollitia rem sapiente tempora amet sint temporibus, delectus, dicta fuga officiis. Natus sunt in numquam eos adipisci quaerat non commodi ratione minus corporis blanditiis cum ea dolore nihil totam quo nesciunt ex inventore est, amet tenetur vitae tempora ducimus aut praesentium? Veniam id, ipsam consequatur tenetur illo esse doloremque odit, sunt ipsum quae quasi.</p>
													<p>Distinctio in eveniet ratione nobis sequi doloribus, quae, qui asperiores ab minima aut, cumque consequatur mollitia sed reprehenderit rem quisquam porro numquam. Ipsa quibusdam corrupti sint, provident fugit, tempora consectetur nostrum minus cumque voluptas excepturi dignissimos quasi labore? Quis libero iure dicta accusamus nam, amet accusantium. Autem accusantium explicabo, in, repudiandae esse ut! Dicta quidem culpa doloribus minima, at mollitia placeat aut et facilis temporibus! Nostrum neque doloremque in distinctio vero. Facilis et nulla maiores quis nisi tempore ipsa consequuntur?</p>
												</section>
											</article> -->
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="clearfix"></div>
								</div>
							
			
		
		
		


	</xsl:template>

	<!-- когда ничего не найдено -->

	<xsl:template
		match="udata[@module = 'search'][@method = 'search_do'][not(items/item)]">
		
			<xsl:text>По запросу </xsl:text>
			<span>
				&#171;
				<xsl:value-of select="$search_string" />
				&#187;
			</span>
			<xsl:text> ничего не найдено.</xsl:text>
		
	</xsl:template>

	<!-- обработка результатов поиска -->

	<xsl:template
		match="udata[@module = 'search'][@method = 'search_do'][items/item]">

		<p>По запросу  
			<span class="textcolor_red">
				&#171;
				<xsl:value-of select="$search_string" />
				&#187;
			</span> 
			найдено <xsl:value-of select="total" /> результата:   </p>
		<div class="search_message">
			<xsl:text>Найдено страниц: </xsl:text>
			<xsl:value-of select="total" />
		</div>

		<ul class="search_results">
			<xsl:apply-templates select="items/item" mode="search.results" />
		</ul>
	</xsl:template>

	<!-- отдельный результат из списка -->

	<xsl:template match="item" mode="search.results">
		<li>
			<a href="{@link}">
				<xsl:value-of select="@name" />
			</a>
			<span class="dark_grey no_bold">
				<xsl:value-of select="." disable-output-escaping="yes" />
			</span>
		</li>
	</xsl:template>
>>>>>>> 2fae45de4042c059b8573aa1a8f6ff71a028e71b
</xsl:stylesheet>