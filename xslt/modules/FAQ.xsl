<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <xsl:template match="result[@module = 'faq'][@method = 'project']">
        <article>
            <div id="faq_question">
            <xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" />

            <xsl:apply-templates select="document(concat('udata://faq/project//', @pageId))/udata" />
        	</div>
		</article>
    </xsl:template>

    <xsl:template match="udata[@module = 'faq'][@method = 'project']">
	<h2>Уточните категорию вопроса</h2>
	<ul>
        <xsl:apply-templates select="lines/item" mode="faq_project" />
	</ul>
<xsl:apply-templates select="document(concat('udata://faq/addQuestionForm//', @id))/udata" mode="question_form" />
    </xsl:template>

    <xsl:template match="item" mode="faq_project">
    	
                <li><a href="{@link}"><xsl:value-of select="@name" /></a></li>
         	
    </xsl:template>

    <xsl:template match="result[@module = 'faq'][@method = 'category']">
	<article>
            <div id="faq_question">
                <h1><xsl:value-of select="@header" /></h1>
        		<xsl:apply-templates select="document(concat('udata://faq/category//', @pageId, '/10/0/1/?extProps=publish_time,old_name'))/udata" />
			</div>
	</article>
    </xsl:template>

    <xsl:template match="udata[@module = 'faq'][@method = 'category']">
        <!--		<h1 class="dialog_par"><xsl:value-of select="@header"/></h1>-->
        
                <ul class="question_answer">
                    <xsl:apply-templates select="items/item" mode="question" />
                </ul>
                <xsl:apply-templates select="document(concat('udata://faq/addQuestionForm//', @id))/udata" mode="question_form" />
                <div class="clearfix"></div>
				<xsl:call-template name="numpages">
	                <xsl:with-param name="total" select="total" />
	                <xsl:with-param name="limit" select="per_page" />
	            </xsl:call-template>
	            
           
    </xsl:template>

    <xsl:template match="item" mode="question">
       
           
            

        <li>
            <p class="samquestn" id="q{@id}">
                    <a href="{@link}">
                        <xsl:value-of select="question" disable-output-escaping="yes" />
                    </a>
            </p>
            <p>
                <a href="javascript://" class="answer_showhide" title="Кликните, чтобы раскрыть ответ">Ответ ></a>
                <span><xsl:value-of select="extended/properties/property[@name='old_name']/value" /></span>
            </p>
<div class="clearfix"></div>
            <div class="answeronquestionbl">
                <xsl:value-of select="answer" disable-output-escaping="yes" />
                <p><a href="#faq_ask" class="scroll">Задать уточняющий вопрос</a>
            </p>
            
            </div>
<div class="clearfix"></div>
            




        </li>




    </xsl:template>
    <!--
	<xsl:template match="item" mode="otvet">

		<li>
			<h4 id="q{@id}"><xsl:value-of select="question" disable-output-escaping="yes" /></h4>
				<xsl:value-of select="answer" disable-output-escaping="yes" />
		</li>


	</xsl:template>
-->

    <xsl:template match="udata[@module = 'faq'][@method = 'addQuestionForm']" mode="question_form">



        <div id="faq_ask" name="faq_ask">
            <h2>Задать вопрос</h2>
        
            <form method="post" class="kabinet-block" enctype="multipart/form-data" action="{action}" onsubmit="site.forms.data.save(this); return site.forms.data.check(this);">
                <input type="text" class="textbox" id="faq_name" name="nick" placeholder="Ваше имя" />
                <input type="text" class="textbox" id="faq_email" name="email" placeholder="E-mail" />
                <input type="text" class="textbox" id="faq_theme" name="title" placeholder="Тема" />
                <input type="file" class="textbox" id="faq_file" name="data[new][file]" />
                <textarea type="text" class="textbox" id="faq_question" name="question" placeholder="Вопрос"></textarea>
                <input id="contacts_backconnect_button" class="button" type="submit" value="Отправить" />
            </form>
        </div>
        <!-- <button>Задать вопрос</button> -->
        
        
    </xsl:template>

    <xsl:template match="result[@module = 'faq'][@method = 'post_question']">
        <article>
            <div>
                <xsl:text>Ваш вопрос отправлен.</xsl:text>
            </div>
        </article>
    </xsl:template>







    <!-- вопрос на главной -->

    <xsl:template match="item" mode="faq_main">

        <p class="aside_dialog_par">
            <xsl:value-of select="question" disable-output-escaping="yes" />
            <span class="aside_date">
		 		<xsl:value-of select="extended/properties/property[@name='old_name']/value" />, <xsl:value-of select="extended/properties/property[@name='publish_time']/value/@formatted-date" />
		 	</span>
        </p>
        <p>
            <xsl:value-of select="answer" disable-output-escaping="yes" />
            <!-- 	<span class="more_link">
         		<a title="Читать далее" href="#">...</a>
         	</span> -->
        </p>
        <a class="send_question" href="/poleznaya_informaciya/vopros#faq_ask">Задать вопрос</a>

    </xsl:template>

    <xsl:template match="result[@module = 'faq'][@method = 'question']">
        <article class="insetqustanswpage">
            <div id="faq_question">
               
                <ul class="question_answer">
                     <li>
			            
			                   
			                        <h1><xsl:value-of select="page//property[@name='question']/value" disable-output-escaping="yes" /></h1>
			                    
			            
			            <p>
			               <a style="float:left;" href="javascript://" class="answer_showhide" title="Кликните, чтобы раскрыть ответ">Ответ ></a>
			                <span>
			                
			            		<xsl:value-of select="page//property[@name='old_name']/value" disable-output-escaping="yes" />
			                </span>
			            </p>
						<div class="clearfix"></div>
			            <div class="answeronquestionbl" style="height: auto;">
			            	<xsl:value-of select="page//property[@name='answer']/value" disable-output-escaping="yes" />
			                <!-- <xsl:value-of select="answer" disable-output-escaping="yes" /> -->
			                <p>
			            </p>
			            
			            </div>
						<div class="clearfix"></div>
			            




			        </li>
                </ul>
         	</div>
		</article>
    </xsl:template>



</xsl:stylesheet>