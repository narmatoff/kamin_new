<?xml version="1.0" encoding="utf-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>

<xsl:output
	encoding="UTF-8"
	indent="yes"
	cdata-section-elements="script noscript"
	omit-xml-declaration="yes"
	doctype-system = "string"
/>

	<xsl:param name="search_string" />
	<xsl:param name="template-resources" />
	<xsl:param name="expert" />
	<xsl:param name="lent-id" />
	<xsl:param name="brend" />
	<xsl:param name="_err" />
	<xsl:param name="link" />
	<xsl:param name="news" select="0"/>
	<xsl:param name="katalog_link" />
	<xsl:param name="param0" />
	<xsl:param name="flat" />
	<xsl:param name="p" />
	<xsl:variable name="user-id" select="/result/user/@id" />
    <xsl:variable name="page" select="document(concat('upage://',@id))"/>
    <xsl:param name="doc-macroUData" select="document(concat('udata://news/lastlist/', $lent-id))"/>
    <xsl:param name="doc-numpages" select="document(concat('udata://system/numpages/', $doc-macroUData/udata/total, '/', $doc-macroUData/udata/per_page, '/notemplate/p/10'))" />
    <xsl:param name="good_page" select="document(concat('upage://',@id))/udata/page/properties/group/property"/>

	
	
    <!--Постраничный вывод для товаров 2-го уровня-->
    <xsl:variable name="lastlist" select="document(concat('udata://catalog/getObjectsList/notemplate/',page/properties/group/property[@name = 'katalog_brenda']/value/page/@id ,'/0/0/2'))/udata"/>

    <!--Постраничный вывод для товаров на странице производителя-->
    <xsl:variable name="lastlist_firm" select="document(concat('udata://catalog/getObjectsList/notemplate/',page/properties/group/property[@name = 'katalog_brenda']/value/page/@id ,'/0/0/2'))/udata" />

    <!--Глобальная переменная для ИД страницы-->
	<xsl:variable name="page-id" select="/result/@pageId" />

    <!--Глобальная переменная для ИД страницы-->
	<xsl:variable name="user-info"
		select="document(concat('uobject://', $user-id))" />
	<xsl:variable name="system" select="document('upage://175')/udata/page"/>
	<xsl:variable name="errors" select="document(concat('udata://system/listErrorMessages/?_err=', $_err))/udata" />

    <!--Подключенные шаблоны-->
	<xsl:include href="default.xsl" />
    <xsl:include href="modules/menu.xsl" />
    <xsl:include href="modules/content.xsl" />
    <xsl:include href="modules/news_anons.xsl" />
    <xsl:include href="modules/search.xsl" />
    <xsl:include href="modules/gallery.xsl" />
    <xsl:include href="modules/feedback.xsl" />
	<xsl:include href="modules/catalog.xsl" />
	<xsl:include href="modules/navibar.xsl" />
	<xsl:include href="modules/breadcrumbs.xsl" />
	<xsl:include href="modules/paging.xsl" />
	<xsl:include href="modules/emarket.xsl" />
	<xsl:include href="modules/tips.xsl" />
</xsl:stylesheet> 
