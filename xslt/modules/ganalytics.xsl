<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
<<<<<<< HEAD
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink"
	xmlns:umi="http://www.umi-cms.ru/TR/umi">
=======
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b

<xsl:template name="ec">
	
</xsl:template>

<<<<<<< HEAD
<xsl:template name="checkout_cart">
	<!-- <script type="text/javascript">
		function checkout() {
		<xsl:apply-templates select="document('udata://emarket/cart')//items/item" mode="ga_cart" />
		}
	</script> -->
</xsl:template>

<xsl:template match="item" mode="ga_cart">
	<xsl:variable name="tovar" select="document(page/@xlink:href)/udata/page" />
			 ga('ec:addProduct', {
		                'id': '<xsl:value-of select="$tovar//property[@name='artikul']/value" />',
		                'name': '<xsl:value-of select="$tovar//property[@name='nazvanie']/value" />',
		                'category': '<xsl:value-of select="document(concat('upage://', $tovar/@parentId))//property[@name='h1']/value" />',
		                'brand': '<xsl:value-of select="$tovar//property[@name='brend']/value/item/@name" />',
		                'price': '<xsl:value-of select="price/actual" />',
		                'quantity': '<xsl:value-of select="amount" />'
		    });
</xsl:template>

=======
>>>>>>> d08d585e609f4965f83d5fd86af427fc61301e3b
</xsl:stylesheet>