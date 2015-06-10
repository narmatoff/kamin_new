<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'content' and @method = 'content']">







            <article>
            	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>
                <xsl:apply-templates select="$errors" />

                

                <xsl:choose>
                                        <xsl:when test="page/@parentId=4820">


                                       <xsl:variable name="brendusel" select="document('usel://brends')" />

                                       <xsl:variable name="brendpageID" select="document(concat('upage://',@pageId))/udata/page/@id" />


                                       <xsl:apply-templates select="document('usel://brends')/udata/page[@id=$brendpageID]" mode="brends45" />




<!--                                       <xsl:value-of select="$brendpageID"/>-->












                                        </xsl:when>
                                        <xsl:otherwise>


                                        </xsl:otherwise>
                                    </xsl:choose>






					<div>

					<!--					свернуть/развернуть-->

					<xsl:if test="page/properties/group/property[@name='svernut_tekst_dlya_kompaktnosti']/value = true()">
						<xsl:attribute name="class">text_description</xsl:attribute>
					</xsl:if>
					<!--					конец_свернуть/развернуть-->

						<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes" />

					</div>


				<xsl:if test="page/@type-id='281'">
					<div>
											<!-- <xsl:value-of select="$brand" /> -->
						<ul>
							<xsl:apply-templates select="page/properties/group/property[@name='katalogi']/value/page" mode="files" />
						</ul>
						<ul>
							<xsl:apply-templates select="page/properties/group/property[@name='sertifikaty']/value/page" mode="files" />
						</ul>
						<ul>
							<xsl:apply-templates select="page/properties/group/property[@name='prajsy']/value/page" mode="files" />
						</ul>
						<ul>
							<xsl:apply-templates select="page/properties/group/property[@name='instrukcii']/value/page" mode="files" />
						</ul>
					</div>
						<h2>Посмотреть товары бренда <xsl:value-of select="@header"/></h2>
					<section class="mainpage_section" style="width: auto; margin: 0;">
						<!-- <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/(katalog)')/udata/items/item" mode="categorylist_main">


							<xsl:with-param name="cat" select="page/@object-id" />
						</xsl:apply-templates> -->

						<xsl:apply-templates select="document(concat('udata://content/menu/notemplate/0/', @pageId))/udata/items/item" mode="categorylist_main_brend" />


					</section>
					<div class="clearfix"></div>
				</xsl:if>

				<xsl:if test="page/properties/group/property[@name='fotogalereya']/value/page">

						<xsl:apply-templates select="document(concat('udata://photoalbum/album_sort/',page/properties/group/property[@name='fotogalereya']/value/page/@id ))/udata/items" mode="photos"/>

				</xsl:if>

				<xsl:if test="page/properties/group/property[@name='forma_obratnoj_svyazi']/value/page">
					<div style="display:none;">
						<div id="form_for" style="padding: 0 30px 0 25px;">
						<xsl:apply-templates select="document(concat('upage://', page/properties/group/property[@name='forma_obratnoj_svyazi']/value/page/@id ))/udata" mode="form_in_page"/>
						</div>
					</div>
				</xsl:if>

				<xsl:if test="page/properties/group/property[@name='video']/value">

					<xsl:value-of select="page/properties/group/property[@name='video']/value" disable-output-escaping="yes" />
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

                <xsl:if test="page/@type-id='283'">
                    <xsl:value-of select="page//property[@name='karta']/value" disable-output-escaping="yes" />
                </xsl:if>



                <xsl:apply-templates select="$errors" />
            </article>




	</xsl:template>


	<xsl:template match="page" mode="brends45">

		<xsl:choose>
			 <xsl:when test="not(.//property[@name='logotip_brenda_str_br']/value)">
	            <!--когда логотип отсутствует выводим ничего -->
	        </xsl:when>

	        <xsl:otherwise>
	        <span style="float:left;margin:20px 20px 0 0; display:inline-block;">

				<xsl:call-template name="thumbing">
					<xsl:with-param name="source" select=".//property[@name='logotip_brenda_str_br']/value" />
					<xsl:with-param name="width" select="150" />
					<xsl:with-param name="height">77</xsl:with-param>
				</xsl:call-template>

				<xsl:choose>
				<xsl:when test="not(.//property[@name='oficialnyj_sajt']/value)">
	            <!--когда ссылка отсутствует выводим ничего -->
	        </xsl:when>

	        <xsl:otherwise>
				<a class="learn_more" href="{.//property[@name='oficialnyj_sajt']/value}" rel="nofollow" target="_blank" style="display:block;margin:30px 0 20px 0;">Официальный сайт</a>
				</xsl:otherwise>

				</xsl:choose>
			</span>

	        </xsl:otherwise>
		</xsl:choose>



	</xsl:template>






	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='122']">


		        <div class="inside_productions_items">
            <div class="productions">
				<xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/(/katalog)')/udata/items/item" mode="categorylistimage" />
            </div>
        </div>
        <div class="widthtxtcont">
            <div class="inside_goodwrapper">

                <!-- хлебокрохи -->
                <xsl:apply-templates select="document('udata://core/navibar/')/udata" mode="bread"/>



                <div class="inside_goodcontent">
                   <h1><xsl:value-of select="@header"/></h1>

                    <div class="contacts_block">
                        <table>

                            <tr>
                                <td>Адрес:</td>
                                <td>Россия, город Санкт петербург, ул. Дорожная, дом 6 , строение 6</td>
                            </tr>
                            <tr>
                                <td>Телефон:</td>
                                <td>654684684654684 <br/>3546156846516854</td>
                            </tr>
                            <tr>
                                <td>Время работы:</td>
                                <td>пн-пт 9.00 - 18.00 <br/>сб-вс Выходной</td>
                            </tr>
                            <tr>
                                <td>Почта:</td>
                                <td>info@welgen.ru</td>
                            </tr>

                        </table>
                        <div class="contscts_form">
                            <form action="">
                                <input required="required" placeholder="Ваше имя" type="text"/>
                                <input required="required" placeholder="Ваш e-mail" type="email"/>
                                <textarea required="required" name="" id="" cols="30" rows="10"></textarea>
                                <input class="buttonstl" value="Отправить" type="button"/>
                            </form>
                        </div>

 <div class="clearfix"></div>

 <h3>Карта проезда</h3>
                        <div class="conttactform_map">
                            <script type="text/javascript" charset="utf-8" src="http://api-maps.yandex.ru/services/constructor/1.0/js/?sid=mjkpawlc2APehCfdJnMrSGAIlGcZL5D6"></script>
                        </div>



                    </div>

            </div>

        </div>

    </div>
     <div class="clearfix"></div>


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




<!--
	<xsl:template match="result[@module = 'content' and @method = 'notfound']">



            <article>
            	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>
				<xsl:apply-templates select="document('udata://content/sitemap')/udata" />
			</article>
	</xsl:template>

-->

	<xsl:template match="result[@module = 'content' and @method = 'sitemap']">
		<xsl:apply-templates select="document('udata://content/sitemap//500')/udata/items" />
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
				<xsl:text>Если закачивание файла не начнется через 3 сек, кликните </xsl:text>
				<a href="{download_link}">
					<xsl:text>по этой ссылке</xsl:text>
				</a>
			</p>
			<script languge="text/javascript">
				<xsl:text>window.setTimeout('document.location.href="</xsl:text>
				<xsl:value-of select="download_link" />
				<xsl:text>";', 3000);</xsl:text>
			</script>
			<script languge="text/javascript">
				<xsl:text>window.setTimeout('javascript:history.back()', 4000);</xsl:text>
			</script>

	</xsl:template>

	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@object-id='6707']">
		<article>
			<h1 class="dialog_par"><xsl:value-of select="page/name" disable-output-escaping="yes" /></h1>
			<h3><a href="http://market.yandex.ru/shop/98576/reviews/" target="_blank">Все отзывы на Яндекс.Маркете</a></h3>
			<h3><a href="http://market.yandex.ru/shop/98576/reviews/add" target="_blank">Добавить отзыв на Яндекс.Маркете</a></h3>
			<xsl:apply-templates select="document('http://kamin.ru/otz.php')/opinion-list/opinion" mode="opinion" />
		</article>
	</xsl:template>


	<xsl:template match="opinion" mode="opinion">
		<div class="yandexreview">
			<div class="yandexreview__title">
				<div class="yandexreview-user">
					<div class="yandexreview-user__image">
						<xsl:if test="author-info/avatar">
							<img src="{author-info/avatar}"/>
						</xsl:if>
					</div>
						<xsl:choose>
							<xsl:when test="anonymous = 'true'"><span class="yandexreview-username_anonymous">Пользователь скрыл свои данные</span></xsl:when>
							<xsl:when test="anonymous = 'false'"><span class="yandexreview-username">
								<xsl:value-of select="author" disable-output-escaping="yes" /></span>
							</xsl:when>
						</xsl:choose>
					<div class="b-aura-user__social"><a href="http://vk.com/id270618693" class="b-link" target="_blank" rel="nofollow">
						<span class="b-aura-social b-aura-social_size_m b-aura-social_sn_vk"></span></a>
					</div>
				</div>
					<div class="yandexreview-usergeo">
					<span class="yandexreview-usergeo__date"><xsl:value-of select="substring-before(date, 'T')" disable-output-escaping="yes" /></span>
					</div>
			</div>
			<xsl:variable name="rating" select="@grade + 3" />
			<div class="yandexreview__rate i-clearfix">
				<div class="yandexreview-rating yandexreview-rating_state_{$rating}">
					<xsl:choose>
						<xsl:when test="$rating = 1">ужасный магазин</xsl:when>
						<xsl:when test="$rating = 2">плохой магазин</xsl:when>
						<xsl:when test="$rating = 3">обычный магазин</xsl:when>
						<xsl:when test="$rating = 4">хороший магазин</xsl:when>
						<xsl:when test="$rating = 5">отличный магазин</xsl:when>
					</xsl:choose>
				</div>

				<div class="yandexreview__delivery">Способ покупки:
				<xsl:choose>
					<xsl:when test="delivery = 'DELIVERY'">доставка</xsl:when>
					<xsl:when test="delivery = 'PICKUP'">самовывоз</xsl:when>
					<xsl:when test="delivery = 'INSTORE'">покупка в магазине</xsl:when>
				</xsl:choose>
				</div>
			</div>
			<xsl:if test="pro">
				<div class="yandexreview-userverdict">
					<div class="yandexreview-userverdict__title">Достоинства:</div>
					<div class="yandexreview-userverdict__text">
						<xsl:value-of select="pro" disable-output-escaping="yes" />
					</div>
				</div>
			</xsl:if>
			<xsl:if test="contra">
				<div class="yandexreview-userverdict">
					<div class="yandexreview-userverdict__title">Недостатки:</div>
					<div class="yandexreview-userverdict__text">
						<xsl:value-of select="contra" disable-output-escaping="yes" />
					</div>
				</div>
			</xsl:if>
			<xsl:if test="text">
				<div class="yandexreview-userverdict">
					<div class="yandexreview-userverdict__title">Комментарий:</div>
					<div class="yandexreview-userverdict__text">
						<xsl:value-of select="text"/>
					</div>
				</div>
			</xsl:if>
			<div class="yandexreview__footer">
				<div class="yandexreview-usergrade yandexreview-usergrade_active_yes">
					Отзыв полезен?
					<span class="yandexreview-usergrade__votes">
						<span class="yandexreview__pro">Да </span>
						<span class="yandexreview__pro-num"><xsl:value-of select="@agree" disable-output-escaping="yes" /></span> /
						<span class="yandexreview__contra">Нет </span>
						<span class="yandexreview__contra-num"><xsl:value-of select="@reject" disable-output-escaping="yes" /></span>
					</span>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='121']">
		<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
		<script type="text/javascript">
			var myMap;
			ymaps.ready(init);

			function init () {
			    myMap = new ymaps.Map('yamapsdlr', {
			        center: [59.939095, 30.315868],
			        zoom: 3,
			        controls: ['zoomControl', 'typeSelector']
			    });
			    clusterer = new ymaps.Clusterer({
	            preset: 'islands#invertedOrangeClusterIcons',
	            groupByCoordinates: false,
	            clusterDisableClickZoom: false,
	            clusterHideIconOnBalloonOpen: false,
	            geoObjectHideIconOnBalloonOpen: true
	        	});

	       		cord = [<xsl:apply-templates select="document('usel://contacts/')/udata/page/extended/groups/group/property[@name='koordinaty']" mode="maps" />];
				head = [<xsl:apply-templates select="document('usel://contacts/')/udata/page/extended/groups/group/property[@name='nazvanie']" mode="maps" />];
				adr = [<xsl:apply-templates select="document('usel://contacts/')/udata/page/extended/groups/group/property[@name='adres']" mode="maps" />];
				footer = [<xsl:apply-templates select="document('usel://contacts/')/udata/page/extended/groups/group/property[@name='phone']" mode="maps" />];
				cont = [<xsl:apply-templates select="document('usel://contacts/')/udata/page/extended/groups/group/property[@name='e_mail']" mode="maps" />];
				geoObjects = [];

				for(var i = 0, len = cord.length; i &lt; len; i++) {
		        		geoObjects[i] = new ymaps.Placemark(cord[i], {balloonContentHeader:head[i], balloonContentBody:adr[i]+cont[i], balloonContentFooter:footer[i]}, {
	     						iconLayout: 'default#image',
	        					iconImageHref: '<xsl:value-of select="$template-resources"/>img/map/map-icon-logo.png'
	    				});
		    	}
		    	clusterer.add(geoObjects);
	    		myMap.geoObjects.add(clusterer);
	    		myMap.setBounds(clusterer.getBounds());

			    if (cord.length == 1){
			   		myMap.setZoom(9);
			    }
			}
		</script>

	 	<article>
           	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>

        <div id="yamapsdlr">
		</div>
		<table border="0">
	    <tbody>
	        <tr>
	            <td><strong>Название</strong></td>
	            <td><strong>Адрес</strong></td>
	            <td><strong>Телефон</strong></td>
	            <td><strong>Сайт</strong></td>
	        </tr>
	       	<xsl:apply-templates select="document('usel://contacts/')/udata/page/extended/groups" mode="concat_node" />
		    </tbody>
		</table>
		</article>
	<!-- <xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/> -->
	</xsl:template>

	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@id='6498']">
		<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
		<script type="text/javascript">
			var myMap;
			ymaps.ready(init);

			function init () {
			    myMap = new ymaps.Map('yamapsdlr', {
			        center: [59.939095, 30.315868],
			        zoom: 3,
			        controls: ['zoomControl', 'typeSelector']
			    });
			    clusterer = new ymaps.Clusterer({
	            preset: 'islands#invertedOrangeClusterIcons',
	            groupByCoordinates: false,
	            clusterDisableClickZoom: false,
	            clusterHideIconOnBalloonOpen: false,
	            geoObjectHideIconOnBalloonOpen: true
	        	});

	       		cord = [<xsl:apply-templates select="document('usel://dilers/')/udata/page/extended/groups/group/property[@name='koordinaty']" mode="maps" />];
				head = [<xsl:apply-templates select="document('usel://dilers/')/udata/page/extended/groups/group/property[@name='nazvanie']" mode="maps" />];
				adr = [<xsl:apply-templates select="document('usel://dilers/')/udata/page/extended/groups/group/property[@name='adres']" mode="maps" />];
				footer = [<xsl:apply-templates select="document('usel://dilers/')/udata/page/extended/groups/group/property[@name='phone']" mode="maps" />];
				cont = [<xsl:apply-templates select="document('usel://dilers/')/udata/page/extended/groups/group/property[@name='e_mail']" mode="maps" />];
				geoObjects = [];

				for(var i = 0, len = cord.length; i &lt; len; i++) {
		        		geoObjects[i] = new ymaps.Placemark(cord[i], {balloonContentHeader:head[i], balloonContentBody:adr[i]+cont[i], balloonContentFooter:footer[i]}, {
	     						iconLayout: 'default#image',
	        					iconImageHref: '<xsl:value-of select="$template-resources"/>img/map/map-icon-logo.png'
	    				});
		    	}
		    	clusterer.add(geoObjects);
	    		myMap.geoObjects.add(clusterer);
	    		myMap.setBounds(clusterer.getBounds());

			    if (cord.length == 1){
			   		myMap.setZoom(9);
			    }
			}
		</script>

	 	<article>
           	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>

        <div id="yamapsdlr">
		</div>

		<div class="clearfix"></div>
			<h2>8-800-555-444-0 - бесплатные звонки из регионов РФ</h2>
			<h2><a href="/gde_kupit/">Где купить</a></h2>
		<div class="clearfix"></div>
		<p>
		<a href="javascript://" class="answer_showhide" title="Кликните, чтобы раскрыть ">Ещё ></a>
        </p>
		<div class="clearfix"></div>

        <div class="answeronquestionbl">
			<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
		</div>
		</article>
	</xsl:template>

	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='283'][page/@id!='6497']">
		<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
		<script type="text/javascript">
			var myMap;
			ymaps.ready(init);

			function init () {
			    myMap = new ymaps.Map('yamapsdlr', {
			        center: [59.939095, 30.315868],
			        zoom: 3,
			        controls: ['zoomControl', 'typeSelector']
			    });
			    clusterer = new ymaps.Clusterer({
	            preset: 'islands#invertedOrangeClusterIcons',
	            groupByCoordinates: false,
	            clusterDisableClickZoom: false,
	            clusterHideIconOnBalloonOpen: false,
	            geoObjectHideIconOnBalloonOpen: true
	        	});

	       		cord = [<xsl:apply-templates select="document(concat('upage://', page/properties/group/property[@name='region_id']/value/page/@id))/udata/page/properties/group/property[@name='koordinaty']" mode="maps" />];
				head = [<xsl:apply-templates select="document(concat('upage://', page/properties/group/property[@name='region_id']/value/page/@id))/udata/page/properties/group/property[@name='nazvanie']" mode="maps" />];
				adr = [<xsl:apply-templates select="document(concat('upage://', page/properties/group/property[@name='region_id']/value/page/@id))/udata/page/properties/group/property[@name='adres']" mode="maps" />];
				footer = [<xsl:apply-templates select="document(concat('upage://', page/properties/group/property[@name='region_id']/value/page/@id))/udata/page/properties/group/property[@name='phone']" mode="maps" />];
				cont = [<xsl:apply-templates select="document(concat('upage://', page/properties/group/property[@name='region_id']/value/page/@id))/udata/page/properties/group/property[@name='e_mail']" mode="maps" />];
				geoObjects = [];

				for(var i = 0, len = cord.length; i &lt; len; i++) {
		        		geoObjects[i] = new ymaps.Placemark(cord[i], {balloonContentHeader:head[i], balloonContentBody:adr[i]+cont[i], balloonContentFooter:footer[i]}, {
	     						iconLayout: 'default#image',
	        					iconImageHref: '<xsl:value-of select="$template-resources"/>img/map/map-icon-logo.png'
	    				});
		    	}
		    	clusterer.add(geoObjects);
	    		myMap.geoObjects.add(clusterer);
	    		myMap.setBounds(clusterer.getBounds());

			    if (cord.length == 1){
			   		myMap.setZoom(9);
			    }
			}
		</script>
		 <article>
		 <h1><xsl:value-of select="@header"/></h1>
            <div class="good_bookmopt">
                <ul class="good_bookmarks">
                    <li>
                        <a name="tab1" href="javascript://">О салоне</a>
                    </li>
                    <xsl:if test="page/properties/group/property[@name='video']/value/page">
	                    <li>
	                        <a name="tab2" href="javascript://">Видеообзор</a>
	                    </li>
                	</xsl:if>
                    <li>
                        <a name="tab3" href="javascript://">Сотрудники</a>
                    </li>
                    <li>
                        <a name="tab4" href="javascript://">Новости и акции</a>
                    </li>
                    <li>
                        <a name="tab5" href="javascript://">Отзывы</a>
                    </li>
                    <xsl:if test="document(concat('udata://catalog/salonObject/', @pageId))//total &gt; 0">
	                    <li>
	                        <a name="tab6" href="javascript://">Уценка в салоне</a>
	                    </li>
                    </xsl:if>
                </ul>

                <div id="tab1">
                    <h3><xsl:apply-templates select="$errors/items/item" mode="error" /></h3>
                    <xsl:value-of select="page/properties/group/property[@name='info']/value" disable-output-escaping="yes" />
                    <xsl:if test="@pageId='13649'">
                    	<iframe src="/files/salon_kaminov/1.html" style="width: 100%; height: 450px; border: 0px;"></iframe>
                    	<h3>Яндекс.Карта</h3>
                    </xsl:if>
                    <div id="yamapsdlr">
					</div>
                </div>

                <div id="tab2" style="display:none;">
                	<ul class="content_gallery">
                        <xsl:apply-templates select="page/properties/group/property[@name='video']/value/page" mode="slider2_video" />
                    </ul>
				</div>
				<div id="tab3" style="display:none;">
                    <xsl:value-of select="page/properties/group/property[@name='staff']/value" disable-output-escaping="yes" />
				</div>
				<div id="tab4" style="display:none;">
					<xsl:apply-templates select="document(concat('usel://salon_news/', @pageId))/udata/page" mode="news_salon" />

				</div>
				<div id="tab5" style="display:none;">
                    <xsl:apply-templates select="document('udata://comments/insert/')/udata" />
                    <xsl:apply-templates select="user" mode="addcomment" />
				</div>
				<div id="tab6" style="display:none;">
					<xsl:apply-templates select="document(concat('udata://catalog/salonObject/', @pageId))" mode="catalogus_current">
						<xsl:with-param name="in-salon" select="1" />
					</xsl:apply-templates>
				</div>
			</div>
			</article>
	</xsl:template>
	<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='283'][page/@id='6497']">
		<article>
		 <h1><xsl:value-of select="@header"/></h1>
            <div class="good_bookmopt">
                <ul class="good_bookmarks">
                    <li>
                        <a name="tab1" href="javascript://">Информация</a>
                    </li>
                    <li>
                        <a name="tab2" href="javascript://">Сотрудники</a>
                    </li>
                    <li style="width: 200px;">
                        <a name="tab3" href="javascript://">Отправить сообщение</a>
                    </li>
                    <li>
                        <a name="tab4" href="javascript://">Отзывы</a>
                    </li>
                </ul>

                <div id="tab1">
                    <h3><xsl:apply-templates select="$errors/items/item" mode="error" /></h3>
                    <xsl:value-of select="page/properties/group/property[@name='info']/value" disable-output-escaping="yes" />
                </div>
				<div id="tab2" style="display:none;">
                    <xsl:value-of select="page/properties/group/property[@name='staff']/value" disable-output-escaping="yes" />
				</div>
				<div id="tab3" style="display:none;">
					<xsl:apply-templates select="document('udata://webforms/add/308')/udata"  mode="form" />
				</div>
				<div id="tab4" style="display:none;">
                    <xsl:apply-templates select="document('udata://comments/insert/')/udata" />
                    <xsl:apply-templates select="user" mode="addcomment" />
				</div>
			</div>
		</article>
	</xsl:template>

<!-- Где купить в выбранном регионе -->
<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='302']">
	<xsl:variable name="pageParent" select="page/@parentId" />
	<xsl:call-template name="contcat_map">
		<xsl:with-param name="listregionid" select="parents/page[@id = $pageParent]/@object-id"/>
	</xsl:call-template>
<xsl:variable name="listregionid" select="parents/page[@id = $pageParent]/@object-id" />

	<article>

	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>

	<xsl:apply-templates select="$errors" />
	<xsl:choose>
		<xsl:when test="document(concat('usel://dilers/', $listregionid))/udata/total &gt; 0">
			<div id="yamapsdlr">
			</div>
			<table border="0">
			    <tbody>
			        <tr>
			            <td><strong>Название</strong></td>
			            <td><strong>Адрес</strong></td>
			            <td><strong>Телефон</strong></td>
			            <td><strong>Сайт</strong></td>
			        </tr>
			       	<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid))/udata/page/extended/groups" mode="concat_node" />
			    </tbody>
			</table>
		</xsl:when>
	</xsl:choose>

	<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
	</article>

</xsl:template>

<!-- Где купить общий список -->

<xsl:template match="result[@module = 'content' and @method = 'content'][page/@id='6325']">
	<xsl:call-template name="contcat_map">
		<xsl:with-param name="listregionid"></xsl:with-param>
	</xsl:call-template>

	<article>
	<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>
	<div id="yamapsdlr">
	</div>


	<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
	</article>
</xsl:template>

<xsl:template match="group" mode="concat_node" >
	<tr>
		<td>
			<xsl:value-of select="property[@name = 'nazvanie']/value"/>
		</td>
		<td>
			<xsl:value-of select="property[@name = 'adres']/value" disable-output-escaping="yes"/>
		</td>
		<td>
			<xsl:value-of select="property[@name = 'phone']/value"/>
		</td>
		<td>
			<xsl:value-of select="property[@name = 'e_mail']/value" disable-output-escaping="yes"/>
		</td>
	</tr>
</xsl:template>

<xsl:template match="property[@name='koordinaty']" mode="maps">
	[<xsl:value-of select="value" disable-output-escaping="yes" />]<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>

<xsl:template match="property[@name='nazvanie']" mode="maps">
	['<xsl:value-of select="value" disable-output-escaping="yes" />']<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>

<xsl:template match="property[@name='adres']" mode="maps">
	['<xsl:value-of select="value" disable-output-escaping="yes" />']<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>

<xsl:template match="property[@name='phone']" mode="maps">
	['<xsl:value-of select="value" disable-output-escaping="yes" />']<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>

<xsl:template match="property[@name='e_mail']" mode="maps">
	['<xsl:value-of select="value" disable-output-escaping="yes" />']<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>



</xsl:stylesheet>
