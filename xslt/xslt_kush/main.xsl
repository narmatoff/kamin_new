<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet  [

 <!ENTITY middot "·">
 <!ENTITY copy "©">
 <!ENTITY nbsp "&#160;">
 <!ENTITY br "<br/>"> 
]>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl"
	xmlns:date="http://exslt.org/dates-and-times" xmlns:udt="http://umi-cms.ru/2007/UData/templates"
	xmlns:umi="http://www.umi-cms.ru/TR/umi" extension-element-prefixes="php"
	exclude-result-prefixes="xsl php udt date">


	<xsl:output method="html" version="4.01" encoding="utf-8"
		doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		indent="yes" cdata-section-elements="script noscript"
		undeclare-namespaces="yes" omit-xml-declaration="yes" />

	<xsl:param name="search_string" />
	<xsl:param name="template-resources" />
	<xsl:param name="expert" />
	<xsl:param name="brend" />
	<xsl:param name="_err" />
	<xsl:param name="link" />
	<xsl:param name="show">0</xsl:param>
	<xsl:param name="news" select="0"/>
	<xsl:param name="katalog_link" />
	<xsl:param name="param0" />
	<xsl:variable name="user-id" select="/result/user/@id" />
	<xsl:variable name="user-info" select="document(concat('uobject://', $user-id))" />

	<xsl:variable name="errors" select="document(concat('udata://system/listErrorMessages/?_err=', $_err))/udata" />
	<!--
		 <xsl:include
		href="modules/content.xsl" /> <xsl:include
		href="modules/breadcrumbs.xsl" /> <xsl:include href="modules/tips.xsl"
		/> <xsl:include href="modules/catalog.xsl" /> <xsl:include
		href="modules/news.xsl" /> <xsl:include href="modules/cart.xsl" />
		<xsl:include href="modules/fast.xsl" /> <xsl:include
		href="modules/FAQ.xsl" /> <xsl:include href="modules/users_auth.xsl"
		/> <xsl:include href="modules/search.xsl" /> <xsl:include
		href="modules/dispatch.xsl" /> <xsl:include href="modules/forms.xsl"
		/>
	-->

	<xsl:include href="modules/forms.xsl"		/>
	<xsl:include href="main_temp.xsl" />
	<xsl:include href="modules/news.xsl" />
	<xsl:include href="modules/tips.xsl" />
	<xsl:include href="modules/menu.xsl" />
	<xsl:include href="modules/content.xsl" />
	<xsl:include href="modules/catalog.xsl" />
	<xsl:include href="modules/search.xsl" />
	<xsl:include href="modules/breadcrumbs.xsl" />
	



</xsl:stylesheet> 
