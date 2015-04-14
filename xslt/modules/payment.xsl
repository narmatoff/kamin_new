<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="result[@module = 'emarket'][@method = 'orderApprove']">

</xsl:template>

<xsl:template match="result[@module = 'emarket'][@method = 'orderCanceled']">
<h1>
	ваш заказ отменен
</h1>
<div class="clearfix">
</div>
Свяжитесь с кем-нибудь
</xsl:template>

<xsl:template match="result[@module = 'emarket'][@method = 'orderDecline']">

</xsl:template>

</xsl:stylesheet>
