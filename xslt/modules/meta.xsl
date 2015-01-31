<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="/" mode="metateg">
        <title>
            <xsl:choose>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3236]">
                    <xsl:value-of select="/result/page/name" /> в Санкт-Петербурге и Москве | Купить <xsl:value-of select="/result/page/name" /> по низкой цене
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3262]">
                    <xsl:value-of select="/result/page/name" /> | Купить, цены на <xsl:value-of select="/result/page/name" /> в Санкт-Петербурге и Москве
                </xsl:when>
                <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3283]">
                    <xsl:value-of select="/result/page/name" /> продажа в Санкт-Петербурге и Москве
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3271]">
                    Каминная <xsl:value-of select="/result/page/name" /> | купить в Санкт-Петербурге, Москве, Екатеринбурге, Новосибирске
                </xsl:when>
                <xsl:when test="result[@module='catalog']/page[@parentId=11440]">
                    <xsl:value-of select="result/@title" />
                </xsl:when>
                <xsl:when test="result[@module='catalog']/page[@Id=11440]">
                    <xsl:value-of select="result/@title" />
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3245]">
                    <xsl:value-of select="/result/page/name" /> в Санкт-Петербурге и Москве | Цена, купить, фото
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3195]">
                    <xsl:value-of select="/result/page/name" /> в Москве и Санкт-Петербурге | Купить <xsl:value-of select="/result/page/name" /> по низкой цене
                </xsl:when>
                <xsl:when test="result[@module='catalog']/page[@parentId=3196]">
                    <xsl:value-of select="result/@title" />
                </xsl:when>
                <xsl:when test="result[@module='catalog']/page[@parentId=3197]">
                    <xsl:value-of select="result/@title" />
                </xsl:when>
                <xsl:when test="result[@module='catalog']/page[@parentId=3198]">
                    <xsl:value-of select="result/@title" />
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3211]">
                    <xsl:value-of select="/result/page/name" /> | Купить в Санкт-Петербурге, Москве, Екатеринбурге, Новосибирске
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3204]">
                    <xsl:value-of select="/result/page/name" /> - купить в Санкт-Петербурге и Москве | цена, доставка
                </xsl:when>
                <xsl:when test="result[@module='catalog']/page[@parentId=3205]">
                    <xsl:value-of select="result/@title" />
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3235]">
                    <xsl:value-of select="/result/page/name" /> - купить, цена
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3224]">
                    <xsl:value-of select="/result/page/name" /> в Санкт-Петербурге и Москве | купить, цены, фото, отзывы
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3284]">
                    <xsl:value-of select="/result/page/name" /> - купить, цены, отзывы | Санкт-Петербург, Москва, Екатеринбург, Новосибирск
                </xsl:when>
                <xsl:when test="result[@module='catalog']/parents/page[@id=3173]">
                    <xsl:value-of select="/result/page/name" /> купить в Санкт-Петербурге и Москве | цены, отзывы
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="result/@title" />
                </xsl:otherwise>
            </xsl:choose>
        </title>
        <!-- <meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" /> -->
        <xsl:choose>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3236]">
                <meta name="DESCRIPTION" content="{/result/page/name} по низкой цене с доставкой во все регионы России. Большой выбор каминных облицовок, каминов и порталов - Домотехника" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3262]">
                <meta name="DESCRIPTION" content="Низкая цена на {/result/page/name} с доставкой по России. Домотехника - это качество продоваемой продукции!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3271]">
                <meta name="DESCRIPTION" content="Купить недорого - {/result/page/name} в компании Домотехника. Низкие цены, высокое качество, звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3271]">
                <meta name="DESCRIPTION" content="Купить в Санкт-Петербурге и Москве - {/result/page/name}. Домотехника - качество с доставкой по России!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=11440]">
                <meta name="DESCRIPTION" content="{result/meta/description}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3245]">
                <meta name="DESCRIPTION" content="Купить {/result/page/name} в Москве и Санкт-Петербурге - Домотехника! Качество, доставка, приезжайте к нам!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3195]">
                <meta name="DESCRIPTION" content="Доставка по все России - {/result/page/name} в компании Домотехника. Закажите прямо сейчас в интернет-магазине!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3196]">
                <meta name="DESCRIPTION" content="{result/meta/description}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3197]">
                <meta name="DESCRIPTION" content="{result/meta/description}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3198]">
                <meta name="DESCRIPTION" content="{result/meta/description}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3211]">
                <meta name="DESCRIPTION" content="Большой каталог дымоходов - Домотехника. Купить {/result/page/name} с доставкой, звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3204]">
                <meta name="DESCRIPTION" content="Продажа: {/result/page/name} по низкой цене с доставкой по всем регионам России. Домотехника - красота вашего дома!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3205]">
                <meta name="DESCRIPTION" content="{result/meta/description}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3235]">
                <meta name="DESCRIPTION" content="Большой выбор изоляционных материалов. Купить {/result/page/name} в компании Домотехника - залог качества!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3224]">
                <meta name="DESCRIPTION" content="Большой выбор изделий из мрамора! Заказать {/result/page/name} можно прямо сейчас на сайте - Домотехника. Звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3284]">
                <meta name="DESCRIPTION" content="Поможем подобрать для загородного дома все - Домотехника!  Низкие цены на покупку: {/result/page/name} , звоните!" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3173]">
                <meta name="DESCRIPTION" content="Купить {/result/page/name} с доставкой по регионам России. Домотехника - это низкие цены и высокое качество!" />
            </xsl:when>
            <xsl:otherwise>
                <meta name="DESCRIPTION" content="{result/meta/description}" />
            </xsl:otherwise>
        </xsl:choose>
        <!-- <meta name="viewport" content="ya-title=white,ya-dock=#000000" /> -->
        <xsl:choose>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3236]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name} купить, {/result/page/name} цена, {/result/page/name} фото" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3262]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name} цена, {/result/page/name} санкт петербург, {/result/page/name} москва" />
            </xsl:when>
            <xsl:when test="result[@module='catalog'][@method='object']/parents/page[@id=3271]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name} недорого, {/result/page/name} дешево, {/result/page/name} цена, {/result/page/name} москва, {/result/page/name} санкт петербург, {/result/page/name} спб, {/result/page/name} фото" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3271]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name} купить, {/result/page/name} цена, {/result/page/name} в санкт-петербурге, {/result/page/name} в москве, {/result/page/name} отзывы, каминная {/result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=11440]">
                <meta name="KEYWORDS" content="{result/meta/keywords}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3245]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name}купить, {/result/page/name} недорого, {/result/page/name} цена, {/result/page/name} дешево" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3195]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name} в москве, {/result/page/name} в санкт-петербурге, {/result/page/name} купить, цена на {/result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3196]">
                <meta name="KEYWORDS" content="{result/meta/keywords}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3197]">
                <meta name="KEYWORDS" content="{result/meta/keywords}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3198]">
                <meta name="KEYWORDS" content="{result/meta/keywords}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3211]">
                <meta name="KEYWORDS" content="{/result/page/name}, купить {/result/page/name}, цена {/result/page/name}, в санкт-петербурге {/result/page/name}, в москве {/result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3204]">
                <meta name="KEYWORDS" content="{/result/page/name}, цена {/result/page/name}, {/result/page/name} санкт-петербург, {/result/page/name} спб, {/result/page/name} москва, {/result/page/name} продажа" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/page[@parentId=3205]">
                <meta name="KEYWORDS" content="{result/meta/keywords}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3235]">
                <meta name="KEYWORDS" content="{/result/page/name}, купить {/result/page/name}, цена на {/result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3224]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name} цена, {/result/page/name} купить, {/result/page/name} санкт петербург, {/result/page/name} москва" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3284]">
                <meta name="KEYWORDS" content="{/result/page/name}, купить {/result/page/name}, цена {/result/page/name}" />
            </xsl:when>
            <xsl:when test="result[@module='catalog']/parents/page[@id=3173]">
                <meta name="KEYWORDS" content="{/result/page/name}, {/result/page/name} купить, {/result/page/name} цена, фото {/result/page/name}" />
            </xsl:when>
            <xsl:otherwise>
                <meta name="KEYWORDS" content="{result/meta/keywords}" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>