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
        
        <script>
               
<!--               скрипт для проверки мобильности-->
                var myFlashCounter = (function(){

                    var countd = 0;
                    return function(num){
                       countd = num !== undefined ? num : countd;
                        return countd++;
                    }
                  }()); 
                  
                  
                   var myFlashCounter2 = (function(){

                    var countd2 = 0;
                    return function(){
                        return countd2++;
                    }
                  }()); 

					$( ".myFlash" ).show(function() {
						
					  $(this).attr("id", "myFlash"+myFlashCounter2());
						
					});
                  
                  
              </script>
    </xsl:template>

    <xsl:template match="page" mode="slider_big">
        <li>
            <xsl:choose>
                <xsl:when test="not(extended/properties/property[@name='flesh_vmesto_kartinki'])">
                <a href="{extended/properties/property[@name='ssylka_s_banera']/value}">
                    <!-- <xsl:call-template name="thumbing">
                                <xsl:with-param name="source" select="extended/properties/property[@name='header_pic']/value" />
                                <xsl:with-param name="width" select="1000" />
                                <xsl:with-param name="height" select="222" />
                    </xsl:call-template> -->
                    <img src="{extended/properties/property[@name='header_pic']/value}" />
                </a>
                </xsl:when>
                 <xsl:otherwise>
                    
                    
                        <!-- Здесь флэш (object/embed) -->
                        <script>
  

<!--                           вызов скрипта мобильности-->
							$(document).ready(
                                 function() {
                                    $("#myFlash"+myFlashCounter()).flash(
                                        {swf: '<xsl:value-of select="extended/properties/property[@name='flesh_vmesto_kartinki']/value" />',
                                        width: 1000,
                                        height: 222}
                                    );
                                    }
                            );

                               
                        </script>

                        <div class="myFlash">
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
        <li style="background: white;">
            <!-- choose  - костыль для лизеного первого слайда!!!! + задержка в 6 секунд инициализации слайдера. -->
            <xsl:choose>
                 <xsl:when test="position() = 1">
                        <xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',.//property[@name='header_pic']/value,')/131/90///1/9//100'))/udata" mode="temp" />
                 </xsl:when>
                 <xsl:otherwise>
                    <xsl:call-template name="thumbing">
                                <xsl:with-param name="source" select=".//property[@name='header_pic']/value" />
                                <xsl:with-param name="width" select="131" />
                                <xsl:with-param name="height" select="90" />
                    </xsl:call-template>
                 </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>

</xsl:stylesheet>