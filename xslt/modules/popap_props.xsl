<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:xlink="http://www.w3.org/TR/xlink"
                exclude-result-prefixes="xsl date udt xlink">
 
    <xsl:output encoding="utf-8" method="html" indent="yes" />
 
    <xsl:template match="/">
    <div class="kabinet-block">
        <form class="options" action="/emarket/basket/put/element/{udata/page/@id}/" onsubmit="site.basket.add('{udata/page/@id}', this, true); return false;">
            <fieldset class="forma">
            <xsl:apply-templates select="//group[@name = 'opcii']/property" />
            </fieldset>
            <input type="submit"  class="submit"  value="Добавить" />
        </form>
    </div>
    </xsl:template>

    <xsl:template match="property">
        <table>
	<thead>
		<tr>
			<th colspan="3" align="left">
                        <xsl:value-of select="concat(title, ':')" />
                    </th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="value/item" />
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="item">
        <tr>
            <td style="width:20px;">
                <input type="radio" name="options[{../../@name}]" value="{@id}" id="{generate-id()}">
                    <xsl:if test="position() = 1">
                        <xsl:attribute name="checked">
                            <xsl:text>checked</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                </input>
            </td>
            <td>
                <label for="{generate-id()}">
                    <xsl:value-of select="@name" />
                </label>
            </td>
            <td align="right">
                <label for="{generate-id()}">
                    <xsl:value-of select="@float" />
                </label>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>