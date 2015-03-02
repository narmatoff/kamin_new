<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink">
	<xsl:output encoding="utf-8" method="html" indent="yes" />

     <xsl:template match="/">
      <xsl:apply-templates select="." mode="top_menu" />
    </xsl:template>
 
	<xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="top_menu">
		<nav>
			<ul  id="menu">
            	<xsl:apply-templates select="items/item" mode="level1top" />
            </ul>
        </nav>
	</xsl:template>


    
        

	


	<xsl:template match="item" mode="level1top">
		<li class="li">
			<a href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
			<xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level2"/>
		</li>
	</xsl:template>

	<xsl:template match="item[@status = 'active']" mode="level1top">
		<li  class="li">

			<a  class="selected" href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
            <xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level2active"/>

		</li>
	</xsl:template>

	



    
	<xsl:template match="items" mode="level2">
		<ul>

  			<xsl:apply-templates select="item" mode="level2" />
			
        </ul>
        
		
	</xsl:template>

	<xsl:template match="items" mode="level2active">
		<ul style="display: block;">

  			<xsl:apply-templates select="item" mode="level2" />

        </ul>
        
		
	</xsl:template>
	<xsl:template match="item" mode="level2">
		<li>

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>
			
			<xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level3"/>

		</li>
		<xsl:if test="@id = 6310">
			<li>
				<a href="/concats/">Наши салоны</a>
			</li>
        </xsl:if>
	</xsl:template>
	<xsl:template match="item[@status = 'active']" mode="level2">
		<li class="active">

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>

			<xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level3"/>

		</li>

	</xsl:template>
	<xsl:template match="items" mode="level3">
		<ul class="subss">

  			<xsl:apply-templates select="item" mode="level2" />

        </ul>
        
		
	</xsl:template>


	


	<xsl:template match="item" mode="level2contacts">
		<li>

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>

			<!-- <xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level3"/> -->

		</li>

	</xsl:template>
	<xsl:template match="item[@status = 'active']" mode="level2contacts">
		<li class="current_item"  >

			<a style="border-bottom: none">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>

			<!-- <xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level3"/>
 -->
		</li>

	</xsl:template>

					


</xsl:stylesheet>