<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink"
	xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'emarket' and @method = 'fast_purchase']">
		<xsl:apply-templates select="document('udata://emarket/fast_purchase')/udata"
			mode="basket_full" />

	</xsl:template>
 
	<!-- Render order/basket state -->
	<xsl:template match="udata" mode="basket_full">

			<form class="registration"  enctype="multipart/form-data" method="post"	action="/emarket/saveinfo/">
				   <input type="hidden" name="payment-id" value="{payment/items/item/@id}" /> 
					
                    <ul>
				    	<xsl:apply-templates select="document(concat('udata://data/getEditForm/', customer/object/@id))/udata/group/field" mode="form-fields"/>
					</ul>
					<xsl:choose>
					
					<xsl:when test="document('udata://emarket/fast_purchase')/udata/delivery/items/item"> 
					Выберете адрес доставки
					<ul>
					<xsl:apply-templates select="document('udata://emarket/fast_purchase')/udata/delivery/items/item" mode="delivery-item"></xsl:apply-templates>

					<li>
                                    
                                    <ol>
                                        
                                        <li class="heading"> Или введите новый адрес доставки</li>
                                        <li class="field">
                                        	<input type="radio" class="plain" name="delivery-address" value="new" id="new-adress-radio"/>
                                    	</li>
                                        
                                    </ol>
                                
                    </li>
					</ul>	
					<ul>
						<xsl:apply-templates select="document('udata://data/getCreateForm/5')/udata/group/field" mode="form-fields" />
                
					</ul>		
					</xsl:when>
					<xsl:otherwise>
					<ul>
					<xsl:apply-templates select="document('udata://data/getCreateForm/5')/udata/group/field" mode="form-fields" />

					<input type="hidden" name="delivery-address" value="new"/>
					</ul>
					</xsl:otherwise>
					</xsl:choose>
					
				

					<button class="button button_arrow button_red">Готово</button>
				
			</form>






	</xsl:template>


	<!-- Order items list -->
	<xsl:template match="items" mode="basket_full">

		<xsl:apply-templates select="item" mode="basket_full" />
	</xsl:template>


	<xsl:template match="item" mode="basket_full">
		<xsl:variable name="item_page"
			select="document(concat('upage://',page/@id))/udata" />
		<tr class="cart_product">
			<td class="cart_table_img">
				<xsl:call-template name="thumbing">
					<xsl:with-param name="source"
						select="$item_page/page/properties/group/property[@name='image']/value" />
					<xsl:with-param name="width" select="120" />
					<xsl:with-param name="height" select="120" />
				</xsl:call-template>
			</td>
			<td class="cart_table_name">
				<a href="{$item_page/page/@link}">
					<h3 class="cart_p_tit">
						<xsl:value-of
							select="$item_page/page/properties/group/property[@name='h1']/value" />
					</h3>
					<p class="cart_p_mass">
						<span>
							<xsl:value-of
								select="$item_page/page/properties/group/property[@name='ves_izdeliya']/value" />
						</span>
						кг
					</p>
				</a>
			</td>
			<td class="cart_table_price">
				<p class="cart_p_price">
					<span>
						<xsl:value-of select="price/actual" />
					</span>
					р.
				</p>
			</td>
			<td class="cart_table_num">
				<div class="t_num">
					<div class="t_num_m"
						onclick="var e = $(this).siblings('.amount');  site.basket.modify({@id}, parseInt(e.val())-1);"></div>
					<input class="amount" type="text" value="{amount}" maxlength="2" />
					<div class="t_num_p"
						onclick="var e = $(this).siblings('.amount');  site.basket.modify({@id}, parseInt(e.val())+1);"></div>
				</div>
			</td>
			<td class="cart_table_priceall">
				<p class="cart_p_price_all">
					<span>
						<xsl:value-of select="total-price/actual" />
					</span>
					р.
				</p>
			</td>
			<td class="cart_table_del">
				<a class="cart_p_delete del" href="/emarket/basket/remove/item/{@id}"></a>
			</td>
		</tr>

	</xsl:template>



	<!--адрес доставки -->


	<xsl:template match="customer|user" mode="customer">

		<xsl:apply-templates
			select="document(concat('udata://data/getEditForm/',object/@id))/udata//field"
			mode="customer_field">
		</xsl:apply-templates>

	</xsl:template>

	<xsl:template match="result[@method = 'purchase']">
		<div id="cart">

			<xsl:apply-templates select="document('udata://emarket/purchase')/udata" />
		</div>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'result'][@step = 'successful']">

		<h1>Спасибо за Ваш заказ!</h1>
		<div class="cart-table thank">
			<div class="text">
				Наш менеджер свяжется с Вами в ближайшее время!
   			</div>

			<xsl:variable name="order"
				select="document('udata://emarket/ordersList')/udata/items/item[last()]/@xlink:href" />
			<xsl:variable name="customer"
				select="document($order)/udata/object/properties/group/property[@name='customer_id']/value/item/@xlink:href" />
			<strong>
				Ваши данные:
			</strong>
			<p>
				Имя:
				<xsl:value-of
					select="document($customer)/udata/object/properties/group/property[@name='fname']/value"
					disable-output-escaping="no" />
			</p>
			<p>
				email:
				<xsl:value-of
					select="document($customer)/udata/object/properties/group/property[@name='e-mail']/value"
					disable-output-escaping="no" />
			</p>
			<p>
				Телефон:
				<xsl:value-of
					select="document($customer)/udata/object/properties/group/property[@name='phone']/value"
					disable-output-escaping="no" />
			</p>


<!-- 
			<strong>
				Вы заказали:
			</strong>
			<div id="cart_first">
				<table id="cart_products">
					<tr>
						<th class="cart_table_img">Фото</th>
						<th class="cart_table_name">Наименование</th>
						<th class="cart_table_price">Цена</th>
						<th class="cart_table_num">Количество</th>
						<th class="cart_table_priceall">Стоимость</th>

					</tr>
					<xsl:variable name="items" select="document($order)/udata/object/@id" />

					<xsl:apply-templates
						select="document(concat('udata://emarket/order/', $items))/udata/items/item"
						mode="order_info_del" />
					<xsl:apply-templates select="items" mode="basket_full" />


				</table>

			</div>


			<div class="buts">
				<a href="/katalog/" class="link">
					<em>вернуться в магазин</em>
				</a>
			</div> -->


		</div> 

	</xsl:template>
	<xsl:template match="item" mode="order_info_del">
		<xsl:variable name="item_page"
			select="document(concat('upage://',page/@id))/udata" />
		<tr class="cart_product">
			<td class="cart_table_img">
				<xsl:call-template name="thumbing">
					<xsl:with-param name="source"
						select="$item_page/page/properties/group/property[@name='image']/value" />
					<xsl:with-param name="width" select="120" />
					<xsl:with-param name="height" select="120" />
				</xsl:call-template>
			</td>
			<td class="cart_table_name">
				<a href="tovar.html">
					<h3 class="cart_p_tit">
						<xsl:value-of
							select="$item_page/page/properties/group/property[@name='h1']/value" />
					</h3>
					<p class="cart_p_mass">
						<span>
							<xsl:value-of
								select="$item_page/page/properties/group/property[@name='ves_izdeliya']/value" />
						</span>
						кг
					</p>
				</a>
			</td> 
			<td class="cart_table_price">
				<p class="cart_p_price">
					<span>
						<xsl:value-of select="price/actual" />
					</span>
					р.
				</p>
			</td>
			<td class="cart_table_num">
				<div class="t_num" style="padding-left: 75px;">
					<input style="border:1px #999 solid" class="amount" type="text"
						value="{amount}" maxlength="2" />
				</div>
			</td>
			<td class="cart_table_priceall">
				<p class="cart_p_price_all">
					<span>
						<xsl:value-of select="total-price/actual" />
					</span>
					р. 
				</p>
			</td>

		</tr>
	</xsl:template>
	<!-- заказы пользователя --> 
	<xsl:template match="udata[@module='emarket' and @method = 'ordersList']"
		mode="orderlist">
		<xsl:choose>
			<xsl:when test="items/item">
				<table class="zakaz">
					<tbody>
						<tr>
							<th>
								Дата заказа
								<br />
								Номер заказа
							</th>
							<th>Что заказали</th>
							<th>Сумма с доставкой</th>
						</tr>

						<xsl:apply-templates select="items/item" mode="order">
							<xsl:sort select="@name" data-type="text" order="descending" />
						</xsl:apply-templates>
					</tbody>
				</table>
			</xsl:when>
			<xsl:otherwise>
				Вы еще ничего не заказали!
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	<xsl:template match="item" mode="order">
		<tr>
			<xsl:apply-templates select="document(@xlink:href)"
				mode="order" />
		</tr>
	</xsl:template>
	<xsl:template match="udata" mode="order">
		<td>
			<xsl:value-of
				select="object/properties/group/property[@name='order_date']/value/@formatted-date"
				disable-output-escaping="no" />
			<br />
			<xsl:value-of select="object/@name" />

		</td>
		<td>
			<xsl:apply-templates
				select="document(concat('udata://emarket/order/', object/@id))/udata/items/item"
				mode="order_item" />
		</td>
		<td>
			<xsl:value-of
				select="object/properties/group/property[@name='total_price']/value"
				disable-output-escaping="no" />
			руб.
		</td>
	</xsl:template>
	<xsl:template match="item" mode="order_item">
		<xsl:variable name="item"
			select="document(concat('upage://', page/@id))/udata" />
		<table>
			<tr>
				<td>

					<xsl:call-template name="thumbing">
						<xsl:with-param name="source"
							select="$item/page/properties/group/property[@name='image']/value" />
						<xsl:with-param name="width" select="58" />
						<xsl:with-param name="height" select="81" />
					</xsl:call-template>
				</td>
				<td>
					<div>
						<a href="{page/@link}">
							<h3 class="cart_p_tit">
								<xsl:value-of select="@name" />
							</h3>

							<p class="cart_p_mass">
								<span>
									<xsl:value-of
										select="$item/page/properties/group/property[@name='ves_izdeliya']/value" />
								</span>
								кг
							</p>
						</a>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>





	<xsl:template match="purchasing[@stage = 'payment'][@step = 'choose']">
		<h4>
			<xsl:text>Тип платежа:</xsl:text>
		</h4>

		<form id="payment_choose" method="post" action="do/">
			<script>
				<![CDATA[
					window.paymentId = null;
					jQuery('#payment_choose').submit(function(){
						if (window.paymentId) {
							var checkPaymentReceipt = function(id) {
								if (jQuery(':radio:checked','#payment_choose').attr('class') == 'receipt') {
									var url = window.location.href;
									var win = window.open("", "_blank", "width=710,height=620,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no");
									win.document.write("<html><head><" + "script" + ">location.href = '" + url + "do/?payment-id=" + id + "'</" + "script" + "></head><body></body></html>");
									win.focus();
									return false;
								}
							}
							return checkPaymentReceipt(window.paymentId);
						}
						else return true;
					});
				]]>
			</script>

			<xsl:apply-templates select="items/item" mode="payment" />

			<div>
				<input type="submit" value="Дальше" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="item" mode="payment">
		<div>
			<label>
				<xsl:if test="(position() = 1) and (@type-name = 'receipt')">
					<script>
						window.paymentId =
						<xsl:value-of select="@id" />
						;
					</script>
				</xsl:if>
				<input type="radio" name="payment-id" class="{@type-name}"
					value="{@id}">
					<xsl:attribute name="onclick">
						<xsl:text>this.form.action = </xsl:text>
						<xsl:choose>
							<xsl:when test="@type-name != 'receipt'"><xsl:text>'do/';</xsl:text></xsl:when>
							<xsl:otherwise><xsl:text>'/emarket/ordersList/'; window.paymentId = '</xsl:text><xsl:value-of
						select="@id" /><xsl:text>';</xsl:text></xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:if test="position() = 1">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</input>
				<xsl:value-of select="@name" />
			</label>
		</div>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'chronopay']">
		<form method="post" action="{formAction}">
			<input type="hidden" name="product_id" value="{product_id}" />
			<input type="hidden" name="product_name" value="{product_name}" />
			<input type="hidden" name="product_price" value="{product_price}" />
			<input type="hidden" name="language" value="{language}" />
			<input type="hidden" name="cs1" value="{cs1}" />
			<input type="hidden" name="cs2" value="{cs2}" />
			<input type="hidden" name="cs3" value="{cs3}" />
			<input type="hidden" name="cb_type" value="{cb_type}" />
			<input type="hidden" name="cb_url" value="{cb_url}" />
			<input type="hidden" name="decline_url" value="{decline_url}" />
			<input type="hidden" name="sign" value="{sign}" />

			<div>
				<xsl:text>Направляем на Chronopay.</xsl:text>
			</div>

			<div>
				<input type="submit" value="Оплатить" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'yandex']">
		<form action="{formAction}" method="post">
			<input type="hidden" name="shopId" value="{shopId}" />
			<input type="hidden" name="Sum" value="{Sum}" />
			<input type="hidden" name="BankId" value="{BankId}" />
			<input type="hidden" name="scid" value="{scid}" />
			<input type="hidden" name="CustomerNumber" value="{CustomerNumber}" />
			<input type="hidden" name="order-id" value="{orderId}" />

			<div>
				<xsl:text>Направляем на Yandex.</xsl:text>
			</div>

			<div>
				<input type="submit" value="Оплатить" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'payonline']">
		<form action="{formAction}" method="post">

			<input type="hidden" name="MerchantId" value="{MerchantId}" />
			<input type="hidden" name="OrderId" value="{OrderId}" />
			<input type="hidden" name="Currency" value="{Currency}" />
			<input type="hidden" name="SecurityKey" value="{SecurityKey}" />
			<input type="hidden" name="ReturnUrl" value="{ReturnUrl}" />
			<!-- NB! This field should exist for proper system working -->
			<input type="hidden" name="order-id" value="{orderId}" />
			<input type="hidden" name="Amount" value="{Amount}" />

			<div>
				<xsl:text>Направляем на PayOnline.</xsl:text>
			</div>

			<div>
				<input type="submit" value="Оплатить" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'robox']">
		<div id="cart">
			<h1>Оплата</h1>
			<form action="{formAction}" class="paysyst" method="post">
				<input type="hidden" name="MrchLogin" value="{MrchLogin}" />
				<input type="hidden" name="OutSum" value="{OutSum}" />
				<input type="hidden" name="InvId" value="{InvId}" />
				<input type="hidden" name="Desc" value="{Desc}" />
				<input type="hidden" name="SignatureValue" value="{SignatureValue}" />
				<input type="hidden" name="IncCurrLabel" value="{IncCurrLabel}" />
				<input type="hidden" name="Culture" value="{Culture}" />
				<input type="hidden" name="shp_orderId" value="{shp_orderId}" />

				<div>
					<xsl:text>После нажатия кнопки Оплатить Вы будете перемещены на сервис Robokassa, где сможете оплатить покупку удобным для Вас способом</xsl:text>
				</div>

				<div>
					<button class="pay"> Оплатить</button>
				</div>
			</form>
		</div>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'rbk']">
		<form action="{formAction}" method="post">
			<input type="hidden" name="eshopId" value="{eshopId}" />
			<input type="hidden" name="orderId" value="{orderId}" />
			<input type="hidden" name="recipientAmount" value="{recipientAmount}" />
			<input type="hidden" name="recipientCurrency" value="{recipientCurrency}" />
			<input type="hidden" name="version" value="{version}" />

			<div>
				<xsl:text>Направляем на RBK Money.</xsl:text>
			</div>

			<div>
				<input type="submit" value="Оплатить" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'payanyway']">
		<form action="{formAction}" method="post">
			<input type="hidden" name="MNT_ID" value="{mntId}" />
			<input type="hidden" name="MNT_TRANSACTION_ID" value="{mnTransactionId}" />
			<input type="hidden" name="MNT_CURRENCY_CODE" value="{mntCurrencyCode}" />
			<input type="hidden" name="MNT_AMOUNT" value="{mntAmount}" />
			<input type="hidden" name="MNT_TEST_MODE" value="{mntTestMode}" />
			<input type="hidden" name="MNT_SIGNATURE" value="{mntSignature}" />
			<input type="hidden" name="MNT_SUCCESS_URL" value="{mntSuccessUrl}" />
			<input type="hidden" name="MNT_FAIL_URL" value="{mntFailUrl}" />

			<div>
				<xsl:text>Направляем на PayAnyWay.</xsl:text>
			</div>

			<div>
				<input type="submit" value="Оплатить" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'dengionline']">
		<form action="{formAction}" method="post">

			<input type="hidden" name="project" value="{project}" />
			<input type="hidden" name="amount" value="{amount}" />
			<input type="hidden" name="nickname" value="{order_id}" />
			<input type="hidden" name="source" value="{source}" />
			<input type="hidden" name="order_id" value="{order_id}" />
			<input type="hidden" name="comment" value="{comment}" />
			<input type="hidden" name="paymentCurrency" value="{paymentCurrency}" />

			<xsl:apply-templates select="items/item" mode="payment-modes" />

			<div>
				<input type="submit" value="Оплатить" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="item" mode="payment-modes">
		<label>
			<input type="radio" name="mode_type" value="{id}" />
			<xsl:value-of select="label" />
		</label>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'invoice']"
		xmlns:xlink="http://www.w3.org/TR/xlink">
		<form target="_blank" id="invoice" method="post" action="do">
			<xsl:apply-templates select="items" mode="legal-person" />
			<div>
				<input type="submit" value="Выписать счет" class="button big" />
			</div>
		</form>
		<script>
			jQuery('#invoice').submit(function(){
			var input =
			jQuery('input:radio:checked', this);
			if (typeof input.val() ==
			'undefined' || input.val() == 'new') {
			if (typeof input.val() ==
			'undefined') {
			jQuery('input:radio[value=new]',
			this).attr('checked','checked');
			}
			return site.forms.data.check(this);
			}
			});
		</script>
	</xsl:template>

	<xsl:template match="items" mode="legal-person"
		xmlns:xlink="http://www.w3.org/TR/xlink">
		<input type="hidden" name="legal-person" value="new" />
		<xsl:apply-templates select="document(../@xlink:href)//field"
			mode="form" />
	</xsl:template>

	<xsl:template match="items[count(item) &gt; 0]" mode="legal-person"
		xmlns:xlink="http://www.w3.org/TR/xlink">
		<h4>
			<xsl:text>Выберете:</xsl:text>
		</h4>
		<xsl:apply-templates select="item" mode="legal-person" />

		<div>
			<label>
				<input type="radio" name="legal-person" value="new" />
				<xsl:text>Кто</xsl:text>
			</label>
		</div>

		<div id="new-legal-person">
			<xsl:apply-templates select="document(../@xlink:href)//field"
				mode="form" />
		</div>

	</xsl:template>

	<xsl:template match="item" mode="legal-person"
		xmlns:xlink="http://www.w3.org/TR/xlink">
		<div class="form_element">
			<label>
				<input type="radio" name="legal-person" value="{@id}">
					<xsl:if test="position() = 1">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</input>
				<xsl:value-of select="@name" />
			</label>
		</div>
	</xsl:template>
  
	<xsl:template match="item" mode="delivery-item">
		<li>
                                    
                                    <ol>
                                        
                                        <li class="heading"><xsl:value-of select="document(concat('uobject://', @id))/udata/object/properties/group/property[@name='city']/value" />, <xsl:value-of select="document(concat('uobject://', @id))/udata/object/properties/group/property[@name='street']/value" /> <xsl:value-of select="document(concat('uobject://', @id))/udata/object/properties/group/property[@name='house']/value" /> кв.<xsl:value-of select="document(concat('uobject://', @id))/udata/object/properties/group/property[@name='flat']/value" /></li>
                                        <li class="field"><input  class="plain" type="radio" name="delivery-address" value="{@id}" />    <input type="text" value="{$user-info/udata/object/properties/group/property[@name='login']/value}"  name="login" /></li>
                                        
                                    </ol>
                                
                                </li>
        
    
	</xsl:template>
</xsl:stylesheet>