<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink">
	<xsl:output encoding="utf-8" method="html" indent="yes" />

     
 
	<xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="top_menu">
		<nav>
			<ul  id="menu">
<<<<<<< HEAD
            	<xsl:apply-templates select="item" mode="level1topdraw" />
=======
            	<xsl:apply-templates select="item" mode="level1top" />
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b
            </ul>
        </nav>
	</xsl:template>

<<<<<<< HEAD
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
=======

    
        

	


	<xsl:template match="item" mode="level1top">
		<li class="li">
			<a href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
			<xsl:apply-templates select="items" mode="level2"/>
		</li>
	</xsl:template>

	<xsl:template match="item[@status = 'active']" mode="level1top">
		<li  class="li">

			<a  class="selected" href="{@link}"><xsl:value-of select="@name" disable-output-escaping="yes" /></a>
            <xsl:apply-templates select="items" mode="level2active"/>
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b

		</li>
	</xsl:template>

<<<<<<< HEAD
	<xsl:template match="items" mode="level2draw">
		<ul>

  			<xsl:apply-templates select="item" mode="level2draw" />
=======
	



    
	<xsl:template match="items" mode="level2">
		<ul>

  			<xsl:apply-templates select="item" mode="level2" />
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b
			
        </ul>
        
		
	</xsl:template>

<<<<<<< HEAD
	<xsl:template match="items" mode="level2drawactive">
		<ul style="display: block;">

  			<xsl:apply-templates select="item" mode="level2draw" />
=======
	<xsl:template match="items" mode="level2active">
		<ul style="display: block;">

  			<xsl:apply-templates select="item" mode="level2" />
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b

        </ul>
        
		
	</xsl:template>
<<<<<<< HEAD
	<xsl:template match="item" mode="level2draw">
=======
	<xsl:template match="item" mode="level2">
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b
		<li>

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>
			
<<<<<<< HEAD
			<xsl:apply-templates select="items" mode="level3draw"/>

		</li>
		<xsl:if test="@id = 6310">
			<li>
				<a href="/concats/">Наши салоны</a>
			</li>
        </xsl:if>
	</xsl:template>
	<xsl:template match="item[@status = 'active']" mode="level2draw">
=======
			<xsl:apply-templates select="items" mode="level3"/>

		</li>
		
       
	</xsl:template>
	<xsl:template match="item[@status = 'active']" mode="level2">
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b
		<li class="active">

			<a href="{@link}">
				<xsl:value-of select="@name" disable-output-escaping="yes" />
			</a>

<<<<<<< HEAD
			<xsl:apply-templates select="items" mode="level3draw"/>
=======
			<xsl:apply-templates select="items" mode="level3"/>
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b

		</li>

	</xsl:template>
<<<<<<< HEAD
	<xsl:template match="items" mode="level3draw">
		<ul class="subss">

  			<xsl:apply-templates select="item" mode="level2draw" />
=======
	<xsl:template match="items" mode="level3">
		<ul class="subss">

  			<xsl:apply-templates select="item" mode="level2" />
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b

        </ul>
        
		
	</xsl:template>
<<<<<<< HEAD
    
        
=======


	

>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b

	

					


</xsl:stylesheet>