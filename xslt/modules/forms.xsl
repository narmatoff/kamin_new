<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'webforms'][@method = 'page']">
		
		
			<xsl:variable name="form_id" select="page/properties/group/property[@name='form_id']/value" />

		<article>
			<h2 class="dialog_par"><xsl:value-of select="@header"/></h2>

			<xsl:apply-templates select="document('udata://system/listErrorMessages/udata/items')"	mode="errors" />
			<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
			<xsl:apply-templates select="document('udata://system/listErrorMessages/udata/items')"	mode="errors" />
			<xsl:apply-templates select="document(concat('udata://webforms/add/',$form_id))/udata"	mode="form" />
		</article>
				
	</xsl:template>

	<xsl:template match="udata" mode="form_in_page">
		
		
			<xsl:variable name="form_id" select="page/properties/group/property[@name='form_id']/value" />
			<article>
			<h2 class="dialog_par"><xsl:value-of select="page/name"/></h2>
			<xsl:apply-templates select="document('udata://system/listErrorMessages/udata/items')"	mode="errors" />
			<xsl:value-of select="page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
			<xsl:apply-templates select="document('udata://system/listErrorMessages/udata/items')"	mode="errors" />
			<xsl:apply-templates select="document(concat('udata://webforms/add/',$form_id))/udata"	mode="form" />
			</article>
				
	</xsl:template>

	<!-- Шаблон вывода формы -->

	<xsl:template match="udata" mode="form">
    <xsl:param name="obj"/>

    
    <form action="/webforms/send/" method="post">
	    <input type="hidden" name="system_form_id" value="{@form_id}" />
		<input type="hidden" name="ref_onsuccess" value="/webforms/posted/" />
		<xsl:apply-templates select="items/item[@selected= 'selected']"	mode="adress" />
		
	    <div class="cartform">
			<span class="pers_kont_defaults">
				<xsl:apply-templates select="groups/group[@name= 'dannye_formy']/field" mode="form-fields"/>
			</span>
		</div>
		<div class="cart_kont_buttons">
			<input type="submit" value="Отправить"/>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</form>
	
	</xsl:template>
	
	
	
	<!-- Адресс, куда отправляется сообщение -->

	<xsl:template match="item" mode="adress">
		<input type="hidden" name="system_email_to" value="{@id}" /> <br/>
	</xsl:template>

	<!-- ШАблоны полей -->

	<xsl:template match="field[@name = 'link']"
		mode="form-fields">
		
		

	</xsl:template>

	<xsl:template match="field[@type = 'string' or @type = 'int'][@required='required']" mode="form-fields">
		<input placeholder="{@title}*" name="{@input_name}" id="n{@id}" required="required" type="text" value="{.}" class="pers_kont_default"/>
		
		

	</xsl:template>
	<xsl:template match="field[@type = 'string' or @type = 'int'][not(@required)]"
		mode="form-fields">
		<input placeholder="{@title}" name="{@input_name}" id="n{@id}" required="" type="text" value="{.}" class="pers_kont_default"/>

	</xsl:template>
	<xsl:template match="field[@type = 'text' and @required='required']"
		mode="form-fields">
		
		<textarea name="{@input_name}" placeholder="{@title}" required="required" type="text" class="pers_kont_textarea">
			<xsl:value-of select="." disable-output-escaping="no"/>
		</textarea>
		
		


	</xsl:template>

	<xsl:template match="field[@type = 'text'][not(@required)]" mode="form-fields">
		<textarea name="{@input_name}" placeholder="{@title}" required="" type="text" class="pers_kont_textarea">
			<xsl:value-of select="." disable-output-escaping="no"/>
		</textarea>
	</xsl:template>
	<xsl:template match="field[@type = 'relation' and @required='required']" mode="form-fields">
		
					
				
		<div class="chul_towns">
            <p></p>
            <select id="{@id}" name="{@input_name}">
						<option value=""><xsl:value-of select="@title" />*</option>
						<xsl:apply-templates select="values/item" mode="form-fields-option" />
					</select>
		</div>	
	</xsl:template>

	<xsl:template match="field[@type = 'relation'][not(@required)]" mode="form-fields">
		<div class="chul_towns">
            <p></p>
					<select name="{@input_name}" >
						<option value=""><xsl:value-of select="@title" /></option>
						<xsl:apply-templates select="values/item" mode="form-fields-option" />
					</select>
		</div>
	</xsl:template>
	<xsl:template match="item" mode="form-fields-option">
		<option>
			<xsl:value-of select="." />
		</option>

	</xsl:template>

	
	  
	<!-- Каптча  -->
	<!-- Ошибки  -->
	<xsl:template match="items " mode="errors">
<div class="errors">
		<xsl:value-of select="item" disable-output-escaping="yes" />
</div>		
	</xsl:template>



	<xsl:template match="result[@module = 'webforms'][@method = 'posted']">
	<div class="contact-box" style="text-align:center">	

		Отправка сообщения прошла успешно!
	</div>	
	</xsl:template>

</xsl:stylesheet>