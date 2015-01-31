<<<<<<< HEAD
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">





    <xsl:template match="udata[@method = 'insert_form']">


        <form class="search_hform" method="get" action="/search/search_do">
            <input type="search" value="{$search_string}" name="search_string" placeholder="поиск по названию товара или номеру артикула" />
            <input class="srch_btn" type="submit" name="search" title="Начать поиск" value="" />
        </form>




    </xsl:template>

    <!-- шаблон страницы с результатами поиска -->

    <xsl:template match="result[@module = 'search'][@method = 'search_do']">
        <article class="search_results_block">

            <xsl:variable name="search-results" select="document('udata://search/search_do/')/udata" />
            
            <h1><xsl:value-of select="@header"/></h1>
            <div class="search_block_cont">
                <xsl:apply-templates select="document('udata://search/insert_form')/udata" />
                <div class="clearfix"></div>
            </div>
            
            <xsl:apply-templates select="$search-results" />

            <xsl:call-template name="numpages">
                <xsl:with-param name="total" select="$search-results/total" />
                <xsl:with-param name="limit" select="$search-results/per_page" />
            </xsl:call-template>

            <div class="clearfix"></div>
            
        </article>

    </xsl:template>

    <!-- когда ничего не найдено -->

    <xsl:template match="udata[@module = 'search'][@method = 'search_do'][not(items/item)]">

        <xsl:text>По запросу</xsl:text>
        <b>
				&#171;
				<xsl:value-of select="$search_string" />
				&#187;
			</b>
        <xsl:text>ничего не найдено.</xsl:text>

    </xsl:template>

    <!-- обработка результатов поиска -->

    <xsl:template match="udata[@module = 'search'][@method = 'search_do'][items/item]">

<!--
        <h3>По запросу  
			<b>&#171;<xsl:value-of select="$search_string" />&#187;</b> 
			найдено <xsl:value-of select="total" /> результата:   
		</h3>
-->

        <div class="search_message">
            <p>
            <xsl:text>Найдено страниц:</xsl:text> <b><xsl:value-of select="total" /></b>
            </p>
        </div>

        <ul class="search_results">
            <xsl:apply-templates select="items/item" mode="search.results" />
        </ul>
    </xsl:template>

    <!-- отдельный результат из списка -->

    <xsl:template match="item" mode="search.results">
        <li>
            <a href="{@link}">
                <xsl:value-of select="@name" />
            </a>
            <span class="dark_grey no_bold">
				<xsl:value-of select="." disable-output-escaping="yes" />
			</span>
        </li>
    </xsl:template>
=======
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">





    <xsl:template match="udata[@method = 'insert_form']">


        <form class="search_hform" method="get" action="/search/search_do">
            <input type="search" value="{$search_string}" name="search_string" placeholder="поиск по названию товара или номеру артикула" />
            <input class="srch_btn" type="submit" name="search" title="Начать поиск" value="" />
        </form>




    </xsl:template>

    <!-- шаблон страницы с результатами поиска -->

    <xsl:template match="result[@module = 'search'][@method = 'search_do']">
        <article class="search_results_block">

            <xsl:variable name="search-results" select="document('udata://search/search_do/')/udata" />
            
            <h1><xsl:value-of select="@header"/></h1>
            <div class="search_block_cont">
                <xsl:apply-templates select="document('udata://search/insert_form')/udata" />
                <div class="clearfix"></div>
            </div>
            
            <xsl:apply-templates select="$search-results" />

            <xsl:call-template name="numpages">
                <xsl:with-param name="total" select="$search-results/total" />
                <xsl:with-param name="limit" select="$search-results/per_page" />
            </xsl:call-template>

            <div class="clearfix"></div>
            
        </article>

    </xsl:template>

    <!-- когда ничего не найдено -->

    <xsl:template match="udata[@module = 'search'][@method = 'search_do'][not(items/item)]">

        <xsl:text>По запросу</xsl:text>
        <b>
				&#171;
				<xsl:value-of select="$search_string" />
				&#187;
			</b>
        <xsl:text>ничего не найдено.</xsl:text>

    </xsl:template>

    <!-- обработка результатов поиска -->

    <xsl:template match="udata[@module = 'search'][@method = 'search_do'][items/item]">

<!--
        <h3>По запросу  
			<b>&#171;<xsl:value-of select="$search_string" />&#187;</b> 
			найдено <xsl:value-of select="total" /> результата:   
		</h3>
-->

        <div class="search_message">
            <p>
            <xsl:text>Найдено страниц:</xsl:text> <b><xsl:value-of select="total" /></b>
            </p>
        </div>

        <ul class="search_results">
            <xsl:apply-templates select="items/item" mode="search.results" />
        </ul>
    </xsl:template>

    <!-- отдельный результат из списка -->

    <xsl:template match="item" mode="search.results">
        <li>
            <a href="{@link}">
                <xsl:value-of select="@name" />
            </a>
            <span class="dark_grey no_bold">
				<xsl:value-of select="." disable-output-escaping="yes" />
			</span>
        </li>
    </xsl:template>
>>>>>>> 2fae45de4042c059b8573aa1a8f6ff71a028e71b
</xsl:stylesheet>