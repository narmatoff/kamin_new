<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="udata[@module = 'emarket' and @method = 'cart']" mode="basket_sticker">

		
			<xsl:apply-templates select="summary" mode="basket" />
			
		

	</xsl:template>

	<xsl:template match="summary[amount = 0]" mode="basket">
	<div class="empty_cart_block">
        <div class="cart_block_inner">
            <div class="cart_header">
                <img src="{$template-resources}img/empty_cart_img.png" alt="корзина"/><p>Ваша корзина</p>
            </div>
            <div class="cart_counternsum">
                <p>Нет товаров</p>
            </div>
            <div class="chechout_cartbtn">
                <p href="#" title="Оформить заказ">оформить заказ</p>
            </div>

<!--       тут кнопку наверх-->
      
      

     
      <a href="javascript://" title="Подняться наверх сайта" class="site-up show"><div>наверх</div>
      
<!--      <img src="{$template-resources}img/totop.png" alt=""/>-->
      
      </a>
       
       
        </div>
    </div>
		    
	
	</xsl:template>

	<xsl:template match="summary[amount &gt; 0]" mode="basket">

		<div class="cart_block" >
			<div class="cart_block_inner">
				<div class="cart_header">
					<img src="{$template-resources}img/cart_img.png" alt="корзина"/><p>Ваша корзина</p>
				</div>
				<div class="cart_counternsum">
					<span><xsl:value-of select="amount" /> товаров</span><p>на сумму <xsl:value-of select="price/actual" /> рублей</p>
				</div>

				<div class="chechout_cartbtn">
					<a href="/emarket/cart/" title="Оформить заказ">оформить заказ</a>
				</div>
			
				<!--       тут кнопку наверх-->
				 <a href="javascript://" title="Подняться наверх сайта" class="site-up show" ><div>наверх</div>
<!--      <img src="{$template-resources}img/totop.png" alt=""/>-->
      </a>
       
			</div>
		</div>
		
		

	</xsl:template>
	<xsl:template match="result[@module='emarket' and @method='cart']">
		
	<h4>В корзине нет товаров</h4>
				 <a style="margin-right: 50px;" class="cart_clear_button" onclick="basket.removeAll" type="button"> Очистить</a>

	</xsl:template>

	<xsl:template match="result[@module='emarket' and @method='cart'][udata/summary/amount &gt; 0]">
		<h1>Корзина</h1>
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
					<xsl:apply-templates
					select="document('udata://emarket/cart')/udata/items/item" mode="itemb" />
					
				</table>
				<div class="cart_itogo">
					<div>Итого: <span class="cart_summary"> <xsl:value-of select="udata/summary/price/actual" /></span> руб.</div>
					<a href="/emarket/purchasing_one_step/">Оформить заказ</a>
				</div>
			</article>

		</section>

		<aside>
			<div class="filter_block">
				<div class="filter_hdr">
					так же рекомендуем
				</div>
				<xsl:apply-templates select="document('usel://accessories')/udata/page" mode="accessories" />
			</div>
		</aside>

		<div class="clearfix"></div>
	</xsl:template>

	<xsl:template match="page" mode="accessories">
				<div class="maingoodinfo">
					<a href="{@link}">
				<span>
					<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="extended/properties/property[@name = 'foto_1']/value" />
                        <xsl:with-param name="width" select="86" />
                        <xsl:with-param name="height">86</xsl:with-param>
                    </xsl:call-template>
				</span>
					</a>
					<h4><a href="{@link}"><xsl:value-of select="extended/properties/property[@name = 'nazvanie']/value" /></a></h4>
					<span class="manufacturer_block"><xsl:value-of select="extended/properties/property[@name = 'brend']/value/item/@name" /></span>
					<span class="summa_asidebl"><xsl:value-of select="extended/properties/property[@name = 'price']/value" /> руб</span>
					<a class="aside_button" href="/emarket/basket/put/element/{@id}">Купить</a>
					<div class="clearfix"></div>
				</div>
	</xsl:template>

	<xsl:template match="item" mode="itemb">
	
	<xsl:variable name="price_info"
			select="document(concat('udata://emarket/price/', page/@id))/udata" />
		<xsl:variable name="item"
			select="document(concat('upage://',page/@id))/udata" />

			<tr class="tab_row">
						<td class="main_td">
							<!-- <xsl:value-of select="$item/page/properties/group/property[@name='foto_1']/value" /> -->
							<div class="maingoodinfo">
								<a href="{page/@link}" id="single_image" >
								<span>
											<xsl:call-template name="thumbing">
                                                <xsl:with-param name="source" select="$item/page/properties/group/property[@name='foto_1']/value" />
                                                <xsl:with-param name="width" select="86" />
                                                <xsl:with-param name="height">86</xsl:with-param>
                                             </xsl:call-template>
								</span>
								</a>
								<h4><a href="{page/@link}"><xsl:value-of select="@name"/></a></h4>
								<span class="articul_block">Артикул: <a href="#">325465</a></span>
								<!-- <span class="instok">в наличии</span> -->

								<div class="clearfix"></div>
							</div>
						</td>
						<td class="price_td">
							<xsl:value-of select="$item/page/properties/group/property[@name='price']/value" disable-output-escaping="yes"/> р. руб
						</td>
						<td class="count_td">

							<div class="pice_count">
							<span class="bgpm1">
								<input type="button" value="-"   onclick="var e = $('#input_pice_count_{@id}'); site.basket.modify({@id}, parseInt(parseInt(e.val())-1));" class="input_pice_count_minus"/></span>
							<span>

								<input id="input_pice_count_{@id}" onkeyup="var e = jQuery(this).next('input'), old = e.val(); e.val(this.value);site.basket.modify({@id}, this.value, old);" type="text" value="{amount}" class="input_pice_count"/>
								
							</span>
								<span class="bgpm2"><input type="button" value="+"  onclick="var e = $('#input_pice_count_{@id}'); site.basket.modify({@id}, parseInt(parseInt(e.val())+1));" class="input_pice_count_plus"/></span>
							</div>
						</td>
						<td class="summa_td cart_item_price_{@id}">
							<xsl:value-of select="total-price/actual"/> руб.
<!--							<xsl:value-of select="total-price/@suffix"/>.-->
						</td>
						<td class="floating_td">
							<a href="/emarket/basket/remove/item/{@id}/">удалить</a>
						</td>
						<div class="clearfix"></div>
					</tr>

		
	</xsl:template>
	<xsl:template match="item" mode="purchase_items">
        <xsl:variable name="item" select="document(concat('upage://', page/@id))/udata/page" />
				
				<div class="maingoodinfo">
					<a href="{page/@link}">
				<span>
					<xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$item//property[@name = 'foto_1']/value" />
                        <xsl:with-param name="width" select="86" />
                        <xsl:with-param name="height">86</xsl:with-param>
                    </xsl:call-template>
				</span>
					</a>
					<h4><a href="{page/@link}"><xsl:value-of select="$item//property[@name = 'nazvanie']/value" /></a></h4>
					<span class="manufacturer_block"><xsl:value-of select="$item//property[@name = 'brend']/value/item/@name" /></span>
					<span class="summa_asidebl"><xsl:value-of select="$item//property[@name = 'price']/value" /> руб</span>
					<!-- <a class="aside_button" href="/emarket/basket/put/element/{@id}">Купить</a> -->
					<div class="clearfix"></div>
				</div>
		
	</xsl:template>
</xsl:stylesheet>