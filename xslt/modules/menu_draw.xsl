<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink">
	<xsl:output encoding="utf-8" method="html" indent="yes" />

     
 
	<xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="top_menu">
		<nav>
			<ul  id="menu">
            	<xsl:apply-templates select="item" mode="level1topdraw" />
            </ul>
        </nav>
	</xsl:template>

<xsl:template match="item" mode="level1topdraw">
		<li class="li">
			<a href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
			<xsl:apply-templates select="items" mode="level2draw"/>
		</li>
	</xsl:template>

	<xsl:template match="item[@status = 'active']" mode="level1topdraw">
		<li  class="li">

			<a  class="selected" href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
            <xsl:apply-templates select="items" mode="level2drawactive"/>

		</li>
	</xsl:template>

	<xsl:template match="items" mode="level2draw">
		<ul>

  			<xsl:apply-templates select="item" mode="level2draw" />
			
        </ul>
        
		
	</xsl:template>

	<xsl:template match="items" mode="level2drawactive">
		<ul style="display: block;">

  			<xsl:apply-templates select="item" mode="level2draw" />

        </ul>
        
		
	</xsl:template>
	<xsl:template match="item" mode="level2draw">
		<li>

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>
			
			<xsl:apply-templates select="items" mode="level3draw"/>

		</li>
		<xsl:if test="@id = 6310">
			<li>
				<a href="/concats/">Наши салоны</a>
			</li>
        </xsl:if>
	</xsl:template>
	<xsl:template match="item[@status = 'active']" mode="level2draw">
		<li class="active">

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>

			<xsl:apply-templates select="items" mode="level3draw"/>

		</li>

	</xsl:template>
	<xsl:template match="items" mode="level3draw">
		<ul class="subss">

  			<xsl:apply-templates select="item" mode="level2draw" />

        </ul>
        
		
	</xsl:template>
    
        

	

					


</xsl:stylesheet>