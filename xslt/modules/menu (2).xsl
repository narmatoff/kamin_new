<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink">
	<xsl:output encoding="utf-8" method="html" indent="yes" />

    
 
	<xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="top_menu">
		<ul class="main_menu">

			<xsl:apply-templates select="items/item" mode="level1top" />
			<xsl:apply-templates select="item" mode="level1top" />
		</ul>
	</xsl:template>
	<xsl:template match="udata" mode="leveluser">
		<ul>
			<xsl:apply-templates select="item" mode="leveluser" />
		</ul>
	</xsl:template>
	<xsl:template match="item" mode="leveluser">
		<li>

			<a href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
			<xsl:apply-templates select="items" mode="leveluser"/>

		</li>
	</xsl:template>
 	<xsl:template match="items" mode="leveluser">
        <ul style="padding: 10px 0 0 20px">

            <xsl:apply-templates select="item" mode="leveluser" />
            
        </ul>
    </xsl:template>


    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="left_menu">
         <ul class="categories">

            <xsl:apply-templates select="items/item" mode="level1top" />
            
        </ul>
    </xsl:template>

	<xsl:template match="item" mode="level1top">
		<li>

			<a href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
			<xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level2"/>

		</li>
	</xsl:template>

	<xsl:template match="item[@status = 'active']" mode="level1top">
		<li class="active">

			<a class="active"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
            <xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level2"/>

		</li>
	</xsl:template>

	<xsl:template match="item" mode="level1catalog">
		
			<a href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
			
	</xsl:template>

	<xsl:template match="item[@status = 'active']" mode="level1catalog">
		
			<a  href="{@link}" class="active_item_menu"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
           
	</xsl:template>




    
	<xsl:template match="items" mode="level2">
		<ul class="subs">

  			<xsl:apply-templates select="item" mode="level2" />

        </ul>
        
		
	</xsl:template>
	<xsl:template match="item" mode="level2">
		<li>

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>

			<!-- <xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level3"/> -->

		</li>

	</xsl:template>
	<xsl:template match="item[@status = 'active']" mode="level2">
		<li class="active">

			<a style="border-bottom: none">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>

			<!-- <xsl:apply-templates select="document(concat('udata://content/menu///', @id))/udata/items" mode="level3"/> -->

		</li>

	</xsl:template>
	<xsl:template match="items" mode="level3">
		<ul class="subss">

  			<xsl:apply-templates select="item" mode="level2" />

        </ul>
        
		
	</xsl:template>


	<xsl:template match="item" mode="accio_main">
		<xsl:variable name="page" select="document(concat('upage://', @id))/udata/page/properties//property[@name='header_pic']/value"/>
		    
	        <li> 

	        	<xsl:call-template name="thumbing">
                    <xsl:with-param name="source" select="$page" />
                    <xsl:with-param name="width" select="839" />
                    <xsl:with-param name="height">313</xsl:with-param>
                </xsl:call-template>
	        	
	        </li>
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