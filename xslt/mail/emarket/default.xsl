<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" xsl:extension-element-prefixes="php" exclude-result-prefixes="php">

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
			<link rel="stylesheet" href="http://{domain}/templates/tokanet.ru/css/style_design140513.css/css/style_design140513.css" media="screen" type="text/css" />

		</head>

		<body id="invoice">
			<img src="http://{domain}/templates/kamin/img/logo.png" alt="" />
			<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1" />
			<p style="font-size:15px;">Здравствуйте,
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='lname']/value" />&#160;
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='fname']/value" />&#160;
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='father_name']/value" />!</p>

			<p style="font-size:15px;">Спасибо за Ваш заказ #
				<xsl:value-of select="order_number" />
				<xsl:value-of select="status" />. В ближайшее время с вами свяжется менеджер для уточнения деталей.</p>
			<br/>
			<br/>

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
			<strong style="font-size:15px;"> <xsl:value-of select="document(concat('uobject://',order_id))//property[@name='total_price']/value" />р.</strong>
			<br/>
			<br/>
			<table>
				<tr>
					<td><strong> E-mail: </strong> </td>
					<td>
						<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='email']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Телефон: </strong> </td>
					<td>
						<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='phone']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Адрес доставки: </strong>
					</td>
					<td>
						<xsl:variable select="document(concat('uobject://',$customer1))//property[@name='delivery_addresses']/value/item/@id" name="delivery1" />
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='index']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='region']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='city']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='street']/value" />, &#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='house']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='flat']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Способ оплаты: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@name" />
					</td>
				</tr>
				<tr>
					<td><strong> Способ доставки: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='delivery_id']/value/item/@name" />
					</td>


				</tr>
				<tr>
					<td><strong> Дата заказа: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='order_create_date']/value/@formatted-date" />
					</td>
				</tr>
			</table>
			<xsl:value-of select="$pay_stat" />
			<xsl:if test="$pay_stat='1667'">
				<xsl:apply-templates select="document(concat('uobject://',order_id))/udata/object" mode="bill" />
			</xsl:if>
			<br/>
			<br/> ---
			<br/>
			<p>Уважаемый покупатель!</p>

			<p>Ваш заказ отправлен в обработку. Спасибо за покупку!</p>

			<p>Если у вас есть вопросы, пожалуйста, позвоните нам по телефонам:</p>

			<p>8-800-555-444-0 — многоканальный телефон (бесплатно на территории России)
				<br/> (812) 321-77-77 — Санкт-Петербург
				<br/> (495) 789-91-67 — Москва
				<br/> (343) 287-22-22 — Екатеринбург
				<br/> (383) 246-03-37 — Новосибирск</p>

			<p>Обращаем ваше внимание, что звонок менеджера об уточнении заказа будет осуществлен в рабочее время в течение нескольких часов, а в праздничные и выходные дни может занимать от нескольких часов до 2-х рабочих дней.</p>

			<p>С уважением,
				<br/> Компания «Домотехника»
				<br/> http://kamin.ru
			</p>
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
			<link rel="stylesheet" href="http://{domain}/templates/tokanet.ru/css/style_design140513.css/css/style_design140513.css" media="screen" type="text/css" />

		</head>

		<body id="invoice">
			<img src="http://{domain}/templates/kamin/img/logo.png" alt="" />
			<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1" />
			<p style="font-size:15px;">Здравствуйте,
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='lname']/value" />&#160;
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='fname']/value" />&#160;
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='father_name']/value" />!</p>

			<p style="font-size:15px;">Спасибо за Ваш заказ #
				<xsl:value-of select="order_number" />
				<xsl:value-of select="status" />. В ближайшее время с вами свяжется менеджер для уточнения деталей.</p>
			<br/>
			<br/>

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
			<strong style="font-size:15px;"> <xsl:value-of select="document(concat('uobject://',order_id))//property[@name='total_price']/value" />р.</strong>
			<br/>
			<br/>
			<table>
				<tr>
					<td><strong> E-mail: </strong> </td>
					<td>
						<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='email']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Телефон: </strong> </td>
					<td>
						<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='phone']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Адрес доставки: </strong>
					</td>
					<td>
						<xsl:variable select="document(concat('uobject://',$customer1))//property[@name='delivery_addresses']/value/item/@id" name="delivery1" />
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='index']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='region']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='city']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='street']/value" />, &#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='house']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='flat']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Способ оплаты: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@name" />
					</td>
				</tr>
				<tr>
					<td><strong> Способ доставки: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='delivery_id']/value/item/@name" />
					</td>


				</tr>
				<tr>
					<td><strong> Дата заказа: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='order_create_date']/value/@formatted-date" />
					</td>
				</tr>
			</table>
			<xsl:value-of select="$pay_stat" />
			<xsl:if test="$pay_stat='1667'">
				<xsl:apply-templates select="document(concat('uobject://',order_id))/udata/object" mode="bill" />
			</xsl:if>
		</body>

		</html>
		<br/>
		<br/>
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
			<link rel="stylesheet" href="http://{domain}/templates/tokanet.ru/css/style_design140513.css/css/style_design140513.css" media="screen" type="text/css" />

		</head>

		<body id="invoice">
			<img src="http://{domain}/templates/kamin/img/logo.png" alt="" />
			<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1" />
			<p style="font-size:15px;">Здравствуйте,
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='lname']/value" />&#160;
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='fname']/value" />&#160;
				<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='father_name']/value" />!</p>

			<p style="font-size:15px;">Спасибо за Ваш заказ #
				<xsl:value-of select="order_number" />
				<xsl:value-of select="status" />. В ближайшее время с вами свяжется менеджер для уточнения деталей.</p>
			<br/>
			<br/>

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
			<strong style="font-size:15px;"> <xsl:value-of select="document(concat('uobject://',order_id))//property[@name='total_price']/value" />р.</strong>
			<br/>
			<br/>
			<table>
				<tr>
					<td><strong> E-mail: </strong> </td>
					<td>
						<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='email']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Телефон: </strong> </td>
					<td>
						<xsl:value-of select="document(concat('uobject://',$customer1))//property[@name='phone']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Адрес доставки: </strong>
					</td>
					<td>
						<xsl:variable select="document(concat('uobject://',$customer1))//property[@name='delivery_addresses']/value/item/@id" name="delivery1" />
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='index']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='region']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='city']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='street']/value" />, &#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='house']/value" />,&#160;
						<xsl:value-of select="document(concat('uobject://',$delivery1))//property[@name='flat']/value" />
					</td>
				</tr>
				<tr>
					<td><strong> Способ оплаты: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='payment_id']/value/item/@name" />
					</td>
				</tr>
				<tr>
					<td><strong> Способ доставки: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='delivery_id']/value/item/@name" />
					</td>


				</tr>
				<tr>
					<td><strong> Дата заказа: </strong>
					</td>
					<td>
						<xsl:value-of select="document(concat('uobject://',order_id))//property[@name='order_create_date']/value/@formatted-date" />
					</td>
				</tr>
			</table>
			<xsl:value-of select="$pay_stat" />
			<xsl:if test="$pay_stat='1667'">
				<xsl:apply-templates select="document(concat('uobject://',order_id))/udata/object" mode="bill" />
			</xsl:if>
			<br/>
			<br/> ---
			<br/>
			<p>Уважаемый покупатель!</p>

			<p>Ваш заказ отправлен в обработку. Спасибо за покупку!</p>

			<p>Если у вас есть вопросы, пожалуйста, позвоните нам по телефонам:</p>

			<p>8-800-555-444-0 — многоканальный телефон (бесплатно на территории России)
				<br/> (812) 321-77-77 — Санкт-Петербург
				<br/> (495) 789-91-67 — Москва
				<br/> (343) 287-22-22 — Екатеринбург
				<br/> (383) 246-03-37 — Новосибирск</p>

			<p>Обращаем ваше внимание, что звонок менеджера об уточнении заказа будет осуществлен в рабочее время в течение нескольких часов, а в праздничные и выходные дни может занимать от нескольких часов до 2-х рабочих дней.</p>

			<p>С уважением,
				<br/> Компания «Домотехника»
				<br/> http://kamin.ru
			</p>
		</body>

		</html>
	</xsl:template>


	<xsl:template match="item" mode="order_info_del">
		<xsl:variable name="item_page" select="document(concat('upage://',page/@id))/udata" />
		<tr>
			<td class="cart_table_img">

				<xsl:call-template name="thumbing">
					<xsl:with-param name="source" select="$item_page/page/properties/group/property[@name='header_pic']/value" />
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
			<td class="cart_table_priceall">
				<p class="cart_p_price_all">
					<span class="cart_item_price_{@id} good_priceview_separate">
						<xsl:value-of select="total-pric
