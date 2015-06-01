<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink"
	xmlns:umi="http://www.umi-cms.ru/TR/umi">


	<xsl:template match="result[@method = 'purchasing_one_step']">
		<xsl:variable name="onestep" select="document('udata://emarket/purchasing_one_step/')/udata" />
		<xsl:variable name="cart" select="document('udata://emarket/cart')/udata" />
		<xsl:call-template name="checkout_cart" />
		<h1>Оформление заказа</h1>
            <section class="cartpage_sec">
                <article>
                    <span class="help_checkout">
                    Вы собираетесь купить <span><xsl:value-of select="$cart/summary/amount"  /> шт товара</span> на сумму 
                    <span>
                    	<xsl:value-of select="$cart/summary/price/actual"  /></span>рублей
                    </span>



                    <ul class="tabsch">
                    	<xsl:if test="$onestep/onestep/customer">
                        	<li class="active_chbtn">
                            <!--                           name="tab1" - необходим для переключения вкладок  $('#' + $(this).attr('name')).fadeIn();-->
                        	    <a name="tab1" href="javascript://">Информация о покупателе</a>
                       		</li>
                    	</xsl:if>
                        <li>
                        	<xsl:if test="not($onestep/onestep/customer)">
                        		<xsl:attribute name="class">
                        			active_chbtn
                        		</xsl:attribute>
                        	</xsl:if>
                            <!--                           name="tab2" - необходим для переключения вкладок  $('#' + $(this).attr('name')).fadeIn();-->
                            <a name="tab2" href="javascript://">Способ доставки</a>
                        </li>
                         <li>
                            <!--                           name="tab2" - необходим для переключения вкладок  $('#' + $(this).attr('name')).fadeIn();-->
                            <a name="tab3" href="javascript://">Способ оплаты</a>
                        </li>
                    </ul>

                    <div class="ch_formblock">
                       <!--                            ошибки формы заказаз-->
 <xsl:apply-templates select="$errors" />



                        <form id="payment_choose" style="text-align: left;" method="POST" action="/emarket/saveInfo">
                        	<!-- <script>
						<![CDATA[
							window.paymentId = null;
							jQuery('#payment_choose').submit(function(){
							
								if (window.paymentId) {
									var checkPaymentReceipt = function(id) {
										if (jQuery('.receipt').attr('checked') == 'checked') {
											var url = "/emarket/saveInfo";
											var win = window.open("", "_blank", "width=710,height=620,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no");
											win.document.write("<html><head><" + "script" + ">location.href = '" + url + "?payment-id=" + id + "'</" + "script" + "></head><body></body></html>");
											win.focus();
											return false;
										}
									}
									return checkPaymentReceipt(window.paymentId);
								}
								else return false;
							});
						]]>
					</script> -->
                        	
			
			

						<xsl:if test="$onestep/onestep/customer">
                            <span id="tab1">

                            <fieldset class="personalinfo">

                            	<xsl:apply-templates select="$onestep/onestep/customer/group" mode="onestep_group" />
                                
                            </fieldset>	
                           
                           </span>
                        </xsl:if>







                            <span id="tab2">
                            	<xsl:if test="$onestep/onestep/customer">
                            		<xsl:attribute name="style">display:none;</xsl:attribute>
	                            </xsl:if>
	                         <div class="chkbx_filt">


								
								<xsl:apply-templates select="$onestep/onestep/delivery_choose" mode="delivery_choose" />
									
                                

                            </div>

                            

                            <fieldset class="commentinfo">
                            	
                            	<xsl:apply-templates select="$onestep/onestep/delivery/items"   mode="adress_choose"/>
                            
                            </fieldset>

                            <fieldset class="commentinfo">
                                <label for="comments">Комментарии к заказу</label>
                                <textarea id="comments" placeholder="Ваш комментарий"></textarea>
                            </fieldset>

                            <p class="address_samov">

								<b>Укажите пункт самовывоза, где Вы хотели бы забрать товар</b>&br;
                            	<xsl:apply-templates select="$onestep/onestep/delivery_choose/items/item" mode="option_choose_options" />
 
                                

                            </p>
	                                	
                            </span>

                             <span id="tab3" style="display:none;">
                            

                            
                                <fieldset class="paymentvariable">
                                   
								<xsl:apply-templates select="$onestep/onestep/payment/items" mode="payment" />
                                    
                    
                                
                                
                               
                                
                                
                                </fieldset>


                            

                            

                            </span>

                            <div class="clearfix"></div>
                            <p class="nexting_btn">
                              
                               <input style="display:none;" class="checkout_btnxt" type="submit" name="submit" value="Продолжить" />
                               <a class="checkout_btnxt disabled" type="submit" href="javascript://">Продолжить</a>
                               <span></span>
                           </p>
                            <div class="clearfix"></div>
                        </form>
                    </div>



                </article>

            </section>

            <aside>
                <div class="filter_block">
                    <div class="filter_hdr">
                        товары в корзине
                    </div>
                    <xsl:apply-templates select="$cart/items/item" mode="purchase_items" />
				</div>
            </aside>

            <div class="clearfix"></div>
      





		<!-- <h1 class="mainheader"><img alt="" src="/templates/tokanet.ru//images/h1_cart_icon.png"/><xsl:value-of select="@header" /> </h1>
		<div class="mainheaderend"></div>
		<div class="clear"></div>

		<xsl:apply-templates select="$errors" /> -->

<!--форма оформления заказа-->




	</xsl:template>


	<xsl:template match="items" mode="adress_choose">
		<div class="line">
				<strong>Адрес доставки</strong>
		</div>
		<input id="delivery-address-new" type="hidden" class="plain" name="delivery-address" value="" />

		<xsl:apply-templates select="document(../@xlink:href)//field"/>
	</xsl:template>

	<xsl:template match="items[count(item) &gt; 0]" mode="adress_choose">
		<div class="line">
				<strong>Адрес доставки</strong>
		</div>
		<xsl:apply-templates select="item" mode="adress_choose" />

		<div class="form_element">
			
			<input onclick="$('#new-legal-person').show(), $('div#new-legal-person div.box input').attr('required','required')" type="radio" class="css-checkbox2" name="delivery-address" id="18469846543222233548984" value="new" />
			<label for="18469846543222233548984" class="css-label2">
				<xsl:text>Новый адрес</xsl:text>
			</label>
		</div>

		<div id="new-legal-person" style="display:none;">
			<xsl:apply-templates select="document(../@xlink:href)//field"/>
		</div>

	</xsl:template>

	<xsl:template match="item" mode="adress_choose"  xmlns:xlink="http://www.w3.org/TR/xlink">
		<div class="form_element">

				<input onclick="$('div#new-legal-person div.box input').removeAttr('required'), $('#new-legal-person').hide()" type="radio"  class="css-checkbox2" name="delivery-address" id="{@id}" value="{@id}">
					<xsl:if test="position() = 1">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</input>
            <label for="{@id}" class="css-label2">
				<xsl:apply-templates select="document(concat('uobject://', @id))//property" mode="delivery-address" />
			</label>
		</div>
	</xsl:template>

	<xsl:template match="property" mode="delivery-address">
		<xsl:value-of select="value" />
		<xsl:text>, </xsl:text>
	</xsl:template>
	
	<xsl:template match="property[@type = 'relation']" mode="delivery-address">
		<xsl:value-of select="value/item/@name" />
		<xsl:text>, </xsl:text>
	</xsl:template>
	
	<xsl:template match="property[position() = last()]" mode="delivery-address">
		<xsl:value-of select="value" />
	</xsl:template>
 

	

	<xsl:template match="group" mode="onestep_group"> 
		
		<div class="line">
			<strong><xsl:value-of select="@title"/></strong>
		</div>
		<xsl:apply-templates select="field"/>

	</xsl:template>

	<!-- <xsl:template match="field">
		<div>
			<span class="col">
				<xsl:value-of select="@title" />
			</span>
			<input type="text" name="{@input_name}" value="" />
			
		</div>
	</xsl:template> -->
	<xsl:template match="delivery_choose" mode="delivery_choose">
		<div class="line">
			<strong>Способ доставки</strong>
		</div>
				<xsl:if test="items/item[@type-guid='emarket-delivery-783']">
					<input checked="checked" type="radio" id="radio34011" class="css-checkbox2"/>
					<label id="confirm_optn" for="radio34011" class="css-label2 emarket-delivery-783">Самовывоз</label><br/>
				</xsl:if>
				<xsl:apply-templates select="items/item" mode="option_choose" />
			
			
		
	</xsl:template>
	<xsl:template match="items" mode="payment">
		<div class="line">
			<strong>Способ оплаты</strong>
		</div>
		<div class="box">
			<!-- <span class="col">Выберите наиболее удобный способ оплаты заказа</span> -->
			
				<xsl:apply-templates select="item" mode="option_payment" />
			
			
		</div>
	</xsl:template>

	<xsl:template match="item" mode="options">
		<option value="{@id}">
			<xsl:value-of select="." />
		</option>
	</xsl:template>

	<xsl:template match="item" mode="option_choose">
		<xsl:variable name="delivertity" select="document(concat('uobject://', @id))/udata/object//property[@name='region']/value/item/@id"></xsl:variable>
		<xsl:if test="$delivertity = $system/@object-id">
		
		<input type="radio" value="{@id}" name="delivery-id" id="radio{@id}" class="css-checkbox2 {@type-guid} " />
        <label for="radio{@id}" class="css-label2 {@type-guid} " ><xsl:value-of select="@name" /></label>
		<br/>
		</xsl:if>
	
	</xsl:template>


	<xsl:template match="item[@type-guid='emarket-delivery-783']" mode="option_choose">
	</xsl:template>
		
			<xsl:template match="item[@type-guid='emarket-delivery-783']" mode="option_choose_options">

			<xsl:variable name="delivertity" select="document(concat('uobject://', @id))/udata/object//property[@name='region']/value/item/@id"></xsl:variable>
			<xsl:if test="$delivertity = $system/@object-id">
				<input type="radio" value="{@id}" name="delivery-id" id="radio{@id}" class="css-checkbox2">
				<xsl:if test="position()=1">
					<xsl:attribute name="checked">checked</xsl:attribute>
					<xsl:attribute name="class">css-checkbox2 checkedbox</xsl:attribute>
				</xsl:if>
				</input>



				<label for="radio{@id}" class="css-label2 {@type-guid} ">
					<xsl:value-of select="@name" />
				</label>
				<br/>
			</xsl:if>

		</xsl:template>







	<xsl:template match="item" mode="option_payment">
        
					<!-- <xsl:if test="(position() = 1) and (@type-name = 'receipt')">
						<script>
							window.paymentId = <xsl:value-of select="@id" />;
						</script>
					</xsl:if> -->
				<input type="radio" name="payment-id" class="{@type-name} css-checkbox2" value="{@id}" id="{@id}" >
					<!-- <xsl:attribute name="onclick">
						<xsl:text>this.form.target = </xsl:text>
						<xsl:choose>
							<xsl:when test="@type-name != 'receipt'">
								'/emarket/saveInfo';
							</xsl:when>
							<xsl:otherwise>'/emarket/ordersList/'; window.paymentId = '<xsl:value-of select="@id" />';</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute> -->
					<xsl:if test="@active = 'active'">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</input>
        <label for="{@id}" class="css-label2 radGroup2"><xsl:value-of select="@name" /></label>

        
	</xsl:template>








	


	<!-- Кабинет пользователя -->
	<xsl:template match="udata[@module='emarket' and @method = 'ordersList']"
		mode="past_orders">
		<form action="#">
			<fieldset class="forma" id="tab2">
				<table class="zakaz">
					<tbody>
						<tr>
							<th>Дата заказа</th>
							<th>Что заказали</th>
							<th>Сумма с доставкой</th>
						</tr>

						<xsl:apply-templates select="items/item" mode="order" />
					</tbody>
				</table>
			</fieldset>
		</form>
	</xsl:template>
	



	<!-- Purchasing -->
	<xsl:template match="result[@method = 'purchase']">
		<xsl:apply-templates select="document('udata://emarket/purchase')/udata"
			mode="purch" />
	</xsl:template>

	<xsl:template match="udata" mode="purch">
		
			<xsl:apply-templates select="purchasing" mode="purch" />
	
	</xsl:template>
	<xsl:template match="purchasing[@stage='required'][@step='personal']"
		mode="purch">
		<form action="do/">
			<fieldset class="forma" id="tab1">
				<div class="block">
					<h4>Контактные данные</h4>
					<div class="box">
						<label for="l7">
							Ваше имя и фамилия
							<em>*</em>
							:
						</label>
						<input id="l7" type="text" value="" class="input" />
						<span class="col">Чтобы мы могли персонально к вам обратиться</span>
					</div>
					<div class="box pos">
						<label for="l8">
							Контактный телефон
							<em>*</em>
							:
						</label>
						<input id="l8" type="text" value="8-978-876-34-55" class="input red" />
						<span class="col">Чтобы мы могли персонально к вам обратиться</span>
						<span class="format">
							<em class="arrow"></em>
							Формат телефона: (***) *******
						</span>
					</div>
					<div class="box">
						<label for="l9">
							Контактный e-mail
							<em>*</em>
							:
						</label>
						<input id="l9" type="text" value="" class="input" />
						<span class="col">Чтобы мы могли отправлять вам сообщения
							касающиеся вашего заказа</span>
					</div>
					<div class="bt">
						<a href="#" class="link">
							вернуться
							<br />
							в корзину
						</a>
						<a href="#" class="but">продолжить</a>
					</div>
				</div>
				<div class="block">
					<h4>
						Вход для
						<br />
						постоянных клиентов
					</h4>
					<input type="text" value="E-mail" class="input" />
					<input type="password" value="Пароль" class="input" />
					<input type="submit" class="submit" value="ВОЙТИ" />
				</div>
			</fieldset>
		</form>
	</xsl:template>
	<xsl:template match="purchasing[@stage='delivery']" mode="purch">
		<form action="do/">
			<fieldset class="forma" id="tab2">
				<h4>Данные для доставки</h4>
				<div class="box">
					<label for="l3">Город:</label>
					<select id="l3">
						<option>Санкт-Петербург</option>
					</select>
					<span class="col">От этого зависит доступность способов доставки и
						ее стоимость</span>
				</div>
				<xsl:apply-templates select="delivery_choose"
					mode="delivery_choose" />
				<xsl:apply-templates select="document(@xlink:href)/udata/group"
					mode="address" />
				<div class="line">
					<dl>
						<dt>Общая стоимость заказа с учетом доставки:</dt>
						<dd>11 070 руб.</dd>
					</dl>
					<div class="bt">
						<a href="#" class="link">вернуться в корзину</a>
						<input type="submit" class="submit" value="Подтвердить заказ" />
					</div>
				</div>
			</fieldset>
		</form>
	</xsl:template>

	<xsl:template match="group[@name='common']" mode="address">
		<input checked="checked" name="delivery-address" value="new"
			type="radio" />
		<div class="line">
			<xsl:apply-templates select="field" />

			<dl>
				<dt>Стоимость доставки:</dt>
				<dd class="d2">200 руб.</dd>
			</dl>
			<span class="red">
				Доставка оплачивается вне зависимости от того,
				<br />
				совершаете ли вы покупку или нет
			</span>
		</div>

	</xsl:template>

	<xsl:template match="purchasing[@stage = 'result'][@step = 'successful']"  mode="purch">
		<xsl:variable name="order_id" select="document('udata://emarket/ordersList')/udata/items/item[last()]/@id" />
		<xsl:variable name="order_info" select="document(concat('udata://emarket/order/', $order_id))/udata" />
		<!-- Параметры для метрики.. -->
		<script type="text/javascript">
			var yaParams = {
				order_id: "<xsl:value-of select="$order_id" />",
				order_price: "<xsl:value-of select="$order_info/summary/price/actual" />", 
				currency: "RUR",
				exchange_rate: 1,
				goods: 
				   [
				   	<xsl:apply-templates select="$order_info/items/item" mode="order_info_metrika" />
				   ]
			};
		</script>
		<!-- Параметры для метрики -->

		<h1>Спасибо за оформление заказа</h1>
            <p>Уважаемый 
            	<b>
            		<xsl:value-of select="$order_info/customer/object//property[@name='lname']/value" disable-output-escaping="no" /> 
            		<xsl:value-of select="$order_info/customer/object//property[@name='fname']/value" disable-output-escaping="no" />
            	</b>!&br;
            	Спасибо за то, что воспользовались услугами нашего магазина!
        		&br;Ваш заказоформлен под номером 
        		<b>
        			№ <xsl:value-of select="$order_info/number" disable-output-escaping="yes" />
        		</b>
                
                &br;В ближайшее время с Вами свяжутся наши менеджеры, что бы уточнить данные о вашем заказе.&br;Вы заказали:
            </p>
            <section class="cartpage_sec">
                <article>
                    <table>
                        <tr>
                            <th class="naming">Название</th>
                            <th class="pricing">Цена</th>
                            <th class="counting">Колличество</th>
                            <th>Сумма</th>
                            <th></th>
                        </tr>
                        <xsl:apply-templates select="$order_info/items/item" mode="order_info_del" />
                        
                    </table>
                    <div class="cart_itogo">
                        <div>Итого: 
                        	<span>
                        		<xsl:value-of select="$order_info/summary/price/actual" disable-output-escaping="yes" /> руб.
                        		
<!--                        		<xsl:value-of select="$order_info/summary/price/@suffix" disable-output-escaping="yes" />-->
                        		
                        	</span>
                        </div>
                    </div>
                </article>
                <p>
                
                		<!-- Мы будем доставлять товар по адресу: 
                		<b>Санкт-Петербург, ул. ленинградская, д. 37/2, кв,17</b>
                    &br; -->
                    Для вашего удобства мы отправили Вам инфомацию о заказе на Ваш электронный адрес:&br;
                    <b><xsl:value-of select="$order_info/customer/object//property[@name='e-mail']/value" disable-output-escaping="no" />  </b>
                </p>
            </section>
            <aside></aside>
            <div class="clearfix"></div>


		
	</xsl:template>

<xsl:template match="item" mode="order_info_metrika">
	<xsl:variable name="item_page" select="document(concat('upage://',page/@id))/udata" />
	{
		id: "<xsl:value-of select="@id" />", 
		name: "<xsl:value-of select="$item_page/page/properties/group/property[@name='h1']/value" />", 
		price: <xsl:value-of select="price/actual" />, 
		quantity: <xsl:value-of select="amount" />
	}
	<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>

 	<xsl:template match="item" mode="order_info_del">
		<xsl:variable name="item_page"
			select="document(concat('upage://',page/@id))/udata" />
						<tr class="tab_row">
                            <td class="main_td">
                                <div class="maingoodinfo">
                                	<a href="{page/@link}">
                                		<span>
                                			<xsl:call-template name="thumbing">
												<xsl:with-param name="source" select="$item_page/page/properties/group/property[@name='foto_1']/value" />
												<xsl:with-param name="width" select="86" />
												<xsl:with-param name="height" select="86" />
											</xsl:call-template>
                                		</span>
                                	</a>
						
                                    <h4>
                                    	<a href="{page/@link}">  
                                    		<xsl:value-of select="$item_page/page/properties/group/property[@name='h1']/value" />  
                                    	</a>
                                    </h4>
                                    <span class="articul_block">
                                    	Артикул:  
                                    	<a href="#">
                                    		<xsl:value-of select="$item_page/page/properties/group/property[@name='artikul']/value" />
                                    	</a>
                                    </span>
                <!-- <xsl:choose>
					<xsl:when test="$item_page/page/properties/group/property[@name='common_quantity']/value&gt;0">
						
							<span class="instok">в наличии</span>
							
					</xsl:when>

					<xsl:otherwise>
						
							<span class="not_instok">отсутствует</span>
							
					</xsl:otherwise>
				</xsl:choose> -->
                                    
                                    <div class="clearfix"></div>
                                </div>
                            </td>
                            <td class="price_td">
                            	<xsl:value-of select="price/actual"/> руб.
<!--                            	<xsl:value-of select="price/@suffix"/>-->
                            </td>
                            <td class="count_td">
                            	<xsl:value-of select="amount"/>
                            </td>
                            <td class="summa_td">
                            	<xsl:value-of select="ceiling(total-price/actual)"/> руб.
<!--                            	<xsl:value-of select="price/@suffix"/>-->
                            </td>
                            <td class="floating_td"></td>
                            <div class="clearfix"></div>
                        </tr>

		
	</xsl:template>


	<!-- <xsl:template match="purchasing[@stage = 'payment'][@step = 'choose']" mode="purch">
		<xsl:apply-templates select="//steps" />
		<form id="payment_choose" method="post">
			<xsl:attribute name="action"><xsl:value-of select="submit_url" /></xsl:attribute>
			<h4>
				<xsl:text>&payment-type;:</xsl:text>
			</h4>
			<script>
				<![CDATA[
					window.paymentId = null;
					jQuery('#payment_choose').submit(function(){
						if (window.paymentId) {
							var checkPaymentReceipt = function(id) {
								if (jQuery(':radio:checked','#payment_choose').attr('class') == 'receipt' or jQuery(':radio:checked','#payment_choose').attr('class') == 'invoice') {
									var url = "]]><xsl:value-of select="submit_url" /><![CDATA[";
									var win = window.open("", "_blank", "width=710,height=620,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no");
									win.document.write("<html><head><" + "script" + ">location.href = '" + url + "?payment-id=" + id + "'</" + "script" + "></head><body></body></html>");
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
				<input type="submit" value="&continue;" class="button big" />
			</div>
		</form>
	</xsl:template> -->



	<xsl:template match="purchasing[@stage = 'payment'][@step = 'yandex30']" mode="purch">
		<form id="form_yandex30" action="{formAction}" method="post">
			<input type="hidden" name="shopId" value="{shopId}" />
			<input type="hidden" name="Sum" value="{Sum}" />
			<input type="hidden" name="BankId" value="{BankId}" />
			<input type="hidden" name="scid" value="{scid}" />
			<input type="hidden" name="CustomerNumber" value="{CustomerNumber}" />
			<input type="hidden" name="order-id" value="{orderId}" />
			<input type="hidden" name="PaymentType" value="" />
			<input type="hidden" name="PaymentTypeProvider" value="" />
			<div class="inline">
				<xsl:apply-templates select="items/item" mode="payment-modes-yandex30" />
			</div>
			<div>
				<xsl:text>&payment-redirect-text; Yandex.</xsl:text>
			</div>
			<div>
				<input type="submit" value="Оплатить" class="button big" />
			</div>
		</form>
		<script>
			var elements = document.getElementById('form_yandex30').elements;
			elements.mode_type.value = '';
			function change(type, subtype) {
				elements.PaymentType.value = type;
				elements.PaymentTypeProvider.value = subtype;
			}
		</script>
	</xsl:template>

	<xsl:template match="item" mode="payment-modes-yandex30">
		<label><input type="radio" name="mode_type" value="{id}" onChange="javascript:change('{type}', '{subtype}');"/><xsl:value-of select="label"/></label>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'acquiropay']" mode="purch">
		<form method="post" action="{formAction}">
			<input type="hidden" name="product_id" value="{product_id}" />
			<input type="hidden" name="amount" value="{amount}" />
			<input type="hidden" name="language" value="{language}" />
			<input type="hidden" name="cf" value="{order_id}" />
			<input type="hidden" name="ok_url" value="{ok_url}" />
			<input type="hidden" name="cb_url" value="{cb_url}" />
			<input type="hidden" name="ko_url" value="{ko_url}" />
			<input type="hidden" name="token" value="{token}" />
			<div>
				<xsl:text>&payment-redirect-text; AcquiroPay.</xsl:text>
			</div>
			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
		<xsl:call-template name="form-send" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'chronopay']" mode="purch">
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
				<xsl:text>&payment-redirect-text; Chronopay.</xsl:text>
			</div>

			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
		<xsl:call-template name="form-send" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'yandex']" mode="purch">
		<form action="{formAction}" method="post">
			<input type="hidden" name="shopId"	value="{shopId}" />
			<input type="hidden" name="Sum"		value="{Sum}" />
			<input type="hidden" name="BankId"	value="{BankId}" />
			<input type="hidden" name="scid"	value="{scid}" />
			<input type="hidden" name="CustomerNumber" value="{CustomerNumber}" />
			<input type="hidden" name="order-id" value="{orderId}" />

			<div>
				<xsl:text>&payment-redirect-text; Yandex.</xsl:text>
			</div>

			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
		<xsl:call-template name="form-send" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'payonline']" mode="purch">
		<form action="{formAction}" method="post">

			<input type="hidden" name="MerchantId" 	value="{MerchantId}" />
			<input type="hidden" name="OrderId" 	value="{OrderId}" />
			<input type="hidden" name="Currency" 	value="{Currency}" />
			<input type="hidden" name="SecurityKey" value="{SecurityKey}" />
			<input type="hidden" name="ReturnUrl" 	value="{ReturnUrl}" />
			<!-- NB! This field should exist for proper system working -->
			<input type="hidden" name="order-id"    value="{orderId}" />
			<input type="hidden" name="Amount" value="{Amount}" />

			<div>
				<xsl:text>&payment-redirect-text; PayOnline.</xsl:text>
			</div>

			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
		<xsl:call-template name="form-send" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'robox']" mode="purch">
		<form action="{formAction}" method="post">
			<input type="hidden" name="MrchLogin" value="{MrchLogin}" />
			<input type="hidden" name="OutSum"	  value="{OutSum}" />
			<input type="hidden" name="InvId"	  value="{InvId}" />
			<input type="hidden" name="Desc"	  value="{Desc}" />
			<input type="hidden" name="SignatureValue" value="{SignatureValue}" />
			<input type="hidden" name="IncCurrLabel"   value="{IncCurrLabel}" />
			<input type="hidden" name="Culture"   value="{Culture}" />
			<input type="hidden" name="shp_orderId" value="{shp_orderId}" />

			<div>
				<xsl:text>&payment-redirect-text; Robox.</xsl:text>
			</div>

			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
		<xsl:call-template name="form-send" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'rbk']" mode="purch">
		<form action="{formAction}" method="post">
			<input type="hidden" name="eshopId" value="{eshopId}" />
			<input type="hidden" name="orderId"	value="{orderId}" />
			<input type="hidden" name="recipientAmount"	value="{recipientAmount}" />
			<input type="hidden" name="recipientCurrency" value="{recipientCurrency}" />
			<input type="hidden" name="version" value="{version}" />

			<div>
				<xsl:text>&payment-redirect-text; RBK Money.</xsl:text>
			</div>

			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
		<xsl:call-template name="form-send" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'kupivkredit'][@action = 'widget']" mode="purch">
		<xsl:choose>
			<xsl:when test="./@test-mode">
				<script src="https://kupivkredit-test-fe.tcsbank.ru/widget/vkredit.js"></script>
			</xsl:when>
			<xsl:otherwise>
				<script src="https://www.kupivkredit.ru/widget/vkredit.js"></script>
			</xsl:otherwise>
		</xsl:choose>
		<script>
			jQuery(document).ready(function() {
			<![CDATA[
			function widgetOpen(order, sig, price) {
				vKredit = new VkreditWidget(1, price, {
					order: order,
					sig: sig,
					onClose: function() {
						window.location.assign("/emarket/purchase/payment/choose/");
					},
					onAccept: function(accepted) {
						if(accepted == 1) {
							window.location.assign("/emarket/purchase/payment/kupivkredit/?accepted=accepted");
						} else {
							window.location.assign("/emarket/purchase/payment/choose/");
					}

					}
				});

				vKredit.openWidget();
			}
		]]>
			widgetOpen("<xsl:value-of select="order" />", "<xsl:value-of select="sig" />", <xsl:value-of select="totalPrice" />);
		});
		</script>
		<xsl:apply-templates select="//steps" />
		<h4>&in-progress;</h4>
		<p>&credit-request;</p>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'kupivkredit'][@action = 'declined']" mode="purch">
		<xsl:apply-templates select="//steps" />
		<h4>&error;</h4>
		<p>&credit-canceled;</p>
		<p><a href="/emarket/purchase/payment">&select-payment;</a></p>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'kupivkredit'][@action = 'error']" mode="purch">
		<xsl:apply-templates select="//steps" />
		<h4>&error;</h4>
		<p>&order-error;</p>
		<p><a href="/emarket/purchase/payment">&select-payment;</a></p>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'payanyway']" mode="purch">
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
				<xsl:text>&payment-redirect-text; PayAnyWay.</xsl:text>
			</div>

			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
		<xsl:call-template name="form-send" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'dengionline']" mode="purch">
		<xsl:apply-templates select="//steps" />
		<form class="width_100" action="{formAction}" method="post">
			<h4>
				<xsl:text>&payment-type;:</xsl:text>
			</h4>
			<input type="hidden" name="project" value="{project}" />
			<input type="hidden" name="amount" value="{amount}" />
			<input type="hidden" name="nickname" value="{order_id}" />
			<input type="hidden" name="source" value="{source}" />
			<input type="hidden" name="order_id" value="{order_id}" />
			<input type="hidden" name="comment" value="{comment}" />
			<input type="hidden" name="paymentCurrency" value="{paymentCurrency}" />
			<div class="inline">
				<xsl:apply-templates select="items/item[position() mod 3 = 1]" mode="payment-modes" />
			</div>
			<div class="inline">
				<xsl:apply-templates select="items/item[position() mod 3 = 2]" mode="payment-modes" />
			</div>
			<div class="inline">
				<xsl:apply-templates select="items/item[position() mod 3 = 0]" mode="payment-modes" />
			</div>
			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'paypal']" mode="purch">
		<xsl:apply-templates select="//steps" />
		<form class="width_100" action="{formAction}" method="post">
			<input type="hidden" name="cmd" value="_xclick" />
			<input type="hidden" name="business" value="{paypalemail}" />
			<input type="hidden" name="item_name" value="Payment for order #{order_id}" />
			<input type="hidden" name="item_number" value="{order_id}" />
			<input type="hidden" name="amount" value="{total}" />
			<input type="hidden" name="no_shipping" value="1" />
			<input type="hidden" name="return" value="{return_success}" />
			<input type="hidden" name="rm" value="2" />
			<input type="hidden" name="cancel_return" value="{cancel_return}" />
			<input type="hidden" name="notify_url" value="{notify_url}" />
			<input type="hidden" name="currency_code" value="{currency}" />

			<div>
				<xsl:text>&payment-redirect-text; PayPal.</xsl:text>
			</div>

			<div>
				<input type="submit" value="&pay;" class="button big" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="item" mode="payment-modes">
		<label><input type="radio" name="mode_type" value="{id}"/><xsl:value-of select="label"/></label>
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'payment'][@step = 'invoice']" xmlns:xlink="http://www.w3.org/TR/xlink"  mode="purch">
		<!-- <xsl:apply-templates select="//steps" /> -->
        <h1 class="mainheader"><img alt="" src="/templates/tokanet.ru//images/h1_cart_icon.png"/>Оформление заказа</h1>
        <div xmlns:xlink="http://www.w3.org/TR/xlink" xmlns:umi="http://www.umi-cms.ru/TR/umi" class="mainheaderend"></div>
        <div class="clear"></div>
        <div class="cartbuy_form">

		<form id="invoice" method="post" action="do"  target="invoice" onSubmit="window.open('', 'invoice', 'width=670,height=600,status=yes,resizable=yes,scrollbars=yes')">

            <div class="line"><strong>Счет для юридических лиц</strong></div>
			
			 <span class="pers_kont_defaults">

				<xsl:apply-templates select="items" mode="legal-person" />
			</span>
			<div>
				<input type="submit" value="&make-bill;" class="button big" />
			</div>
		</form>
        </div>
		<script>
			jQuery('#invoice').submit(function(){
				var input = jQuery('input:radio:checked', this);
				if (typeof input.val() == 'undefined' || input.val() == 'new') {
					if (typeof input.val() == 'undefined') {
						jQuery('input:radio[value=new]', this).attr('checked','checked');
					}
					return site.forms.data.check(this);
				}
			});
		</script>
	</xsl:template>

	<xsl:template match="items" mode="legal-person" xmlns:xlink="http://www.w3.org/TR/xlink">
		<input type="hidden" name="legal-person" value="new" />

		<xsl:apply-templates select="document(../@xlink:href)//field"/>
	</xsl:template>

	<xsl:template match="items[count(item) &gt; 0]" mode="legal-person" xmlns:xlink="http://www.w3.org/TR/xlink">
		<h4>
			<xsl:text>&choose-legal_person;:</xsl:text>
		</h4>
		<xsl:apply-templates select="item" mode="legal-person" />

		<div class="form_element">
			
				<input onclick="$('#new-legal-person').show(), $('div#new-legal-person div.box input').attr('required','required')" type="radio" name="legal-person" id="1984165687148455544897789" value="new" />
			<label for="1984165687148455544897789" class="css-label">
				<xsl:text>&new-legal-person;</xsl:text>
			</label>
		</div>

		<div id="new-legal-person" style="display:none;">
			<xsl:apply-templates select="document(../@xlink:href)//field"/>
		</div>



	</xsl:template>

	<xsl:template match="item" mode="legal-person"  xmlns:xlink="http://www.w3.org/TR/xlink">
		<div class="form_element">

				<input onclick="$('div#new-legal-person div.box input').removeAttr('required'), $('#new-legal-person').hide()" type="radio" name="legal-person" value="{@id}" id="{@id}">
					<xsl:if test="position() = 1">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</input>
            <label for="{@id}">
				<xsl:value-of select="@name" />
			</label>
		</div>
	</xsl:template>
	
	<xsl:template name="form-send">
		<script>
			jQuery('body').hide(0, function() {
				jQuery(document).ready(function(){
					jQuery('.center form').get(0).submit();
				});
			});
		</script>
	</xsl:template>


</xsl:stylesheet>
