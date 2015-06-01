<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
	<!-- Список товаров -->
	<xsl:template match="result[@module = 'catalog' and @method = 'category']">
		<!-- <xsl:value-of select="$filter" /> -->


		<h1><xsl:value-of select="@header"/></h1>


		<article>


			<!-- ////////////////////////////////////-->
			<xsl:choose>
				<xsl:when test="$pajax">
					<xsl:apply-templates select="document(concat('udata://catalog/getObjectsList///', $pajax * 15,'///280/1'))/udata" mode="catalogus_current">
						<xsl:with-param name="filter">
							<xsl:value-of select="substring-after(@request-uri,'?')" />
						</xsl:with-param>
					</xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="document('udata://catalog/getObjectsList//////280/1')/udata" mode="catalogus_current">
						<xsl:with-param name="filter">
							<xsl:value-of select="substring-after(@request-uri,'?')" /></xsl:with-param>
					</xsl:apply-templates>

				</xsl:otherwise>
			</xsl:choose>


			<!--			вывод каталога для "Главной" и раздела "Каталог"-->
			<xsl:choose>
				<xsl:when test="page/@parentId=0">
					<xsl:apply-templates select="document('udata://catalog/getCategoryList///120')/udata/items" mode="categorylist_main" />
				</xsl:when>
				<xsl:when test="(contains(@request-uri, 'fields_filter')) and (document('udata://catalog/getObjectsList/')/udata/total = 0)">
					<xsl:choose>
						<xsl:when test="$pajax">
							<xsl:apply-templates select="document(concat('udata://catalog/getObjectsList///', $pajax * 15,'//5/280/1'))/udata" mode="catalogus_current">
								<xsl:with-param name="filter">
									<xsl:value-of select="substring-after(@request-uri,'?')" />
								</xsl:with-param>
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="document('udata://catalog/getObjectsList/////5/280/1')/udata" mode="catalogus_current">
								<xsl:with-param name="filter">
									<xsl:value-of select="substring-after(@request-uri,'?')" /></xsl:with-param>
							</xsl:apply-templates>

						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="document('udata://catalog/getCategoryList///120')/udata/items/item" mode="categorylist_main2" />
				</xsl:otherwise>

			</xsl:choose>
			<!--//////////////////////////////////-->




			<!-- <span class="more_goods_inf">Товаров всего <xsl:value-of select="document('udata://catalog/getObjectsList/notemplate////15')/udata/total" /></span> -->
			<xsl:apply-templates select="$errors" />

			<div class="text_description">
				<xsl:value-of select=".//property[@name = 'descr']/value" disable-output-escaping="yes" />
			</div>

			<xsl:apply-templates select="$errors" />
		</article>
	</xsl:template>

	<xsl:template match="item" mode="categorylistimage">
		<xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />
		<div class="prod_cat_main">
			<a href="{@link}">
				<xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$catalog_page/group/property[@name='header_pic']/value" />
					<xsl:with-param name="width" select="180" />
					<xsl:with-param name="height">160</xsl:with-param>
				</xsl:call-template>
			</a>
		</div>
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
			</a><span> <a href="{@link}"><xsl:value-of select="."/></a></span>
			<p>
				<xsl:value-of select="$catalog_page/group/property[@name='short']/value" disable-output-escaping="yes" />
			</p>
		</div>
	</xsl:template>



	<!--	шаблон каталога в разделе каталог-->
	<xsl:template match="items" mode="categorylist_main">
		<div class="catalog_page">
			<xsl:apply-templates select="document('udata://catalog/getCategoryList///120')/udata/items/item" mode="categorii" />
		</div>
		<div class="brandslogo_cat">
			<xsl:apply-templates select="document('usel://brends')/udata/page" mode="brends2" />
		</div>
		<div class="clearfix"></div>
	</xsl:template>
	<!--/////////////////////////////////////////////////-->





	<!--    ///////////////////////-->




	<xsl:template match="page" mode="brends2">

		<xsl:choose>
			<xsl:when test="not(.//property[@name='pokazyvat_logotip_na_stranice_katalog']/value = 1)">
				<!--когда логотип отсутствует выводим ничего -->
			</xsl:when>

			<xsl:otherwise>
				<a href="{@link}">

					<xsl:call-template name="thumbing">
						<xsl:with-param name="source" select=".//property[@name='izobrazhenie_logotipa_brenda']/value" />
						<xsl:with-param name="width" select="115" />
						<xsl:with-param name="height">77</xsl:with-param>
					</xsl:call-template>

				</a>
			</xsl:otherwise>
		</xsl:choose>



	</xsl:template>




	<!--    шаблон каталога на главной и в подкатегориях третьего уровня-->
	<xsl:template match="item" mode="categorylist_main2">
		<xsl:param name="cat" />
		<xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />
		<div class="cat_item">
			<div class="image_radius">
				<a href="{@link}" title="Перейти к категории">
					<xsl:if test="$cat">
						<xsl:attribute name="href">
							<xsl:value-of select="@link" />?fields_filter[brend]=
							<xsl:value-of select="$cat" /></xsl:attribute>
					</xsl:if>
					<xsl:call-template name="thumbing">
						<xsl:with-param name="source" select="$catalog_page/group/property[@name='menu_pic_a']/value" />
						<xsl:with-param name="width" select="167" />
						<xsl:with-param name="height">167</xsl:with-param>
					</xsl:call-template>
				</a>
			</div>
			<div class="cat_icon_block">
				<xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$catalog_page/group/property[@name='header_pic']/value" />
					<xsl:with-param name="width" select="72" />
					<xsl:with-param name="height">72</xsl:with-param>
				</xsl:call-template>
			</div>
			<h4><a href="{@link}"><xsl:if test="$cat"><xsl:attribute name="href"><xsl:value-of select="@link"/>?fields_filter[brend]=<xsl:value-of select="$cat" /></xsl:attribute></xsl:if><xsl:value-of select="."/></a><font style="font-size:12px;font-weight:normal;">(Товаров <xsl:value-of select="document(concat('udata://catalog/getObjectsList/notemplate/',@id,'///3/15'))/udata/total" />)</font></h4><span></span>
		</div>
	</xsl:template>
	<!--        //////////////////-->






	<xsl:template match="item" mode="categorii">
		<xsl:param name="cat" />
		<xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />

		<div class="cat_item2">
			<h4>
					<a href="{@link}" title="Перейти к категории">
						<xsl:if test="$cat">
							<xsl:attribute name="href">
							<xsl:value-of select="@link"/>?fields_filter[brend]=<xsl:value-of select="$cat" /></xsl:attribute>
						</xsl:if>
						
						<xsl:value-of select="."/>
					</a>
				</h4>
			<ul>
				<xsl:variable name="podcatalog_page_id" select="@id" />

				<xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/0/',$podcatalog_page_id))/udata/items/item" mode="podcategorii" />


			</ul>
		</div>
	</xsl:template>



	<!--        //////////////////-->
	<xsl:template match="item" mode="podcategorii">
		<li>
			<a href="{@link}">
				<xsl:value-of select="." />
			</a>
		</li>
	</xsl:template>
	<!--        //////////////////-->




	<xsl:template match="item" mode="categorylist_main_brend">
		<xsl:param name="cat" />
		<xsl:variable name="catalog_page" select="document(concat('upage://',@id))/udata/page/properties" />
		<xsl:variable name="for_images" select="document(concat('upage://',$catalog_page//property[@name = 'kategory']/value/page/@id))/udata/page/properties" />
		<div class="cat_item">
			<div class="image_radius">
				<a href="{@link}" title="Перейти к категории">
					<xsl:if test="$cat">
						<xsl:attribute name="href">
							<xsl:value-of select="@link" />?fields_filter[brend]=
							<xsl:value-of select="$cat" /></xsl:attribute>
					</xsl:if>
					<xsl:call-template name="thumbing">
						<xsl:with-param name="source" select="$for_images/group/property[@name='menu_pic_a']/value" />
						<xsl:with-param name="width" select="167" />
						<xsl:with-param name="height">167</xsl:with-param>
					</xsl:call-template>
				</a>
			</div>
			<div class="cat_icon_block">
				<xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$for_images/group/property[@name='header_pic']/value" />
					<xsl:with-param name="width" select="72" />
					<xsl:with-param name="height">72</xsl:with-param>
				</xsl:call-template>
			</div>
			<xsl:variable name="type_id" select="document(concat('upage://',@id))//property[@name = 'kategory']/value/page/@id" />
			<xsl:variable name="obj_id" select="document(concat('upage://',$page-id))/udata/page/@object-id" />

			<h4><a href="{@link}"><xsl:if test="$cat"><xsl:attribute name="href"><xsl:value-of select="@link"/>?fields_filter[brend]=<xsl:value-of select="$cat" /></xsl:attribute></xsl:if><xsl:value-of select="."/></a><font style="font-size:12px;font-weight:normal;">(Товаров <xsl:value-of select="document(concat('usel://item_brend/', $type_id,'/', $obj_id))/udata/total" />)</font></h4><span></span>
			<xsl:value-of select="$type_id" />|||||
			<xsl:value-of select="$obj_id" />
		</div>
	</xsl:template>
	<xsl:template match="field" mode="properties_title">
		<th>
			<xsl:value-of select="@title" disable-output-escaping="yes" />
		</th>
	</xsl:template>
	<xsl:template match="udata[lines|items]" mode="catalogus">
		<xsl:param name="filter" />
		<xsl:variable name="tonext" select="document('udata://catalog/getObjectsList/')/udata/numpages/tonext_link/@page-num" />
		<xsl:variable name="total" select="document('udata://catalog/getObjectsList/')/udata/total" />
		<xsl:variable name="per_page" select="document('udata://catalog/getObjectsList/')/udata/per_page" />
		<!-- sort_catalog    -->
		<div class="sortnview">
			<!-- Сортировка -->
			<span>Сортировать по цене: </span>
			<!-- <span class="back_filter_sort" style="margin-left: -5px;text-decoration: underline;cursor: pointer;">цене</span> -->
			<img>
			<xsl:if test="($order_filter.price=1) or (not($order_filter.price))">
				<xsl:attribute name="src">
					<xsl:value-of select="concat($template-resources, '/img/up.png')" /></xsl:attribute>
				<xsl:attribute name="class">back_filter_sort</xsl:attribute>
				<xsl:attribute name="alt">сначала дешевые</xsl:attribute>
				<xsl:attribute name="style">margin-left: -5px;</xsl:attribute>
			</xsl:if>
			<xsl:if test="$order_filter.price=0">
				<xsl:attribute name="src">
					<xsl:value-of select="concat($template-resources, '/img/down.png')" /></xsl:attribute>
				<xsl:attribute name="class">back_filter_sort</xsl:attribute>
				<xsl:attribute name="alt">сначала дорогие</xsl:attribute>
				<xsl:attribute name="style">margin-left: -5px;</xsl:attribute>
			</xsl:if>

			</img>
			<!-- <span>Сортировать по:</span> -->
			<!-- <div class="back_filter_sort"><div class="select_sortnview"><p></p><select name=""><option class="first" value="">Выберите вариант</option><option value="">Вариант номер один</option><option value="">Вариант номер два</option><option value="">Вариант номер три</option></select></div></div> -->
			<div class="floatinrgh_sort"><span>Вид каталога:</span><img class="plitka_view" src="{$template-resources}img/sort_plit.png" height="18" width="31" alt="плитка" /><img class="spisok_view" src="{$template-resources}img/sort_list.png" height="18" width="31" alt="список" />
			</div>
		</div>
		<div class="clearfix"></div>
		<!-- end_sort_catalog -->
		<div id="catalog_list" class="cat_item_list">
			<!--cat_item_list-->
			<!-- <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/')/udata/items/item" mode="categorylist" />  -->
			<xsl:apply-templates select="lines/item" mode="catalog_item" />
			<xsl:apply-templates select="items/item" mode="catalog_item" />
		</div>
		<!--конец списка товаров-->
		<xsl:if test="$total&gt;$per_page">
			<xsl:choose>
				<xsl:when test="page/@parentId = 0">
					<a class="more_goods" id="{@pageId}" title="{$per_page}" rel="{$total}" filter="{$filter}" parent="1" alt="{$tonext}" href="?p={$tonext}">
						<xsl:if test="$filter">
							<xsl:attribute name="href">?p=
								<xsl:value-of select="$tonext" />}&amp;
								<xsl:value-of select="$filter" /></xsl:attribute>
						</xsl:if>показать еще</a>
				</xsl:when>
				<xsl:otherwise>
					<a class="more_goods" id="{@pageId}" title="{$per_page}" rel="{$total}" alt="{$tonext}" parent="0" filter="{$filter}" href="?p={$tonext}">
						<xsl:if test="$filter">
							<xsl:attribute name="href">?p=
								<xsl:value-of select="$tonext" />}&amp;
								<xsl:value-of select="$filter" /></xsl:attribute>
						</xsl:if>показать еще</a>
				</xsl:otherwise>
			</xsl:choose>

			<!-- <xsl:call-template name="numpages"><xsl:with-param name="total" select="document('udata://catalog/getObjectsList/notemplate////15')/udata/total" /><xsl:with-param name="limit" select="document('udata://catalog/getObjectsList/notemplate////15')/udata/per_page" /></xsl:call-template>  --><span class="more_goods_inf">Показано <xsl:value-of select="document('udata://catalog/getObjectsList/notemplate////15')/udata/per_page" /> товаров из <xsl:value-of select="document('udata://catalog/getObjectsList/notemplate////15')/udata/total" /></span>
		</xsl:if>
		<div style="display:none">
			<xsl:call-template name="numpages">
				<xsl:with-param name="total" select="document('udata://catalog/getObjectsList/notemplate////15')/udata/total" />
				<xsl:with-param name="limit" select="document('udata://catalog/getObjectsList/notemplate////15')/udata/per_page" /></xsl:call-template>
		</div>
		<div id="clickerator">
			<div class="loader"><span></span><span></span><span></span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="udata" mode="catalogus">
		<!-- К сожалению таких товаров не найдено! -->
	</xsl:template>
	<xsl:template match="udata[lines|items]" mode="catalogus_current">
		<xsl:param name="filter" />
		<xsl:variable name="tonext">
			<xsl:choose>
				<xsl:when test="$pajax">
					<xsl:value-of select="$pajax" /></xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="document('udata://catalog/getObjectsList/////5/280/1')/udata/numpages/tonext_link/@page-num" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="total" select="document('udata://catalog/getObjectsList/////5/280/1')/udata/total" />
		<!-- <xsl:variable name="per_page" select="document('udata://catalog/getObjectsList/')/udata/per_page" /> -->
		<xsl:variable name="per_page">
			<xsl:choose>
				<xsl:when test="$pajax">
					<xsl:value-of select="(document('udata://catalog/getObjectsList/////5/280/1')/udata/per_page) * $pajax" /></xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="document('udata://catalog/getObjectsList/////5/280/1')/udata/per_page" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- sort_catalog    -->
		<div class="sortnview">
			<!-- Сортировка -->
			<span>Сортировать по цене: </span>
			<!-- <span class="back_filter_sort" style="margin-left: -5px;text-decoration: underline;cursor: pointer;">цене</span> -->
			<img>
			<xsl:if test="($order_filter.price=1) or (not($order_filter.price))">
				<xsl:attribute name="src">
					<xsl:value-of select="concat($template-resources, '/img/up.png')" /></xsl:attribute>
				<xsl:attribute name="class">back_filter_sort</xsl:attribute>
				<xsl:attribute name="alt">сначала дешевые</xsl:attribute>
				<xsl:attribute name="style">margin-left: -5px;</xsl:attribute>
			</xsl:if>
			<xsl:if test="$order_filter.price=0">
				<xsl:attribute name="src">
					<xsl:value-of select="concat($template-resources, '/img/down.png')" /></xsl:attribute>
				<xsl:attribute name="class">back_filter_sort</xsl:attribute>
				<xsl:attribute name="alt">сначала дорогие</xsl:attribute>
				<xsl:attribute name="style">margin-left: -5px;</xsl:attribute>
			</xsl:if>

			</img>
			<!-- <span>Сортировать по:</span> -->
			<!-- <div class="back_filter_sort"><div class="select_sortnview"><p></p><select name=""><option class="first" value="">Выберите вариант</option><option value="">Вариант номер один</option><option value="">Вариант номер два</option><option value="">Вариант номер три</option></select></div></div> -->
			<div class="floatinrgh_sort"><span>Вид каталога:</span><img class="plitka_view" src="{$template-resources}img/sort_plit.png" height="18" width="31" alt="плитка" /><img class="spisok_view" src="{$template-resources}img/sort_list.png" height="18" width="31" alt="список" />
			</div>
		</div>
		<div class="clearfix"></div>
		<!-- end_sort_catalog -->
		<div id="catalog_list">
			<!--cat_item_list-->
			<!-- <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/')/udata/items/item" mode="categorylist" />  -->
			<xsl:apply-templates select="lines/item" mode="catalog_item" />
			<xsl:apply-templates select="items/item" mode="catalog_item" />
		</div>
		<!--конец списка товаров-->
		<xsl:if test="$total&gt;$per_page">

			<div class="show_buttons">
				<a class="more_goods" id="{$page-id}" title="{$per_page}" rel="{$total}" alt="{$tonext}" parent="5" filter="{$filter}" href="?p={$tonext}">
					<xsl:attribute name="data-per-page">
						<xsl:value-of select="document('udata://catalog/getObjectsList/////5/280/1')/udata/per_page" /></xsl:attribute>
					<xsl:if test="$filter">
						<xsl:attribute name="href">?p=
							<xsl:value-of select="$tonext" />}&amp;
							<xsl:value-of select="$filter" /></xsl:attribute>
					</xsl:if>показать еще</a>
				<a class="all_goods" id="{$page-id}_all" title="{$per_page}" rel="{$total}" alt="{$tonext}" parent="5" filter="{$filter}" href="?p={$tonext}">
					<xsl:attribute name="data-per-page">
						<xsl:value-of select="document('udata://catalog/getObjectsList/////5/280/1')/udata/per_page" /></xsl:attribute>
					<xsl:attribute name="data-total">
						<xsl:value-of select="document('udata://catalog/getObjectsList/////5/280/1')/udata/total" /></xsl:attribute>

					<xsl:if test="$filter">
						<xsl:attribute name="href">?
							<xsl:value-of select="$filter" /></xsl:attribute>
					</xsl:if>показать все</a>
			</div>
			<!-- <xsl:call-template name="numpages"><xsl:with-param name="total" select="document('udata://catalog/getObjectsList/notemplate////15')/udata/total" /><xsl:with-param name="limit" select="document('udata://catalog/getObjectsList/notemplate////15')/udata/per_page" /></xsl:call-template>  -->
			<span class="more_goods_inf">Показано <xsl:value-of select="$per_page" /> товаров из <xsl:value-of select="$total" /></span>
		</xsl:if>
		<div style="display:none">
			<xsl:call-template name="numpages">
				<xsl:with-param name="total" select="document('udata://catalog/getObjectsList')/udata/total" />
				<xsl:with-param name="limit" select="document('udata://catalog/getObjectsList')/udata/per_page" /></xsl:call-template>
		</div>
		<div id="clickerator">
			<!--                <img src="{$template-resources}js/fancybox/fancybox_loading.gif" />-->
			<div class="loader"><span></span><span></span><span></span>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="udata" mode="catalogus_current">
		<!-- <p>К сожалению таких товаров не найдено!</p>-->
	</xsl:template>








	<!-- Товар в списке -->
	<xsl:template match="item" mode="catalog_item">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="brand" select="$item/page/properties/group/property[@name='brend']/value/item/@id" />
		<xsl:variable name="brand_name" select="document(concat('uobject://', $brand))/udata/object" />
		<!--список товаров-->
		<div class="cat_item_plits" name="{@id}">
			<!--cat_item_list-->
			<div class="maingoodinfo">
				<a class="cat_goodimage" href="{@link}" data-id="{@id}">
					<xsl:call-template name="thumbing">
						<xsl:with-param name="source" select="$item/page/properties/group/property[@name='foto_1']/value" />
						<xsl:with-param name="width" select="201" />
						<xsl:with-param name="height">201</xsl:with-param>
					</xsl:call-template>
					<!--закладка распродажи-->
					<xsl:apply-templates select="$item/page/properties/group/property[@name='akcionnyj_tovar']/title" mode="akcii_sprite" />
					<!--закладка Акции-->
					<xsl:apply-templates select="$item/page/properties/group/property[@name='rasprodazha']/title" mode="rasp_sprite" />


					<!--					плашечка скидки на картинке товара в каталоге-->
					<xsl:apply-templates select="document(concat('udata://emarket/price/', $item/page/@id))/udata" mode="pricesalepercent" />








				</a>
				<h4><a href="{@link}" data-id="{@id}"><xsl:value-of select="$item/page/properties/group/property[@name='nazvanie']/value"/></a></h4> <span class="manufacturer_block">Производитель: <a href="{$brand_name/properties/group/property[@name='linkthis']/value}"><xsl:value-of select="$item/page/properties/group/property[@name='brend']/value/item/@name" disable-output-escaping="yes"/></a></span><span class="articul_block">Артикул:  <a href="{@link}"><xsl:value-of select="$item/page/properties/group/property[@name='artikul']/value" disable-output-escaping="yes"/></a></span>
				<p>
					<xsl:value-of select="$item/page/properties/group/property[@name='kratkoe_opisanie']/value" disable-output-escaping="yes" />
				</p>
				<div class="clearfix"></div>
			</div>
			<xsl:choose>
				<xsl:when test="$item/page/properties/group/property[@name='common_quantity']/value&gt;0">
					<div class="pricenbuttons">
						<xsl:apply-templates select="document(concat('udata://emarket/price/', $item/page/@id,'//0'))/udata" mode="price" />
						<input class="buybutton" onclick="site.basket.add({@id}); yaCounter27431942.reachGoal('to_cart'); return true;" id="add_basket_{@id}" type="button" value="Купить" /><span class="instok">в наличии</span>
						<!-- <span class="goodcompare"><a href="/emarket/addToCompare/{@id}">сравнить</a></span> -->
					</div>
					<div class="clearfix"></div>
				</xsl:when>
				<xsl:otherwise>
					<div class="pricenbuttons">
						<xsl:apply-templates select="document(concat('udata://emarket/price/', $item/page/@id,'//0'))/udata" mode="price" />

						<!-- <a id="{$item/page/@id}" href="#show1" class="buybutton outnstock">Под заказ</a> -->
						<input id="{$item/page/@id}" data-tovarname="{$item/page/properties/group/property[@name='brend']/value/item/@name}" data-price="{format-number(document(concat('udata://emarket/price/', $item/page/@id,'//0'))/udata/price/actual,'#')}" data-article="{$item/page/properties/group/property[@name='artikul']/value}" href="#show1" class="buybutton outnstock" rel="nofollow" type="submit" value="Под заказ" />

						<span class="not_instok">отсутствует</span>
						<!-- <span class="goodcompare"><a href="/emarket/addToCompare/{@id}">сравнить</a></span> -->
					</div>
					<div class="clearfix"></div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<!--конец списка товаров-->
	</xsl:template>


	<xsl:template match="udata" mode="pricesalepercent">


		<xsl:choose>
			<xsl:when test="discount">



				<span class="salepercent"> - <xsl:value-of select="discount/description" disable-output-escaping="yes" /></span>


			</xsl:when>
			<xsl:otherwise>

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="page" mode="catalog_item">
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
					<xsl:apply-templates select="$item/page/properties/group/property[@name='akcionnyj_tovar']/title" mode="akcii_sprite" />
					<!--закладка Акции-->
					<xsl:apply-templates select="$item/page/properties/group/property[@name='rasprodazha']/title" mode="rasp_sprite" />


					<!--					плашечка скидки на картинке товара в каталоге-->
					<xsl:apply-templates select="document(concat('udata://emarket/price/', $item/page/@id))/udata" mode="pricesalepercent" />



				</a>
				<h4><a href="{@link}"><xsl:value-of select="$item/page/properties/group/property[@name='nazvanie']/value"/></a></h4> <span class="manufacturer_block">Производитель: <a href="{$brand_name/properties/group/property[@name='linkthis']/value}"><xsl:value-of select="$item/page/properties/group/property[@name='brend']/value/item/@name" disable-output-escaping="yes"/></a></span><span class="articul_block">Артикул:  <a href="{@link}"><xsl:value-of select="$item/page/properties/group/property[@name='artikul']/value" disable-output-escaping="yes"/></a></span>
				<p>
					<xsl:value-of select="$item/page/properties/group/property[@name='kratkoe_opisanie']/value" disable-output-escaping="yes" />
				</p>
				<div class="clearfix"></div>
			</div>
			<xsl:choose>
				<xsl:when test="$item/page/properties/group/property[@name='common_quantity']/value&gt;0">
					<div class="pricenbuttons">
						<xsl:apply-templates select="document(concat('udata://emarket/price/', $item/page/@id,'//0'))/udata" mode="price" />
						<input class="buybutton" onclick="site.basket.add({@id}); yaCounter27431942.reachGoal('to_cart'); return true;" id="add_basket_{@id}" type="button" value="Купить" /><span class="instok">в наличии</span>
						<!-- <span class="goodcompare"><a href="/emarket/addToCompare/{@id}">сравнить</a></span> -->
					</div>
					<div class="clearfix"></div>
				</xsl:when>
				<xsl:otherwise>
					<div class="pricenbuttons">
						<xsl:apply-templates select="document(concat('udata://emarket/price/', $item/page/@id,'//0'))/udata" mode="price" />

						<!-- <a id="{$item/page/@id}" href="#show1" class="buybutton outnstock">Под заказ</a> -->

						<input id="{$item/page/@id}" data-tovarname="{$item/page/properties/group/property[@name='brend']/value/item/@name}" data-price="{format-number(document(concat('udata://emarket/price/', $item/page/@id,'//0'))/udata/price/actual,'#')}" data-article="{$item/page/properties/group/property[@name='artikul']/value}" href="#show1" class="buybutton outnstock" rel="nofollow" type="submit" value="Под заказ" />

						<span class="not_instok">отсутствует</span>
						<!-- <span class="goodcompare"><a href="/emarket/addToCompare/{@id}">сравнить</a></span> -->
					</div>
					<div class="clearfix"></div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<!--конец списка товаров-->
	</xsl:template>
	<!-- Страница товара -->
	<xsl:template match="result[@module = 'catalog' and @method = 'object']">
		<!-- <xsl:apply-templates select="page/properties/group/property[@name='katalogi']/value" mode="brand" /> -->
		<xsl:variable name="brand" select="page/properties/group/property[@name='brend']/value/item/@id" />
		<xsl:variable name="brand_name" select="document(concat('uobject://', $brand))/udata/object" />
		<!--        <xsl:variable name="itemo" select="document(concat('upage://', @id))/udata" />-->
		<script type="text/javascript">
			$(document).ready(function () {
						ga('ec:addProduct', {
									'id': '<xsl:value-of select="page/properties/group/property[@name='
									artikul ']/value" />',
									'name': '<xsl:value-of select="page/properties/group/property[@name='
									nazvanie ']/value" />',
									'category': '<xsl:value-of select="document(concat('
									upage: //', parents/page[last()]/@id))//property[@name='h1']/value" />','brand': '<xsl:value-of select="page/properties/group/property[@name='brend']/value/item/@name" />'});ga('ec:setAction', 'detail');ga('send', 'pageview');$('div.buy_price').on( "click", "input", function() {ga('ec:addProduct', {'id': '<xsl:value-of select="page/properties/group/property[@name='artikul']/value" />','name': '<xsl:value-of select="page/properties/group/property[@name='nazvanie']/value" />','category': '<xsl:value-of select="document(concat('upage://', parents/page[last()]/@id))//property[@name='h1']/value" />','brand': '<xsl:value-of select="page/properties/group/property[@name='brend']/value/item/@name" />','price': '<xsl:value-of select="page/properties/group/property[@name='price']/value" />','quantity': '1'});ga('ec:setAction', 'add');ga('send', 'event', 'UX', 'click', 'add to cart');});});
		</script>
		<article>
			<h1><xsl:value-of select="page/properties/group/property[@name='nazvanie']/value"/></h1>
			<!--                Слайдер товара-->
			<div class="good_content">
				<div id="slider2" class="flexslider2">
					<ul class="slides good_slides">
						<li>
							<!-- <img src="img/slides/slide1.png" /> -->
							<a href="{page/properties/group/property[@name='foto_1']/value}" rel="group">
								<xsl:if test="page/properties/group/property[@name='foto_1']/value">
									<xsl:attribute name="class">fancybox</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="thumbing">
									<xsl:with-param name="source" select="page/properties/group/property[@name='foto_1']/value" />
									<xsl:with-param name="width" select="336" />
									<xsl:with-param name="height">336</xsl:with-param>
								</xsl:call-template>
							</a>
						</li>
						<xsl:apply-templates select="page/properties/group[@name='fotos']/property" mode="slider2" />
						<!-- items mirrored twice, total of 12 -->
					</ul>
					<!--закладка распродажи-->
					<xsl:apply-templates select="page/properties/group/property[@name='akcionnyj_tovar']/title" mode="akcii_sprite" />
					<!--закладка Акции-->
					<xsl:apply-templates select="page/properties/group/property[@name='rasprodazha']/title" mode="rasp_sprite" />
				</div>
				<div id="carousel2" class="flexslider2">
					<ul class="slides good_slides">
						<li>
							<xsl:call-template name="thumbing">
								<xsl:with-param name="source" select="page/properties/group/property[@name='foto_1']/value" />
								<xsl:with-param name="width" select="110" />
								<xsl:with-param name="height">110</xsl:with-param>
							</xsl:call-template>
						</li>
						<xsl:apply-templates select="page/properties/group[@name='fotos']/property" mode="carousel2" />
					</ul>
				</div>
				<div class="goodpage_info">
					<xsl:choose>
						<xsl:when test="page/properties/group/property[@name='common_quantity']/value&gt;0">
							<div class="buy_price">
								<xsl:apply-templates select="document(concat('udata://emarket/price/', page/@id,'//0'))/udata" mode="price" />
								<input href="javascript://" onclick="site.basket.add({@pageId}); yaCounter27431942.reachGoal('to_cart'); return true;" id="add_basket_{@pageId}" class="buybutton" type="button" value="Купить" />
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="buy_price">
								<xsl:apply-templates select="document(concat('udata://emarket/price/', page/@id,'//0'))/udata" mode="price" />

								<!-- <a id="{page/@id}" href="#show1" class="buybutton outnstock">Под заказ</a> -->

								<input id="{page/@id}" data-tovarname="{page/properties/group/property[@name='brend']/value/item/@name}" data-price="{format-number(document(concat('udata://emarket/price/', page/@id,'//0'))/udata/price/actual,'#')}" data-article="{page/properties/group/property[@name='artikul']/value}" href="#show1" class="buybutton outnstock" rel="nofollow" type="submit" value="Под заказ" />


							</div>
						</xsl:otherwise>
					</xsl:choose>
					<div class="customer_artic"><span class="manufacturer_block">Производитель: <a href="{$brand_name/properties/group/property[@name='linkthis']/value}"><xsl:value-of select="page/properties/group/property[@name='brend']/value/item/@name" disable-output-escaping="yes"/></a></span><span class="articul_block">Артикул: <xsl:value-of select="page/properties/group/property[@name='artikul']/value" disable-output-escaping="yes"/></span>
						<span class="print_block" onclick="location.href='/getpdf2.php?id={page/@id}'">версия для печати</span>
					</div>
					<div class="instock_compare">
						<xsl:choose>
							<xsl:when test="page/properties/group/property[@name='common_quantity']/value&gt;0"><span class="instok">в наличии</span>
								<!-- <span class="goodcompare"><a href="/emarket/addToCompare/page/{@id}">сравнить</a></span> -->
							</xsl:when>
							<xsl:otherwise>
								<div class="pricenbuttons"><span class="not_instok">отсутствует</span>
									<!-- <span class="goodcompare"><a href="/emarket/addToCompare/page/{@id}">сравнить</a></span> -->
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!--                Конец слайдера товара-->
		</article>
		<!-- Наши работы, переменая -->
		<xsl:variable name="photo_in_object" select="document(concat('usel://item_in_object/', @pageId))" />
		<xsl:variable name="video_in_brends" select="document(concat('usel://brend_video/', .//property[@name='brend']/value/item/@id))" />
		<article>
			<div class="good_bookmopt">
				<ul class="good_bookmarks">
					<li><a name="tab1" href="javascript://">Описание</a>
					</li>
					<li><a name="tab2" href="javascript://">Характеристики</a>
					</li>
					<xsl:if test="((page/properties/group/property[@name='video']/value/page) or ($video_in_brends/udata/total !=0))">
						<li><a name="tab6" href="javascript://">Видео</a>
						</li>
					</xsl:if>
					<li><a name="tab3" href="javascript://">Загрузки</a>
					</li>
					<xsl:if test="$photo_in_object/udata/total != 0">
						<li><a name="tab4" href="javascript://">Наши работы</a>
						</li>
					</xsl:if>
					<li><a name="tab5" href="javascript://">Отзывы</a>
					</li>
				</ul>
				<div id="tab1">
					<h3><xsl:apply-templates select="$errors/items/item" mode="error" /></h3>
					<xsl:value-of select="page/properties/group/property[@name='polnoe_opisanie']/value" disable-output-escaping="yes" />
				</div>
				<div id="tab2" style="display:none;">
					<table style="width: 50%; float:left">
						<!-- <caption>Название таблицы</caption> -->
						<tbody>
							<tr>
								<th>Название</th>
								<th>Значение</th>
							</tr>
							<xsl:apply-templates select="page/properties/group[@name='catalog_option_props']/property" mode="properties" />
						</tbody>
					</table>
					<xsl:if test="page/properties/group/property[@name='foto_razmerov']/value">
						<a href="{page/properties/group/property[@name='foto_razmerov']/value}" class="fancybox" rel="group">
							<xsl:call-template name="thumbing">
								<xsl:with-param name="source" select="page/properties/group/property[@name='foto_razmerov']/value" />
								<xsl:with-param name="width" select="200" />
								<xsl:with-param name="height">auto</xsl:with-param>
							</xsl:call-template>
						</a>
					</xsl:if>
					<xsl:if test="page/properties/group/property[@name='foto_razmerov_2']/value">
						<a href="{page/properties/group/property[@name='foto_razmerov_2']/value}" class="fancybox" rel="group">
							<xsl:call-template name="thumbing">
								<xsl:with-param name="source" select="page/properties/group/property[@name='foto_razmerov_2']/value" />
								<xsl:with-param name="width" select="200" />
								<xsl:with-param name="height">auto</xsl:with-param>
							</xsl:call-template>
						</a>
					</xsl:if>
					<xsl:if test="page/properties/group/property[@name='foto_razmerov_3']/value">
						<a href="{page/properties/group/property[@name='foto_razmerov_3']/value}" class="fancybox" rel="group">
							<xsl:call-template name="thumbing">
								<xsl:with-param name="source" select="page/properties/group/property[@name='foto_razmerov_3']/value" />
								<xsl:with-param name="width" select="200" />
								<xsl:with-param name="height">auto</xsl:with-param>
							</xsl:call-template>
						</a>
					</xsl:if>
				</div>
				<div id="tab3" style="display:none;">
					<ul>
						<xsl:apply-templates select="document(concat('uobject://', $brand))/udata/object/properties/group/property[@name='katalogi']/value/page" mode="files" />
						<xsl:apply-templates select="document(concat('usel://brend_pdf/', @pageId))/udata/item" mode="brand_pdf" />
						<xsl:apply-templates select="document(concat('usel://brend_pdf_too/', $brand))/udata/item" mode="brand_pdf" />
					</ul>
				</div>
				<div id="tab5" style="display:none;">
					<xsl:apply-templates select="document('udata://comments/insert/')/udata" />
					<xsl:apply-templates select="user" mode="addcomment" />
				</div>
				<xsl:if test="$photo_in_object/udata/total != 0">
					<div id="tab4" style="display:none;">
						<!-- <ul class="slides"> -->
						<xsl:apply-templates select="$photo_in_object/udata/page" mode="item_in_object" />
						<!-- </ul> -->
					</div>
				</xsl:if>
				<div id="tab6" style="display:none;">
					<ul class="content_gallery">
						<xsl:apply-templates select="page/properties/group/property[@name='video']/value/page" mode="slider2_video" />
						<xsl:apply-templates select="$video_in_brends/udata/page" mode="slider2_video" />
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
			<xsl:if test="page/properties/group[@name='svyazannye_tovary'] or page/properties/group/property[@name='tovary']/value">
				<h3>Дополнительно к этому товару вы можете приобрести:</h3>
				<!--                      <xsl:value-of select="page/properties/group/property[@name='nazvanie']/value"/>-->
				<div id="catalog_list" class="cat_item_list">
					<div id="towars" class="flexslider">
						<ul class="slides">
							<xsl:apply-templates select="page/properties/group[@name='svyazannye_tovary']/property" mode="dop_goods_connected" />
							<xsl:apply-templates select="page/properties/group/property[@name='tovary']/value/page" mode="dop_goods_connected_tree" /> </ul>
					</div>
				</div>
			</xsl:if>
		</article>
	</xsl:template>
	<!-- Шаблон вывода в закладке наши работы -->
	<xsl:template match="udata/page" mode="item_in_object">
		<!-- <li style=""> -->
		<a class="fancybox" rel="group" href="{.//property[@name = 'photo']/value}" title="{name}">

			<xsl:call-template name="thumbing">
				<xsl:with-param name="source" select=".//property[@name = 'photo']/value" />
				<xsl:with-param name="width" select="200" />
				<xsl:with-param name="height">150</xsl:with-param>
				<xsl:with-param name="class">item_in_object</xsl:with-param>
			</xsl:call-template>
		</a>
		<!-- </li> -->
	</xsl:template>
	<!--    шаблоны для ации и распродаж-->
	<xsl:template match="title" mode="akcii_sprite"><span class="akcii_sprite"> <xsl:value-of select="." disable-output-escaping="yes" /></span>
	</xsl:template>
	<xsl:template match="title" mode="rasp_sprite"><span class="rasp_sprite"> <xsl:value-of select="." disable-output-escaping="yes" /></span>
	</xsl:template>
	<!--    шаблоны для ации и распродаж-->
	<xsl:template match="page" mode="files">
		<xsl:variable name="file" select="document(concat('upage://', @id))/udata/page/properties/group/property[@name='fs_file']/value" />
		<li>
			<a href="{$file}" target="_blank">
				<xsl:value-of select="name" />
			</a>
		</li>
	</xsl:template>
	<xsl:template match="item" mode="brand_pdf">
		<xsl:variable name="file" select="document(concat('uobject://', @id))/udata/object/properties/group/property[@name='fs_file']/value" />
		<li>
			<a href="{$file}" target="_blank">
				<xsl:value-of select="@name" />
			</a>
		</li>
	</xsl:template>

	<xsl:template match="udata" mode="brand">
		<a href="#">
			<xsl:value-of select="object/properties/group/property[@name='h1']/value" />
		</a>,
		<xsl:value-of select="object/properties/group/property[@name='strana']/value/item/@name" /></xsl:template>
	<xsl:template match="property[@type!='wysiwyg']" mode="properties">
		<tr>
			<td>
				<xsl:value-of select="title" />
			</td>
			<td>
				<xsl:value-of select="value" disable-output-escaping="yes" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="property[@type='wysiwyg' or @type='img_file' or @name='nazvanie' or @name='kratkoe_opisanie']" mode="properties"></xsl:template>
	<xsl:template match="property[@type='relation']" mode="properties">
		<tr>
			<td>
				<xsl:value-of select="title" />
			</td>
			<td>
				<xsl:value-of select="value/item/@name" disable-output-escaping="yes" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="property[@multiple='multiple']" mode="properties">
		<tr>
			<td>
				<xsl:value-of select="title" />
			</td>
			<td>
				<xsl:apply-templates select="value/item" mode="multi" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="item" mode="multi">
		<xsl:if test="position()&gt;1">,</xsl:if>
		<xsl:value-of select="@name" disable-output-escaping="yes" /></xsl:template>
	<xsl:template match="udata" mode="search_form">
		<form class="popup" action="/podbor" method="GET">
			<input type="hidden" name="fields_filter[non_filtered]" value="0" />
			<xsl:apply-templates select="group" mode="search" />
			<!-- <xsl:apply-templates select="document('udata://catalog/search/(/katalog/proizvoditel_1/)/')/udata" mode="search_form"/>     -->
		</form>
	</xsl:template>
	<xsl:template match="property[position()&gt;1]" mode="slider2">
		<li>
			<!-- <img src="img/slides/slide1.png" /> -->
			<a href="{value}" class="fancybox" rel="group">
				<xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="value" />
					<xsl:with-param name="width" select="336" />
					<xsl:with-param name="height">336</xsl:with-param>
				</xsl:call-template>
			</a>
		</li>
	</xsl:template>
	<xsl:template match="property[position()&gt;1]" mode="carousel2">
		<li>
			<xsl:call-template name="thumbing">
				<xsl:with-param name="source" select="value" />
				<xsl:with-param name="width" select="90" />
				<xsl:with-param name="height">135</xsl:with-param>
			</xsl:call-template>
		</li>
	</xsl:template>
	<xsl:template match="property[position()=1]" mode="slider2"></xsl:template>
	<xsl:template match="property[position()=1]" mode="carousel2"></xsl:template>
	<xsl:template match="page" mode="slider2_video">
		<xsl:variable name="page" select="document(concat('upage://',@id))/udata/page" />
		<li>
			<!-- <img src="img/slides/slide1.png" /> -->
			<a href="#data_video_{@id}" class="fancybox" title="{name}" rel="group">
				<xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$page/properties/group/property[@name='photo']/value" />
					<xsl:with-param name="width" select="200" />
					<xsl:with-param name="height">150</xsl:with-param>
				</xsl:call-template>
			</a>
			<div style="display:none">
				<div id="data_video_{@id}">
					<xsl:value-of select="$page/properties/group/property[@name='video']/value" disable-output-escaping="yes" />
				</div>
			</div>
		</li>
	</xsl:template>
	<xsl:template match="page" mode="carousel2_video">
		<xsl:variable name="page" select="document(concat('upage://',@id))/udata/page" />
		<li>
			<xsl:call-template name="thumbing">
				<xsl:with-param name="source" select="$page/properties/group/property[@name='photo']/value" />
				<xsl:with-param name="width" select="90" />
				<xsl:with-param name="height">135</xsl:with-param>
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
	<xsl:template match="udata[@module='catalog'][@method='search']" mode='find_model'>
		<xsl:param name="type_id" />
		<xsl:param name="object" />
		<xsl:param name="categoryid" />
		<xsl:param name="dont_show_brend" select="0" />
		<xsl:param name="parent_obj" />
		<xsl:variable name="linking" select="document(concat('upage://', $categoryid))/udata/page/@link" />
		<form action="{$linking}" id="search_param" method="get">
			<xsl:if test="$object">
				<xsl:attribute name="action">
					<xsl:value-of select="$object" /></xsl:attribute>
			</xsl:if>
			<xsl:attribute name="data-categoryid">
				<xsl:value-of select="$categoryid" />
			</xsl:attribute>
			<xsl:apply-templates select="group/field" mode="search">
				<xsl:with-param name="typeid" select="$type_id" />
				<xsl:with-param name="categoryid" select="$categoryid" />
				<xsl:with-param name="dont_show_brend" select="$dont_show_brend" />
				<xsl:with-param name="parent_obj" select="$parent_obj" />

			</xsl:apply-templates>
			<xsl:if test="$order_filter.price=0">
				<input type="hidden" name="order_filter[price]" value="0" />
			</xsl:if>
			<div class="submit_filtbutt">
				<input type="submit" value="Подобрать" />
			</div>
		</form>
	</xsl:template>
	<xsl:template match="field[@data-type = 'boolean']" mode="search">
		<div class="back_filter">
			<div class="chkbx_filt">
				<input id="n{@id}" name="fields_filter[{@name}]" type="checkbox" value="1" class="css-checkbox">
				<xsl:if test="checked">
					<xsl:attribute name="checked">checked</xsl:attribute>
				</xsl:if>
				</input>
				<label for="n{@id}" class="css-label radGroup1">
					<xsl:value-of select="@title" />
				</label>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="field[ @data-type = 'int' or @data-type = 'float' or @data-type = 'string' or @data-type = 'price'][@name != 'obem_parilki_from' or @name != 'obem_parilki_to']" mode="search">
		<xsl:param name="typeid" />
		<xsl:variable name="max_val" select="document(concat('usel://max_val/', @name,'/', $typeid,'/1'))/udata/page/extended/properties/property/value" />
		<!-- <xsl:value-of select="$typeid" /> -->
		<div class="back_filterslid">
			<!-- <xsl:value-of select="$max_val"/> -->
			<p>
				<label>
					<xsl:value-of select="@title" />
				</label>
				<div class="slider-range" id="{@name}"></div>
				<xsl:choose>
					<xsl:when test="not (value_to) or value_to=0">от
						<input id="min_{@name}" placeholder="0" class="min_val" name="fields_filter[{@name}][0]" size="10" type="text" title="не менее" />
					</xsl:when>
					<xsl:otherwise>от
						<input id="min_{@name}" placeholder="{value_from}" value="{value_from}" class="min_val" name="fields_filter[{@name}][0]" size="10" type="text" title="не менее" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="not (value_to) or value_to=0">до
						<input id="max_{@name}" placeholder="{$max_val}" class="max_val" rel="{$max_val}" name="fields_filter[{@name}][1]" size="10" type="text" title="не более" />
					</xsl:when>
					<xsl:otherwise>до
						<input id="max_{@name}" placeholder="{value_to}" value="{value_to}" class="max_val" rel="{$max_val}" name="fields_filter[{@name}][1]" size="10" type="text" title="не более" />
					</xsl:otherwise>
				</xsl:choose>
			</p>
		</div>
	</xsl:template>
	<xsl:template match="field[@name = 'obem_parilki_from']" mode="search">
		<!-- <xsl:value-of select="$max_val"/> -->
		<div class="back_filterslid">
			<label>Введите объем Вашей парилки</label>
			<input style="color: #000 !important;background: #fff;height: 20px;width: 40px;/* margin: 0; *//* padding: 1px; */" id="valueee" value="{value_to}" name="{@name}" size="10" type="text" />
			<input id="min_{@name}" value="0" name="fields_filter[{@name}][0]" type="hidden" />
			<input id="max_{@name}" value="{value_to}" name="fields_filter[{@name}][1]" type="hidden" title="не более" />
		</div>
	</xsl:template>
	<xsl:template match="field[@name = 'obem_parilki_to']" mode="search">
		<input id="min_{@name}" value="" name="fields_filter[{@name}][0]" type="hidden" />
	</xsl:template>
	<!-- <xsl:templatematch="field[@data-type = 'relation' or @data-type = 'symlink'][@name!='pennyj' or @name!='koncentrat']" mode="search"><span class="name"><xsl:value-of select="@title"/></span><xsl:apply-templates select="values/item" mode="search"><xsl:sort select="@id"/><xsl:with-param name="name" select="@name"/></xsl:apply-templates></xsl:template> -->
	<xsl:template match="field[@data-type = 'relation']" mode="search">
		<xsl:param name="typeid" />
		<xsl:param name="categoryid" />
		<xsl:param name="dont_show_brend" />
		<xsl:param name="parent_obj" />

		<!-- <xsl:value-of select="$categoryid" /> -->
		<xsl:choose>
			<xsl:when test="@name = 'brend' and $dont_show_brend = 1">

				<input id="{@name}" value="{$parent_obj}" name="fields_filter[{@name}]" type="hidden" />

			</xsl:when>
			<xsl:otherwise>


				<div class="back_filter">
					<div class="select_filterbl">
						<p></p>


						<select id="{@name}" name="fields_filter[{@name}]">
							<option class="first" value="">
								<xsl:value-of select="@title" />
							</option>
							<!--  <xsl:choose><xsl:when test="$typeid = '86'"> -->

							<!-- <xsl:choose>
						 <xsl:when test="@name = 'brend'">
						 	<xsl:choose>
						 		<xsl:when test="$filter">
									<xsl:apply-templates select="document(concat('udata://catalog/bsearch/', $page-id, '3321'))/udata/items/item" mode="search_select1" />
						 		</xsl:when>
						 		<xsl:otherwise>
						 		</xsl:otherwise>11
						 	</xsl:choose>
									<xsl:apply-templates select="document(concat('udata://catalog/bsearch/', $page-id,/))/udata/items/item" mode="search_select1" />
						 </xsl:when>
						 <xsl:otherwise>
							<xsl:apply-templates select="values/item" mode="search_select" />
						 </xsl:otherwise>
					</xsl:choose> -->
							<!-- <xsl:value-of select="$categoryid" /> -->

							<xsl:apply-templates select="document(concat('udata://catalog/bsearch/', $categoryid,'/', @name, '/', $parent_obj))/udata/items/item" mode="search_select" />

							<!-- </xsl:when><xsl:otherwise><xsl:apply-templates select="document(concat('usel://select/', @name,'/', $typeid))/udata" mode="brands"><xsl:with-param name="selected_id"><xsl:value-of select="values/item[@selected='selected']/@id" /></xsl:with-param></xsl:apply-templates></xsl:otherwise></xsl:choose> -->
							<!--  -->
						</select>
					</div>
				</div>


			</xsl:otherwise>
		</xsl:choose>
		<!-- <xsl:value-of select="$categoryid" /> -->

	</xsl:template>
	<xsl:template match="udata" mode="brands">
		<xsl:param name="selected_id" />
		<xsl:for-each select="page[not(extended/properties/property/value/item/@name=preceding-sibling::page/extended/properties/property/value/item/@name)]">
			<xsl:if test="extended/properties/property/value/item/@name!=''">
				<option value="{extended/properties/property/value/item/@id}">
					<xsl:if test="$selected_id=extended/properties/property/value/item/@id">
						<xsl:attribute name="selected">selected</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="extended/properties/property/value/item/@name" />
				</option>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="item" mode="search_select">
		<option value="{@id}">
			<xsl:if test="@selected">
				<xsl:attribute name="selected">selected</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="." />
		</option>
	</xsl:template>
	<!-- <xsl:template match="field/values/item" mode="search"><xsl:param name="name"/><div class="box"><input id="n{@id}" name="fields_filter[{$name}][]" type="checkbox" value="{@id}" class="check"><xsl:if test="@selected"><xsl:attribute name="checked"></xsl:attribute></xsl:if></input><label for="n{@id}"><xsl:value-of select="." /></label></div></xsl:template> -->
	<!--<xsl:template match="udata[@module = 'catalog' and @method ='getCategoryList']/items"> <ul umi:module="catalog"umi:element-id="{../@category-id}" umi:method="getCategoryList"umi:button-position="bottom left" umi:region="list"umi:sortable="sortable"> <xsl:apply-templates /> </ul> <br /> <br /></xsl:template> <xsl:template match="result[@module = 'catalog' and@method = 'object']"> <p> <xsl:apply-templatesselect="document(concat('udata://emarket/price/', page/@id))/udata" /></p> <p> <xsl:apply-templatesselect="document(concat('udata://emarket/stores/', page/@id))/udata"/> </p> <form method="post"action="/emarket/basket/put/element/{page/@id}/"> <input type="hidden"name="redirect-uri" value="{$request-uri}" /> <xsl:apply-templatesselect="page//group[@name = 'catalog_option_props']" /> <divclass="buttons"> <input type="submit" value="Положить в корзину" /><xsl:text> </xsl:text> <input type="button" value="Добавить ксравнению" /> </div> </form> </xsl:template> <xsl:templatematch="group[@name = 'catalog_option_props']"> <h2> <xsl:text>Выберитедополнительные опции</xsl:text> </h2> <input type="hidden"name="redirect-uri" value="{$request-uri}" /> <xsl:apply-templatesselect="property[@type = 'optioned']" /> </xsl:template>--></xsl:stylesheet>
