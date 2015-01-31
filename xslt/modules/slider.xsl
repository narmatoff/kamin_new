<<<<<<< HEAD
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata" mode="slider_banner">
        <div id="slider" class="flexslider">
            <ul class="slides">
                <xsl:apply-templates select="page" mode="slider_big" />
            </ul>
        </div>
        <div id="carousel" class="flexslider">
            <ul class="slides">
                <xsl:apply-templates select="page" mode="slider_small" />
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="page" mode="slider_big">
        <li>
            <xsl:choose>
                <xsl:when test="not(extended/properties/property[@name='flesh_vmesto_kartinki'])">
                <a href="{extended/properties/property[@name='ssylka_s_banera']/value}">
                    <xsl:call-template name="thumbing">
                                <xsl:with-param name="source" select="extended/properties/property[@name='header_pic']/value" />
                                <xsl:with-param name="width" select="1000" />
                                <xsl:with-param name="height" select="222" />
                    </xsl:call-template>
                </a>
                   <!--  <div class="slide_content">
                        <div>Акции и спецпредложения 7</div>
                        <p><xsl:value-of select="./alt" /></p>
                        <p>Период действия скидки: с 01.08.2014 по 30.09.2014</p>
                    </div> -->
                </xsl:when>
                 <xsl:otherwise>
                    
                    <div id="flash">
                        <!-- Здесь флэш (object/embed) -->
                        <object width="1000" height="222" style="background:url({extended/properties/property[@name='header_pic']/value}) no-repeat;">
                            <param name="movie" value="{extended/properties/property[@name='flesh_vmesto_kartinki']/value}"/>
                            <embed src="{extended/properties/property[@name='flesh_vmesto_kartinki']/value}" width="1000" height="222">
                            </embed>
                        </object>
                    </div>
                    <div id="noflash" style="display: none;">
                        <!-- Здесь таблица с картинками -->
                        <a href="{extended/properties/property[@name='ssylka_s_banera']/value}">
                        <xsl:call-template name="thumbing">
                                <xsl:with-param name="source" select="extended/properties/property[@name='header_pic']/value" />
                                <xsl:with-param name="width" select="1000" />
                                <xsl:with-param name="height" select="222" />
                        </xsl:call-template>
                        </a>
                    </div>
                    
                 </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>

    
    <xsl:template match="page" mode="slider_small">
        <li>
            <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="extended/properties/property[@name='header_pic']/value" />
                        <xsl:with-param name="width" select="135" />
                        <xsl:with-param name="height" select="90" />
            </xsl:call-template>
        </li>
    </xsl:template>

=======
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata" mode="slider_banner">
        <div id="slider" class="flexslider">
            <ul class="slides">
                <xsl:apply-templates select="page" mode="slider_big" />
            </ul>
        </div>
        <div id="carousel" class="flexslider">
            <ul class="slides">
                <xsl:apply-templates select="page" mode="slider_small" />
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="page" mode="slider_big">
        <li>
            <xsl:choose>
                <xsl:when test="not(extended/properties/property[@name='flesh_vmesto_kartinki'])">
                <a href="{extended/properties/property[@name='ssylka_s_banera']/value}">
                    <xsl:call-template name="thumbing">
                                <xsl:with-param name="source" select="extended/properties/property[@name='header_pic']/value" />
                                <xsl:with-param name="width" select="1000" />
                                <xsl:with-param name="height" select="222" />
                    </xsl:call-template>
                </a>
                   <!--  <div class="slide_content">
                        <div>Акции и спецпредложения 7</div>
                        <p><xsl:value-of select="./alt" /></p>
                        <p>Период действия скидки: с 01.08.2014 по 30.09.2014</p>
                    </div> -->
                </xsl:when>
                 <xsl:otherwise>
                    
                    <div id="flash">
                        <!-- Здесь флэш (object/embed) -->
                        <object width="1000" height="222" style="background:url({extended/properties/property[@name='header_pic']/value}) no-repeat;">
                            <param name="movie" value="{extended/properties/property[@name='flesh_vmesto_kartinki']/value}"/>
                            <embed src="{extended/properties/property[@name='flesh_vmesto_kartinki']/value}" width="1000" height="222">
                            </embed>
                        </object>
                    </div>
                    <div id="noflash" style="display: none;">
                        <!-- Здесь таблица с картинками -->
                        <a href="{extended/properties/property[@name='ssylka_s_banera']/value}">
                        <xsl:call-template name="thumbing">
                                <xsl:with-param name="source" select="extended/properties/property[@name='header_pic']/value" />
                                <xsl:with-param name="width" select="1000" />
                                <xsl:with-param name="height" select="222" />
                        </xsl:call-template>
                        </a>
                    </div>
                    
                 </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>

    
    <xsl:template match="page" mode="slider_small">
        <li>
            <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="extended/properties/property[@name='header_pic']/value" />
                        <xsl:with-param name="width" select="135" />
                        <xsl:with-param name="height" select="90" />
            </xsl:call-template>
        </li>
    </xsl:template>

>>>>>>> 2fae45de4042c059b8573aa1a8f6ff71a028e71b
</xsl:stylesheet>