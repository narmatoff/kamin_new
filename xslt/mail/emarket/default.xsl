<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:php="http://php.net/xsl"
		xsl:extension-element-prefixes="php"
		exclude-result-prefixes="php">

	<xsl:output encoding="utf-8" method="html" indent="yes" />

	<xsl:template match="status_notification">
		<xsl:variable name="pay_stat" select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@id" />
	<html>

			<head>
			<style type="text/css">
			table td {
			border: 1px solid black;
			}
			</style>
	<link rel="stylesheet" href="http://{domain}/templates/tokanet.ru/css/style_design140513.css/css/style_design140513.css" media="screen" type="text/css"/>
	
	</head>
	<body id="invoice">
	<img  src="http://{domain}/templates/kamin/img/logo.png" alt=""/>
		<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1"/>
		<p style="font-size:15px;">Здравствуйте, <xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='lname']/value" />&#160;
					<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='fname']/value" />&#160;
					<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='father_name']/value" />!</p>

		<p style="font-size:15px;">Спасибо за Ваш заказ #<xsl:value-of select="order_number" /> <xsl:value-of select="status" />. В ближайшее время с вами свяжется менеджер для уточнения деталей.</p>
		<br/><br/>

		<table id="cart_products" style="width:100%">
					<tr>
						<td class="cart_table_img"></td>
						<td class="cart_table_name">Наименование</td>
						<td class="cart_table_name">Артикул</td>
						<td class="cart_table_price">Цена, р.</td>
						<td class="cart_table_num">Количество, шт.</td>
						<td class="cart_table_priceall">Сумма, р.</td>
					
					</tr>
        
			<xsl:apply-templates select="document(concat('udata://emarket/order/', order_id))/udata/items/item" mode="order_info_del" />
			</table>
			<strong style="font-size:15px;"> Сумма оплаты: </strong>
			<strong style="font-size:15px;"> <xsl:value-of select="document(concat('uobject://',order_id))//property[@name='total_price']/value" />р.</strong><br/><br/>
			<table>
				<tr>
					<td><strong> E-mail: </strong> </td>
					<td><xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='email']/value" /></td>
				</tr>
				<tr>
					<td><strong> Телефон: </strong> </td>
					<td><xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='phone']/value" /></td>
				</tr>
				<tr>
					<td><strong> Адрес доставки: </strong></td>
					<td><xsl:variable select="document(concat('uobject://',$customer1))//property[@name='delivery_addresses']/value/item/@id" name="delivery1"/>
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='index']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='region']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='city']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='street']/value" />, &#160; 
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='house']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='flat']/value" /></td>
				</tr>
				<tr>
					<td><strong> Способ оплаты: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@name" /></td>
				</tr>
				<tr>
					<td><strong> Способ доставки: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='delivery_id']/value/item/@name" /></td>


				</tr>
				<tr>
					<td><strong> Дата заказа: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='order_create_date']/value/@formatted-date" /></td>
				</tr>
			</table>
			<xsl:value-of select="$pay_stat" />
			<xsl:if test="$pay_stat='1667'">
				<xsl:apply-templates select="document(concat('uobject://',order_id))/udata/object" mode="bill" />
			</xsl:if><br/><br/>
			---<br/>
<p>Уважаемый покупатель!</p>

<p>Ваш заказ отправлен в обработку. Спасибо за покупку!</p>

<p>Если у вас есть вопросы, пожалуйста, позвоните нам по телефонам:</p>

<p>8-800-555-444-0 — многоканальный телефон (бесплатно на территории России)<br/>
(812) 321-77-77 — Санкт-Петербург<br/>
(495) 789-91-67 — Москва<br/>
(343) 287-22-22 — Екатеринбург<br/>
(383) 246-03-37 — Новосибирск</p>

<p>Обращаем ваше внимание, что звонок менеджера об уточнении заказа будет осуществлен в рабочее время в течение нескольких часов, а в праздничные и выходные дни может занимать от нескольких часов до 2-х рабочих дней.</p>

<p>С уважением,<br/>
Компания «Домотехника»<br/>
http://kamin.ru</p>
				</body>
		</html>
	</xsl:template>

	<xsl:template match="status_notification_receipt">
			<xsl:variable name="pay_stat" select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@id" />
	<html>
			<head>
			<style type="text/css">
			table td {
			border: 1px solid black;
			}
			</style>
	<link rel="stylesheet" href="http://{domain}/templates/tokanet.ru/css/style_design140513.css/css/style_design140513.css" media="screen" type="text/css"/>
	
	</head>
	<body id="invoice">
	<img  src="http://{domain}/templates/kamin/img/logo.png" alt=""/>
		<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1"/>
		<p style="font-size:15px;">Здравствуйте, <xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='lname']/value" />&#160;
					<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='fname']/value" />&#160;
					<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='father_name']/value" />!</p>

		<p style="font-size:15px;">Спасибо за Ваш заказ #<xsl:value-of select="order_number" /> <xsl:value-of select="status" />. В ближайшее время с вами свяжется менеджер для уточнения деталей.</p>
		<br/><br/>

		<table id="cart_products" style="width:100%">
					<tr>
						<td class="cart_table_img"></td>
						<td class="cart_table_name">Наименование</td>
						<td class="cart_table_name">Артикул</td>
						<td class="cart_table_price">Цена, р.</td>
						<td class="cart_table_num">Количество, шт.</td>
						<td class="cart_table_priceall">Сумма, р.</td>
					
					</tr>
        
			<xsl:apply-templates select="document(concat('udata://emarket/order/', order_id))/udata/items/item" mode="order_info_del" />
			</table>
			<strong style="font-size:15px;"> Сумма оплаты: </strong>
			<strong style="font-size:15px;"> <xsl:value-of select="document(concat('uobject://',order_id))//property[@name='total_price']/value" />р.</strong><br/><br/>
			<table>
				<tr>
					<td><strong> E-mail: </strong> </td>
					<td><xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='email']/value" /></td>
				</tr>
				<tr>
					<td><strong> Телефон: </strong> </td>
					<td><xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='phone']/value" /></td>
				</tr>
				<tr>
					<td><strong> Адрес доставки: </strong></td>
					<td><xsl:variable select="document(concat('uobject://',$customer1))//property[@name='delivery_addresses']/value/item/@id" name="delivery1"/>
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='index']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='region']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='city']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='street']/value" />, &#160; 
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='house']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='flat']/value" /></td>
				</tr>
				<tr>
					<td><strong> Способ оплаты: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@name" /></td>
				</tr>
				<tr>
					<td><strong> Способ доставки: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='delivery_id']/value/item/@name" /></td>


				</tr>
				<tr>
					<td><strong> Дата заказа: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='order_create_date']/value/@formatted-date" /></td>
				</tr>
			</table>
			<xsl:value-of select="$pay_stat" />
			<xsl:if test="$pay_stat='1667'">
				<xsl:apply-templates select="document(concat('uobject://',order_id))/udata/object" mode="bill" />
			</xsl:if>
				</body>
		</html>
		<br/><br/>
		<xsl:text>Квитанцию на оплату вы можете получить, перейдя по </xsl:text>
		<a href="http://{domain}/emarket/receipt/{order_id}/{receipt_signature}/">
			<xsl:text>этой ссылке</xsl:text>
		</a>.
	</xsl:template>

	<xsl:template match="neworder_notification">
		<xsl:variable name="pay_stat" select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@id" />
	<html>
			<head>
			<style type="text/css">
			table td {
			border: 1px solid black;
			}
			</style>
	<link rel="stylesheet" href="http://{domain}/templates/tokanet.ru/css/style_design140513.css/css/style_design140513.css" media="screen" type="text/css"/>
	
	</head>
	<body id="invoice">
	<img  src="http://{domain}/templates/kamin/img/logo.png" alt=""/>
		<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1"/>
		<p style="font-size:15px;">Здравствуйте, <xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='lname']/value" />&#160;
					<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='fname']/value" />&#160;
					<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='father_name']/value" />!</p>

		<p style="font-size:15px;">Спасибо за Ваш заказ #<xsl:value-of select="order_number" /> <xsl:value-of select="status" />. В ближайшее время с вами свяжется менеджер для уточнения деталей.</p>
		<br/><br/>

		<table id="cart_products" style="width:100%">
					<tr>
						<td class="cart_table_img"></td>
						<td class="cart_table_name">Наименование</td>
						<td class="cart_table_name">Артикул</td>
						<td class="cart_table_price">Цена, р.</td>
						<td class="cart_table_num">Количество, шт.</td>
						<td class="cart_table_priceall">Сумма, р.</td>
					
					</tr>
        
			<xsl:apply-templates select="document(concat('udata://emarket/order/', order_id))/udata/items/item" mode="order_info_del" />
			</table>
			<strong style="font-size:15px;"> Сумма оплаты: </strong>
			<strong style="font-size:15px;"> <xsl:value-of select="document(concat('uobject://',order_id))//property[@name='total_price']/value" />р.</strong><br/><br/>
			<table>
				<tr>
					<td><strong> E-mail: </strong> </td>
					<td><xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='email']/value" /></td>
				</tr>
				<tr>
					<td><strong> Телефон: </strong> </td>
					<td><xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='phone']/value" /></td>
				</tr>
				<tr>
					<td><strong> Адрес доставки: </strong></td>
					<td><xsl:variable select="document(concat('uobject://',$customer1))//property[@name='delivery_addresses']/value/item/@id" name="delivery1"/>
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='index']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='region']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='city']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='street']/value" />, &#160; 
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='house']/value" />,&#160;
					<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='flat']/value" /></td>
				</tr>
				<tr>
					<td><strong> Способ оплаты: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@name" /></td>
				</tr>
				<tr>
					<td><strong> Способ доставки: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='delivery_id']/value/item/@name" /></td>


				</tr>
				<tr>
					<td><strong> Дата заказа: </strong></td>
					<td><xsl:value-of select="document(concat('uobject://',order_id))//property[@name='order_create_date']/value/@formatted-date" /></td>
				</tr>
			</table>
			<xsl:value-of select="$pay_stat" />
			<xsl:if test="$pay_stat='1667'">
				<xsl:apply-templates select="document(concat('uobject://',order_id))/udata/object" mode="bill" />
			</xsl:if><br/><br/>
			---<br/>
<p>Уважаемый покупатель!</p>

<p>Ваш заказ отправлен в обработку. Спасибо за покупку!</p>

<p>Если у вас есть вопросы, пожалуйста, позвоните нам по телефонам:</p>

<p>8-800-555-444-0 — многоканальный телефон (бесплатно на территории России)<br/>
(812) 321-77-77 — Санкт-Петербург<br/>
(495) 789-91-67 — Москва<br/>
(343) 287-22-22 — Екатеринбург<br/>
(383) 246-03-37 — Новосибирск</p>

<p>Обращаем ваше внимание, что звонок менеджера об уточнении заказа будет осуществлен в рабочее время в течение нескольких часов, а в праздничные и выходные дни может занимать от нескольких часов до 2-х рабочих дней.</p>

<p>С уважением,<br/>
Компания «Домотехника»<br/>
http://kamin.ru</p>
				</body>
		</html>
		</xsl:template>


	<xsl:template match="item" mode="order_info_del">
		<xsl:variable name="item_page"
			select="document(concat('upage://',page/@id))/udata" />
		<tr>
			<td class="cart_table_img">
				
						<xsl:call-template name="thumbing">
							<xsl:with-param name="source"
								select="$item_page/page/properties/group/property[@name='header_pic']/value" />
							<xsl:with-param name="width" select="90" />
							<xsl:with-param name="height" select="75" />
						</xsl:call-template>
					
			</td>
			<td class="cart_table_name">
				<a href="{page/@link}">
					<h3 class="cart_p_tit">
						<xsl:value-of
							select="$item_page/page/properties/group/property[@name='h1']/value" />
					</h3>
					
				</a>
			</td>
			<td class="cart_table_name">
					<h3 class="cart_p_tit">
						<xsl:value-of
							select="$item_page/page/properties/group/property[@name='artikul']/value" />
					</h3>
			</td>
			<td class="cart_table_price"> 
				<p class="cart_p_price">
					<span class="good_priceview_separate">
						<xsl:value-of select="ceiling(price/actual)" />
					</span>
				</p>
			</td>
			<td class="cart_table_num">
				<!-- <xsl:value-of select="amount" disable-output-escaping="" /> -->
			
							<xsl:value-of select="amount" />
							
					
			</td>
			<td  class="cart_table_priceall">
				<p class="cart_p_price_all">
					<span class="cart_item_price_{@id} good_priceview_separate">
						<xsl:value-of select="total-price/actual" />
					</span>
				</p>
			</td>
			
			
		</tr>
	</xsl:template>

	<xsl:template name="thumbing">
		<xsl:param name="source" />
		<xsl:param name="width" select='60' />
		<xsl:param name="height">auto</xsl:param>
		<xsl:param name="class" />
		<xsl:param name="podpis" />

		<!--
			<xsl:choose> <xsl:when test="$width"> </xsl:when> <xsl:otherwise>
			<xsl:variable name="width" select=""></xsl:variable> </xsl:otherwise>
			</xsl:choose>
		-->

		<xsl:choose>
			<xsl:when test="$source">
				
		<xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$source,')/',$width,'/',$height,'///1/1//100'))/udata"
			mode="temp">
			<xsl:with-param name="class" select="$class"/>
			<xsl:with-param name="podpis" select="$podpis"/>
		</xsl:apply-templates>	
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$template-resources,'img/nophoto.jpg)/',$width,'/',$height,'//////100'))/udata"	mode="temp">
					<xsl:with-param name="class" select="$class"/>
					<xsl:with-param name="podpis" select="$podpis"/>
				</xsl:apply-templates>	

			</xsl:otherwise>
		</xsl:choose>


	</xsl:template>

	<xsl:template match="udata" mode="temp">
		<xsl:param name="class" />
		<xsl:param name="podpis" />
		<img class="{$class}" alt="{$podpis}" src="{src}" />
	</xsl:template>



		<xsl:template match="object" mode="bill">
		<xsl:variable name="payment" select="document(concat('uobject://', properties/group/property[@name='payment_id']/value/item/@id))/udata/object" />
		<xsl:variable name="person" select="document(concat('uobject://', properties/group/property[@name='legal_person']/value/item/@id))/udata/object" />

			<div style="width:620px;"><!--hr/--></div>
			<table bgcolor="#FFFFFF" width="620" height="1000" cellpadding="1" cellspacing="0" border="1">
				<tr>
					<td align="left" valign="top" style="font-family:Arial;font-size:13px;">
						<u><b><xsl:value-of select="$payment//property[@name='name']/value" /></b></u>
						<br/><br/>
						<b>Адрес: <xsl:value-of select="$payment//property[@name='legal_address']/value" />, тел.: <xsl:value-of select="$payment//property[@name='phone_number']/value" /></b>
						<br/><br/>
						<table class="tbl" width="620" cellpadding="2" cellspacing="0" border="0" bordercolor="#000000" style="font-family:Arial;font-size:13px;">
							<tr>
								<td width="175" align="left" valign="top">ИНН <xsl:value-of select="$payment//property[@name='inn']/value" /></td>
								<td width="175" align="left" valign="top">КПП <xsl:value-of select="$payment//property[@name='kpp']/value" /></td>
								<td width="54" align="center" valign="bottom" rowspan="2">Сч. №</td>
								<td width="216" align="left" valign="bottom" rowspan="2"><xsl:value-of select="$payment//property[@name='account']/value" /></td>
							</tr>
							<tr>
								<td width="350" align="left" valign="top" colspan="2">
									Получатель
									<br/>
									<xsl:value-of select="$payment//property[@name='name']/value" />
								</td>
							</tr>
							<tr>
								<td align="left" valign="top" rowspan="2" colspan="2">
									Банк получателя
									<br/>
									<xsl:value-of select="$payment//property[@name='bank']/value" />

								</td>
								<td align="center" valign="top">БИК</td>
								<td align="left" valign="top" style="border-bottom-width:0px;"><xsl:value-of select="$payment//property[@name='bik']/value" /></td>
							</tr>
							<tr>
								<td align="center" valign="top">Сч. №</td>
								<td align="left" valign="top" style="border-top-width:0px;"><xsl:value-of select="$payment//property[@name='bank_account']/value" /></td>
							</tr>
						</table>
						<br/><br/>
						<center style="font:16 Arial;font-weight:bold;">СЧЕТ № И/<xsl:value-of select="@id" />/П от <xsl:value-of select="php:function('dateToString', number(properties/group/property[@name='order_date']/value/@unix-timestamp))" />.</center>
						<br/><br/>
						<table cellpadding="4" cellspacing="0" border="0" style="font-family:Arial;font-size:13px;">
							<tr>
								<td>
									Покупатель: ИНН <xsl:value-of select="$person//property[@name='inn']/value" />
									, КПП <xsl:value-of select="$person//property[@name='kpp']/value" />
									, <xsl:value-of select="$person//property[@name='name']/value" />
									, <xsl:value-of select="$person//property[@name='legal_address']/value" />
									, тел: <xsl:value-of select="$person//property[@name='phone_number']/value" />
									, факс: <xsl:value-of select="$person//property[@name='fax']/value" />
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
						<table class="tbl" width="620" cellpadding="3" cellspacing="0" border="0" bordercolor="#000000" style="font-family:Arial;font-size:13px;">
							<tr>
								<td width="20" align="center" valign="top">№</td>
								<td width="300" align="left" valign="top">Товар</td>
								<td width="65" align="left" valign="top">Кол-во</td>
								<td width="65" align="left" valign="top">Ед.</td>
								<td width="85" align="center" valign="top">Цена</td>
								<td width="85" align="center" valign="top">Сумма</td>
							</tr>

							<xsl:apply-templates select="properties/group/property[@name='order_items']/value/item" mode="order-items" />

							<xsl:variable name="total_original_price" select="properties/group/property[@name='total_original_price']/value" />
							<xsl:variable name="total_price" select="properties/group/property[@name='total_price']/value" />
							<xsl:variable name="delivery" select="properties/group/property[@name='delivery_price']/value" />
							<xsl:variable name="discount" select="$total_original_price + $delivery - $total_price" />

							<xsl:if test="$discount &gt; 0">
							<tr>
									<td align="right" valign="top" colspan="5"><b>Скидка:</b></td>
									<td align="right" valign="top">
											<xsl:value-of select="format-number($discount, '#.00')" />
									</td>
								</tr>
							</xsl:if>

							<xsl:apply-templates select="properties/group/property[@name='delivery_price']/value" mode="delivery" />

							<tr>
								<td align="right" valign="top" colspan="5"><b>Итого:</b></td>
								<td align="right" valign="top"><xsl:value-of select="format-number(properties/group/property[@name='total_price']/value, '#.00')" /></td>
							</tr>
							<tr>
								<td colspan="5" align="right" valign="top"><b>Без налога (НДС).</b></td>
								<td align="center" valign="top">-</td>
							</tr>
							<tr>
								<td colspan="5" align="right" valign="top"><b>Всего к оплате:</b></td>
								<td align="right" valign="top"><xsl:value-of select="format-number(properties/group/property[@name='total_price']/value, '#.00')" /></td>
							</tr>
						</table>
						<br/><br/>
						<p style="font-family:Arial;font-size:13px;">
							Всего наименований <xsl:value-of select="properties/group/property[@name='total_amount']/value" />, на сумму <xsl:value-of select="format-number(properties/group/property[@name='total_price']/value, '#.00')" /> руб.
							<br/>
							<b>(<xsl:value-of select="php:function('sumToString', number(properties/group/property[@name='total_price']/value))" />)</b>
						</p>

						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="$payment//property[@name='sign_image']/value" />
							</xsl:attribute>
						</img>
					</td>
				</tr>
			</table>
			
	</xsl:template>

	<xsl:template match="item" mode="order-items">
		<xsl:variable name="object" select="document(concat('uobject://', @id))/udata/object" />
		<tr>
			<td width="20" align="center" valign="top"><xsl:value-of select="position()" /></td>
			<td width="300" align="left" valign="top"><xsl:value-of select="$object/@name" /></td>
			<td width="65" align="left" valign="top"><xsl:value-of select="$object//property[@name='item_amount']/value" /></td>
			<td width="65" align="left" valign="top">шт.</td>
			<td width="85" align="center" valign="top"><xsl:value-of select="format-number($object//property[@name='item_price']/value, '#.00')" /></td>
			<td width="85" align="center" valign="top"><xsl:value-of select="format-number($object//property[@name='item_total_price']/value, '#.00')" /></td>
		</tr>
	</xsl:template>

	<xsl:template match="value[.='0']" mode="delivery" />
	<xsl:template match="value" mode="delivery">
		<tr>
			<td align="right" valign="top" colspan="5"><b>Доставка:</b></td>
			<td align="right" valign="top">
					<xsl:value-of select="format-number(., '#.00')" />
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
