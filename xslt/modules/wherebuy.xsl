<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

<xsl:template match="result[@module = 'content' and @method = 'content'][page/@type-id='302']">
<xsl:variable name="pageParent" select="page/@parentId" />
<xsl:variable name="listregionid" select="parents/page[@id = $pageParent]/@object-id" />

	<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
	<script type="text/javascript">
		var myMap;
		ymaps.ready(init);

		function init () {
		    myMap = new ymaps.Map('yamapsdlr', {
		        center: [59.939095, 30.315868],
		        zoom: 9,
		        controls: ['zoomControl', 'typeSelector']
		    });
		    clusterer = new ymaps.Clusterer({
            /**
             * Через кластеризатор можно указать только стили кластеров,
             * стили для меток нужно назначать каждой метке отдельно.
             * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/option.presetStorage.xml
             */
            preset: 'islands#invertedOrangeClusterIcons',
            /**
             * Ставим true, если хотим кластеризовать только точки с одинаковыми координатами.
             */
            groupByCoordinates: false,
            /**
             * Опции кластеров указываем в кластеризаторе с префиксом "cluster".
             * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/ClusterPlacemark.xml
             */
            clusterDisableClickZoom: false,
            clusterHideIconOnBalloonOpen: false,
            geoObjectHideIconOnBalloonOpen: true
        });

       		
       		cord = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid))/udata/page/extended/groups/group/property[@name='koordinaty']" mode="maps" />];
			head = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid))/udata/page/extended/groups/group/property[@name='nazvanie']" mode="maps" />];
			adr = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid))/udata/page/extended/groups/group/property[@name='adres']" mode="maps" />];
			footer = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid))/udata/page/extended/groups/group/property[@name='phone']" mode="maps" />];
			cont = [<xsl:apply-templates select="document(concat('usel://dilers/', $listregionid))/udata/page/extended/groups/group/property[@name='e_mail']" mode="maps" />];
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
	
	<xsl:apply-templates select="$errors" />

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
	
	<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
	</article>

</xsl:template>

<xsl:template match="result[@module = 'content' and @method = 'content'][page/@id='6325']">
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
            /**
             * Через кластеризатор можно указать только стили кластеров,
             * стили для меток нужно назначать каждой метке отдельно.
             * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/option.presetStorage.xml
             */
            preset: 'islands#invertedOrangeClusterIcons',
            /**
             * Ставим true, если хотим кластеризовать только точки с одинаковыми координатами.
             */
            groupByCoordinates: false,
            /**
             * Опции кластеров указываем в кластеризаторе с префиксом "cluster".
             * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/ClusterPlacemark.xml
             */
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

	
	<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
	</article>
</xsl:template>

<xsl:template match="group" mode="concat_node" >
	<tr>
		<td>
			<xsl:value-of select="property[@name = 'nazvanie']/value"/>
		</td>
		<td>
			<xsl:value-of select="property[@name = 'adres']/value"/>
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