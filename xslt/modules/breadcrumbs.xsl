<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet  [

 <!ENTITY middot "·">
 <!ENTITY copy "©">
 <!ENTITY nbsp "    ">
]>


<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="udata" mode="bread">
	
			<ul class="breadcrumbs">
		        <li><a href="/" title="">Главная</a></li>
					<xsl:apply-templates select="items/item" mode="navibar" />
			</ul>
	</xsl:template>




	<xsl:template match="item" mode="navibar">

		
			<li>
				<a href="{@link}">
					<xsl:value-of select="document(concat('upage://', @id,'.h1'))/udata/property/value" />
				</a>
				
			</li>
		


	</xsl:template>


	<xsl:template match="item[position() = last()]"  mode="navibar">
			<li>
				
					<xsl:value-of select="document(concat('upage://', @id,'.h1'))/udata/property/value" />
				
			</li>
	</xsl:template>
</xsl:stylesheet>