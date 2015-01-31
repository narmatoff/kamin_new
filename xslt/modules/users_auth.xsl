<<<<<<< HEAD
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink"
    xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <xsl:template match="user"  mode="login_button">
        <xsl:variable name="user_info" select="document(concat('uobject://', @id))"/>
            <!-- <li>
                <a class="offiсe-enter" href="/users/profile/">Здравствуйте, <xsl:value-of select="$user_info/udata/object/properties/group/property[@name='kontaktnoe_lico']/value" disable-output-escaping="no"/></a>
             </li>
        <li><a class="offiсe-enter" href="/users/logout/">ВЫХОД</a></li> -->
        <section>
            <article>
                <div class="lk_popup_block">
                    <div class="left_lk_popup_block">
                        <h4 class="popup_h4">Вход</h4>
                        <span class="pers_kont_defaults">
                            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
                        </span>
                    </div>
                    <div class="right_lk_popup_block">
                        <h4 class="popup_h4">Еще не зарегистрированы?</h4>
                            <span class="pers_kont_defaults">
                                <form method="get"   action="/users/registrate/">
                                    <h4>Ваше имя</h4>
                                    <input required="required" name="na" class="pers_kont_default"/>
                                    <h4>Email</h4>
                                    <input required="required" name="em"  type="email"  class="pers_kont_default"/>
                                    <a href="#" class="help_link"></a>
                                    <div class="cart_kont_buttons">
                                        <input type="submit" class="rightpop_but" value="Регистрация"/>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </span>
                    </div>
                    <div>
                    </div>
                </div>
            </article>
        </section>
                
        
    </xsl:template>
    <xsl:template match="user[@type = 'guest']"  mode="login_button">
        <!--  <li><a id="inline" href="#data">Личный кабинет</a></li>

        <div style="display:none">
            <div id="data">
                <h2>Авторизация</h2>
                <xsl:apply-templates select="document('udata://users/auth/')/udata" />

            </div>

        </div> -->
        
        <section>
            <article>
                <div class="lk_popup_block">
                    <div class="left_lk_popup_block">
                        <h4 class="popup_h4">Вход</h4>
                        <span class="pers_kont_defaults">
                            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
                        </span>
                    </div>
                    <div class="right_lk_popup_block">
                        <h4 class="popup_h4">Еще не зарегистрированы?</h4>
                            <span class="pers_kont_defaults">
                                <form method="get"   action="/users/registrate/">
                                    <h4>Ваше имя</h4>
                                    <input required="required" name="na" class="pers_kont_default"/>
                                    <h4>Email</h4>
                                    <input required="required" name="em"  type="email"  class="pers_kont_default"/>
                                    <a href="#" class="help_link"></a>
                                    <div class="cart_kont_buttons">
                                        <input type="submit" class="rightpop_but" value="Регистрация"/>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </span>
                    </div>
                    <div>
                    </div>
                </div>
            </article>
        </section>
        
    </xsl:template>
 <xsl:template match="result[@module = 'users' and @method = 'login']">
        
        <h1  class="bordered"><xsl:value-of select="@header" /></h1>
        <!-- форма авторизации -->
        <xsl:apply-templates select="document('udata://users/auth/')/udata" />
        
        </xsl:template>

        <xsl:template match="result[@module = 'users' and @method = 'auth']">
        <xsl:choose>
            <xsl:when test="user/@status='auth'">
                <xsl:value-of select="document('udata://content/redirect/(/users/profile/)')" />
            </xsl:when>
            <xsl:otherwise>
            
                <h1  class="bordered"><xsl:value-of select="@header" /></h1>
            <!-- форма авторизации -->
                <xsl:apply-templates select="document('udata://users/auth/')/udata" />
           
            </xsl:otherwise>
        </xsl:choose>
        <!-- форма авторизации -->
       
</xsl:template>

        <!-- форма авторизации -->
<xsl:template match="udata[@module = 'users' and @method = 'auth']">
    
        
        <form method="post"   action="/users/login_do/">

            <h4>Email</h4>
            <input required="required" type="email"  name="login" class="pers_kont_default"/>
            <h4>Пароль</h4>
            <input required="required"  name="password" type="password" class="pers_kont_default"/>
            <a href="/users/forget" class="help_link">Забыли пароль?</a>
            <div class="cart_kont_buttons">
                <input type="submit" value="Войти"/>
                <div class="clearfix"></div>
            </div>  
       
        </form>

    

 </xsl:template>
 
 <xsl:template match="result[@method = 'registrate']" >
    <xsl:value-of select="udata/errors" disable-output-escaping="no"/>
    <xsl:apply-templates select="$errors" />


<xsl:apply-templates select="document('udata://users/registrate')/udata" />
  
</xsl:template>

<xsl:template match="udata[@method = 'registrate']">
    <div class="lk_pers_subsc active_lk_pers_subsc">
        
    <form enctype="multipart/form-data" method="post" action="/users/registrate_do/">
        <div class="cartform">
        <h4>E-mail</h4>
        <input placeholder="E-mail" required="required" value="{$em}" name="email" type="email" onchange=" var e = jQuery(this).next('input'), old = e.val();  e.val(this.value);" class="pers_kont_default"/>
        <input name="login" type="hidden" value="{$em}" class="pers_kont_default"/>
        <h4>Пароль</h4>
        <input placeholder="Пароль" required="required" name="password" type="password" class="pers_kont_default"/>
        <h4>Пароль еще раз</h4>
        <input placeholder="Пароль еще раз" required="required" name="password_confirm" type="password" class="pers_kont_default"/>
        <xsl:apply-templates select="document(concat('udata://data/getCreateForm/', type_id))/udata/group[@name='short_info']/field" mode="form_registrate" />
       
        
        
        
        <hr class="wave" />
        <!-- <div class="captcha">
            <xsl:apply-templates select="document('udata://system/captcha')/udata" />
        </div> -->
        <div class="special-order-v3"><b>Примечание:</b>&br;Поля, помеченные (<span class="mandatory">*</span>), обязательны для заполнения.</div>
        <div class="cart_kont_buttons">
            <input type="submit" value="Отправить"/>
            <div class="clearfix"></div>
        </div>  </div>
         </form>
   </div>
            <!-- запрос подключения полей для ввода дополнительных данных пользователя -->
           
            <!-- запрос подключения captcha -->
            <!-- <xsl:apply-templates select="document('udata://system/captcha')/udata" /> -->
            

</xsl:template>




<xsl:template match="result[@module = 'users'][@method = 'registrate_done']">
     
      
        <p>
            <xsl:text> Регистрация прошла успешно! </xsl:text>
        </p> 
    
       

</xsl:template>

<xsl:template match="result[@module = 'users'][@method = 'activate']">
     
       
        
        <!-- подключение обработчика активации пользователя -->
        <xsl:apply-templates select="document(concat('udata://users/activate/',$param0,'/'))/udata" />
    
</xsl:template>

<xsl:template match="udata[@module = 'users'][@method = 'activate']">
     
 
        <!-- если активация успешна, то происходит перенаправление на стартовую страницу -->
        <xsl:apply-templates select="document('udata://content/redirect/(/users/settings/)/')/udata" />
    
</xsl:template>
    
<xsl:template match="udata[@module = 'users'][@method = 'activate'][error]">
<!-- выведение ошибок, если они произошли -->
 
       
    <xsl:value-of select="error" />
</xsl:template>

<xsl:template match="result[@method = 'forget']">
    <xsl:value-of select="udata/errors" disable-output-escaping="no"/>
    
         <xsl:apply-templates select="$errors" />
 <div class="lk_pers_subsc active_lk_pers_subsc">
        <form id="forget" method="post" action="/users/forget_do/">
            <div class="cartform">
                <fieldset class="forma" id="tab1">
                <div class="box">
                    <label>                   
                            Введите e-mail: 
                    
                    </label>
                    <input type="text"  name="forget_email" />
                </div>
                <div>
                    <input type="submit"  class="submit" value="Отправить" />
                </div>
                </fieldset>
            </div>
        </form>
    </div> 
   
</xsl:template>

<xsl:template match="result[@method = 'forget_do']">
       <xsl:value-of select="udata/errors" disable-output-escaping="no"/>
    
     
            <xsl:text>Вам на почту выслана ссылка для получения нового пароля</xsl:text>
        
    </xsl:template>


    <xsl:template match="result[@method = 'restore']">
      
        
            <xsl:text>На e-mail адрес, указанный Вами при регистрации, был выслан пароль.</xsl:text>
       
    </xsl:template>



<!-- Результат авторизации -->
<xsl:template match="result[@method = 'login_do']">
     
        
        <xsl:if test="@not-permitted = 1">
            <p><xsl:text>Ваших прав недостаточно для просмотра данной страницы</xsl:text></p>
        </xsl:if>
        <xsl:if test="user[@type = 'guest'] and (@method = 'login_do' or @method = 'loginza')">
            <p><xsl:text>Вы ввели неверный логин или пароль. Проверьте раскладку клавиатуры, не нажата ли клавиша «Caps Lock» и попробуйте ввести логин и пароль ещё раз</xsl:text></p>
            <p><a href="/users/forget/">Забыли пароль?</a></p>
              <xsl:apply-templates select="document('udata://users/auth/')/udata" />
        </xsl:if>     
        <xsl:if test="user/@status='auth'">
            <xsl:apply-templates select="document('udata://content/redirect/(/users/settings/)/')/udata" />
        </xsl:if>
      
</xsl:template>


<xsl:template match="result[@method = 'profile']">
     <xsl:if test="user[@type = 'guest']">
        <p><xsl:text>Авторизуйтесь в системе, чтобы войти в личный кабинет</xsl:text></p>
            <p><a href="/users/forget/">Забыли пароль?</a></p>
            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
    </xsl:if>

             


        <div class="lk_bookmarks_items">
            <a href="javascript://" class="active_item_menu">Персональные данные</a>
            <a href="javascript://" class="unactive_item_menu">Каталоги</a>
        </div>

        <div class="lk_pers_subsc active_lk_pers_subsc">

            <form enctype="multipart/form-data" method="post" action="/users/settings_do/">
                <div class="cartform">
                <h4>E-mail</h4>
                <input placeholder="E-mail" required="required" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" name="email" type="email" onchange=" var e = jQuery(this).next('input'), old = e.val();  e.val(this.value);" class="pers_kont_default"/>
                <input name="login" type="hidden" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" class="pers_kont_default"/>
                <h4>Пароль</h4>
                <input placeholder="Пароль"  name="password" type="password" class="pers_kont_default"/>
                <h4>Пароль еще раз</h4>
                <input placeholder="Пароль еще раз"  name="password_confirm" type="password" class="pers_kont_default"/>
                <xsl:apply-templates select="document(concat('udata://data/getEditForm/', user/@id ))/udata/group[@name='short_info']/field" mode="form_registrate" />
               
                
                
                
                <hr class="wave" />
                <!-- <div class="captcha">
                    <xsl:apply-templates select="document('udata://system/captcha')/udata" />
                </div> -->
                <div class="special-order-v3"><b>Примечание:</b>&br;Поля, помеченные (<span class="mandatory">*</span>), обязательны для заполнения.</div>
                <div class="cart_kont_buttons">
                    <input type="submit" value="Отправить"/>
                    <div class="clearfix"></div>
                </div>  </div>
         </form>
        </div>






        <div class="lk_pers_subsc unactive_lk_pers_subsc" style="width: 100%">
            <h2>Полезные ссылки</h2>
            <xsl:apply-templates select="document('udata://menu/draw/410')/udata" mode="leveluser" />
            <h2>Каталоги</h2>
            <xsl:apply-templates select="document('udata://menu/draw/413')/udata" mode="leveluser_catalog" />





            <!-- <form>
                <div class="cartform">
                    <span class="pers_kont_defaults">
                        <h4>Email</h4>
                                    <input placeholder="Имя" required="required" type="text" class="pers_kont_default"/>



                    </span>
                    <div class="cart_kont_buttons">
                        <input type="button" value="Отправить"/>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>

                </div>

            </form> -->
        </div>



</xsl:template>


<xsl:template match="udata" mode="leveluser_catalog">
        <table class="leveluser_catalog">

            <xsl:apply-templates select="item" mode="leveluser_catalog" />
            
        </table>
</xsl:template>


<xsl:template match="item" mode="leveluser_catalog">
    <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page" />
        <tr>
            <td style="width: 200px">
                <a href="{@link}">
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$page/properties/group/property[@name='header_pic']/value" />
                        <xsl:with-param name="width" select="181" />
                        <xsl:with-param name="height">auto</xsl:with-param>
                    </xsl:call-template>
                </a>
            </td>
            <td>
            <h3 style="margin:0px"><xsl:value-of select="@name" disable-output-escaping="yes" /></h3>
            <xsl:value-of select="$page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
            <a href="{@link}">Скачать</a>
           </td>

        </tr>
    </xsl:template>

<!-- Страница пользователя -->   
<xsl:template match="result[@method = 'settings']">
     <xsl:if test="user[@type = 'guest']">
        <p><xsl:text>Авторизуйтесь в системе, чтобы войти в личный кабинет</xsl:text></p>
            <p><a href="/users/forget/">Забыли пароль?</a></p>
            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
    </xsl:if>

             


        <div class="lk_bookmarks_items">
            <a href="javascript://" class="active_item_menu">Персональные данные</a>
            <a href="javascript://" class="unactive_item_menu">Каталоги</a>
        </div>

        <div class="lk_pers_subsc active_lk_pers_subsc">

            <form enctype="multipart/form-data" method="post" action="/users/settings_do/">
                <div class="cartform">
                <h4>E-mail</h4>
                <input placeholder="E-mail" required="required" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" name="email" type="email" onchange=" var e = jQuery(this).next('input'), old = e.val();  e.val(this.value);" class="pers_kont_default"/>
                <input name="login" type="hidden" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" class="pers_kont_default"/>
                <h4>Пароль</h4>
                <input placeholder="Пароль"  name="password" type="password" class="pers_kont_default"/>
                <h4>Пароль еще раз</h4>
                <input placeholder="Пароль еще раз"  name="password_confirm" type="password" class="pers_kont_default"/>
                <xsl:apply-templates select="document(concat('udata://data/getEditForm/', user/@id ))/udata/group[@name='short_info']/field" mode="form_registrate" />
               
                
                
                
                <hr class="wave" />
                <!-- <div class="captcha">
                    <xsl:apply-templates select="document('udata://system/captcha')/udata" />
                </div> -->
                <div class="special-order-v3"><b>Примечание:</b>&br;Поля, помеченные (<span class="mandatory">*</span>), обязательны для заполнения.</div>
                <div class="cart_kont_buttons">
                    <input type="submit" value="Отправить"/>
                    <div class="clearfix"></div>
                </div>  </div>
         </form>
        </div>






        <div class="lk_pers_subsc unactive_lk_pers_subsc">

                 <xsl:apply-templates select="document('udata://menu/draw/410')/udata" mode="leveluser" />
            
           <!--  <form>
                <div class="cartform">
    <span class="pers_kont_defaults">
        <h4>Email</h4>
                    <input placeholder="Имя" required="required" type="text" class="pers_kont_default"/>



    </span>
                    <div class="cart_kont_buttons">
                        <input type="button" value="Отправить"/>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>

                </div>

            </form> -->
        </div>


     

</xsl:template>


<xsl:template match="property" mode="prajsy">
    <li><a href="{value}"> <xsl:value-of select="@name" disable-output-escaping="no"/></a></li>
</xsl:template>


    <xsl:template match="group" mode="dop_field">
            <fieldset class="forma" id="tab{@name}">
            
            <xsl:apply-templates select="field" />
            <div>
                <input type="submit"  class="submit" value="Сохранить" />
            </div>
        </fieldset>
        
    </xsl:template>
     <xsl:template match="group" mode="groups">
        <li><a href="#tab{@name}"><xsl:value-of select="@title" disable-output-escaping="no"/></a></li>   
    </xsl:template>

    <xsl:template match="field[@type='int' or @type='string']" mode="form_registrate">

        <h4><xsl:value-of select="@title"/></h4>
        <input placeholder="{@title}" name="{@input_name}" type="text" value="{.}" class="pers_kont_default">
            <xsl:if test="@required">
                <xsl:attribute name="required">
                     required
                </xsl:attribute>
            </xsl:if>
        </input>
        
    </xsl:template>
    <xsl:template match="field[@type='relation']" mode="form_registrate">

        <h4><xsl:value-of select="@title"/></h4>
        <span class="pers_kont_defaults">
            <xsl:apply-templates select="values/item" mode="form_registrate">
                <xsl:with-param name="name" select="@input_name"/>
            </xsl:apply-templates>
        </span>
        
        
    </xsl:template>

    <xsl:template match="item" mode="form_registrate">
        <xsl:param name="name"/>
        <input type="radio" name="{$name}" id="radio{@id}" value="{@id}" class="css-checkbox">
                <xsl:if test="@selected">
                    <xsl:attribute name="checked">
                        checked
                    </xsl:attribute>
                </xsl:if>
        </input>
        <label for="radio{@id}" class="css-label"><xsl:value-of select="." /></label>
    </xsl:template>

    <xsl:template match="field[@type='boolean']" mode="form_registrate">

      
        <span class="perskont_defaults">
            <input  name="{@input_name}" type="checkbox" class="css-checkbox" id="chkbx{@id}">
                <xsl:if test="@checked">
                    <xsl:attribute name="checked">
                        checked
                    </xsl:attribute>
                </xsl:if>
            </input>
            <label for="chkbx{@id}" class="css-label2"><xsl:value-of select="@title"/></label>
        </span>
        
    </xsl:template>

     <xsl:template match="field[@type='date']" mode="form_registrate">

        <h4><xsl:value-of select="@title"/></h4>
        <input type="text" name="{@input_name}" value="{.}" id="pers_date"/>

       
        
    </xsl:template>


   <!--  <xsl:template match="Pattern" mode="QName" priority="Number">
        
    </xsl:template> -->
     
=======
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink"
    xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <xsl:template match="user"  mode="login_button">
        <xsl:variable name="user_info" select="document(concat('uobject://', @id))"/>
            <!-- <li>
                <a class="offiсe-enter" href="/users/profile/">Здравствуйте, <xsl:value-of select="$user_info/udata/object/properties/group/property[@name='kontaktnoe_lico']/value" disable-output-escaping="no"/></a>
             </li>
        <li><a class="offiсe-enter" href="/users/logout/">ВЫХОД</a></li> -->
        <section>
            <article>
                <div class="lk_popup_block">
                    <div class="left_lk_popup_block">
                        <h4 class="popup_h4">Вход</h4>
                        <span class="pers_kont_defaults">
                            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
                        </span>
                    </div>
                    <div class="right_lk_popup_block">
                        <h4 class="popup_h4">Еще не зарегистрированы?</h4>
                            <span class="pers_kont_defaults">
                                <form method="get"   action="/users/registrate/">
                                    <h4>Ваше имя</h4>
                                    <input required="required" name="na" class="pers_kont_default"/>
                                    <h4>Email</h4>
                                    <input required="required" name="em"  type="email"  class="pers_kont_default"/>
                                    <a href="#" class="help_link"></a>
                                    <div class="cart_kont_buttons">
                                        <input type="submit" class="rightpop_but" value="Регистрация"/>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </span>
                    </div>
                    <div>
                    </div>
                </div>
            </article>
        </section>
                
        
    </xsl:template>
    <xsl:template match="user[@type = 'guest']"  mode="login_button">
        <!--  <li><a id="inline" href="#data">Личный кабинет</a></li>

        <div style="display:none">
            <div id="data">
                <h2>Авторизация</h2>
                <xsl:apply-templates select="document('udata://users/auth/')/udata" />

            </div>

        </div> -->
        
        <section>
            <article>
                <div class="lk_popup_block">
                    <div class="left_lk_popup_block">
                        <h4 class="popup_h4">Вход</h4>
                        <span class="pers_kont_defaults">
                            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
                        </span>
                    </div>
                    <div class="right_lk_popup_block">
                        <h4 class="popup_h4">Еще не зарегистрированы?</h4>
                            <span class="pers_kont_defaults">
                                <form method="get"   action="/users/registrate/">
                                    <h4>Ваше имя</h4>
                                    <input required="required" name="na" class="pers_kont_default"/>
                                    <h4>Email</h4>
                                    <input required="required" name="em"  type="email"  class="pers_kont_default"/>
                                    <a href="#" class="help_link"></a>
                                    <div class="cart_kont_buttons">
                                        <input type="submit" class="rightpop_but" value="Регистрация"/>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </span>
                    </div>
                    <div>
                    </div>
                </div>
            </article>
        </section>
        
    </xsl:template>
 <xsl:template match="result[@module = 'users' and @method = 'login']">
        
        <h1  class="bordered"><xsl:value-of select="@header" /></h1>
        <!-- форма авторизации -->
        <xsl:apply-templates select="document('udata://users/auth/')/udata" />
        
        </xsl:template>

        <xsl:template match="result[@module = 'users' and @method = 'auth']">
        <xsl:choose>
            <xsl:when test="user/@status='auth'">
                <xsl:value-of select="document('udata://content/redirect/(/users/profile/)')" />
            </xsl:when>
            <xsl:otherwise>
            
                <h1  class="bordered"><xsl:value-of select="@header" /></h1>
            <!-- форма авторизации -->
                <xsl:apply-templates select="document('udata://users/auth/')/udata" />
           
            </xsl:otherwise>
        </xsl:choose>
        <!-- форма авторизации -->
       
</xsl:template>

        <!-- форма авторизации -->
<xsl:template match="udata[@module = 'users' and @method = 'auth']">
    
        
        <form method="post"   action="/users/login_do/">

            <h4>Email</h4>
            <input required="required" type="email"  name="login" class="pers_kont_default"/>
            <h4>Пароль</h4>
            <input required="required"  name="password" type="password" class="pers_kont_default"/>
            <a href="/users/forget" class="help_link">Забыли пароль?</a>
            <div class="cart_kont_buttons">
                <input type="submit" value="Войти"/>
                <div class="clearfix"></div>
            </div>  
       
        </form>

    

 </xsl:template>
 
 <xsl:template match="result[@method = 'registrate']" >
    <xsl:value-of select="udata/errors" disable-output-escaping="no"/>
    <xsl:apply-templates select="$errors" />


<xsl:apply-templates select="document('udata://users/registrate')/udata" />
  
</xsl:template>

<xsl:template match="udata[@method = 'registrate']">
    <div class="lk_pers_subsc active_lk_pers_subsc">
        
    <form enctype="multipart/form-data" method="post" action="/users/registrate_do/">
        <div class="cartform">
        <h4>E-mail</h4>
        <input placeholder="E-mail" required="required" value="{$em}" name="email" type="email" onchange=" var e = jQuery(this).next('input'), old = e.val();  e.val(this.value);" class="pers_kont_default"/>
        <input name="login" type="hidden" value="{$em}" class="pers_kont_default"/>
        <h4>Пароль</h4>
        <input placeholder="Пароль" required="required" name="password" type="password" class="pers_kont_default"/>
        <h4>Пароль еще раз</h4>
        <input placeholder="Пароль еще раз" required="required" name="password_confirm" type="password" class="pers_kont_default"/>
        <xsl:apply-templates select="document(concat('udata://data/getCreateForm/', type_id))/udata/group[@name='short_info']/field" mode="form_registrate" />
       
        
        
        
        <hr class="wave" />
        <!-- <div class="captcha">
            <xsl:apply-templates select="document('udata://system/captcha')/udata" />
        </div> -->
        <div class="special-order-v3"><b>Примечание:</b>&br;Поля, помеченные (<span class="mandatory">*</span>), обязательны для заполнения.</div>
        <div class="cart_kont_buttons">
            <input type="submit" value="Отправить"/>
            <div class="clearfix"></div>
        </div>  </div>
         </form>
   </div>
            <!-- запрос подключения полей для ввода дополнительных данных пользователя -->
           
            <!-- запрос подключения captcha -->
            <!-- <xsl:apply-templates select="document('udata://system/captcha')/udata" /> -->
            

</xsl:template>




<xsl:template match="result[@module = 'users'][@method = 'registrate_done']">
     
      
        <p>
            <xsl:text> Регистрация прошла успешно! </xsl:text>
        </p> 
    
       

</xsl:template>

<xsl:template match="result[@module = 'users'][@method = 'activate']">
     
       
        
        <!-- подключение обработчика активации пользователя -->
        <xsl:apply-templates select="document(concat('udata://users/activate/',$param0,'/'))/udata" />
    
</xsl:template>

<xsl:template match="udata[@module = 'users'][@method = 'activate']">
     
 
        <!-- если активация успешна, то происходит перенаправление на стартовую страницу -->
        <xsl:apply-templates select="document('udata://content/redirect/(/users/settings/)/')/udata" />
    
</xsl:template>
    
<xsl:template match="udata[@module = 'users'][@method = 'activate'][error]">
<!-- выведение ошибок, если они произошли -->
 
       
    <xsl:value-of select="error" />
</xsl:template>

<xsl:template match="result[@method = 'forget']">
    <xsl:value-of select="udata/errors" disable-output-escaping="no"/>
    
         <xsl:apply-templates select="$errors" />
 <div class="lk_pers_subsc active_lk_pers_subsc">
        <form id="forget" method="post" action="/users/forget_do/">
            <div class="cartform">
                <fieldset class="forma" id="tab1">
                <div class="box">
                    <label>                   
                            Введите e-mail: 
                    
                    </label>
                    <input type="text"  name="forget_email" />
                </div>
                <div>
                    <input type="submit"  class="submit" value="Отправить" />
                </div>
                </fieldset>
            </div>
        </form>
    </div> 
   
</xsl:template>

<xsl:template match="result[@method = 'forget_do']">
       <xsl:value-of select="udata/errors" disable-output-escaping="no"/>
    
     
            <xsl:text>Вам на почту выслана ссылка для получения нового пароля</xsl:text>
        
    </xsl:template>


    <xsl:template match="result[@method = 'restore']">
      
        
            <xsl:text>На e-mail адрес, указанный Вами при регистрации, был выслан пароль.</xsl:text>
       
    </xsl:template>



<!-- Результат авторизации -->
<xsl:template match="result[@method = 'login_do']">
     
        
        <xsl:if test="@not-permitted = 1">
            <p><xsl:text>Ваших прав недостаточно для просмотра данной страницы</xsl:text></p>
        </xsl:if>
        <xsl:if test="user[@type = 'guest'] and (@method = 'login_do' or @method = 'loginza')">
            <p><xsl:text>Вы ввели неверный логин или пароль. Проверьте раскладку клавиатуры, не нажата ли клавиша «Caps Lock» и попробуйте ввести логин и пароль ещё раз</xsl:text></p>
            <p><a href="/users/forget/">Забыли пароль?</a></p>
              <xsl:apply-templates select="document('udata://users/auth/')/udata" />
        </xsl:if>     
        <xsl:if test="user/@status='auth'">
            <xsl:apply-templates select="document('udata://content/redirect/(/users/settings/)/')/udata" />
        </xsl:if>
      
</xsl:template>


<xsl:template match="result[@method = 'profile']">
     <xsl:if test="user[@type = 'guest']">
        <p><xsl:text>Авторизуйтесь в системе, чтобы войти в личный кабинет</xsl:text></p>
            <p><a href="/users/forget/">Забыли пароль?</a></p>
            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
    </xsl:if>

             


        <div class="lk_bookmarks_items">
            <a href="javascript://" class="active_item_menu">Персональные данные</a>
            <a href="javascript://" class="unactive_item_menu">Каталоги</a>
        </div>

        <div class="lk_pers_subsc active_lk_pers_subsc">

            <form enctype="multipart/form-data" method="post" action="/users/settings_do/">
                <div class="cartform">
                <h4>E-mail</h4>
                <input placeholder="E-mail" required="required" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" name="email" type="email" onchange=" var e = jQuery(this).next('input'), old = e.val();  e.val(this.value);" class="pers_kont_default"/>
                <input name="login" type="hidden" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" class="pers_kont_default"/>
                <h4>Пароль</h4>
                <input placeholder="Пароль"  name="password" type="password" class="pers_kont_default"/>
                <h4>Пароль еще раз</h4>
                <input placeholder="Пароль еще раз"  name="password_confirm" type="password" class="pers_kont_default"/>
                <xsl:apply-templates select="document(concat('udata://data/getEditForm/', user/@id ))/udata/group[@name='short_info']/field" mode="form_registrate" />
               
                
                
                
                <hr class="wave" />
                <!-- <div class="captcha">
                    <xsl:apply-templates select="document('udata://system/captcha')/udata" />
                </div> -->
                <div class="special-order-v3"><b>Примечание:</b>&br;Поля, помеченные (<span class="mandatory">*</span>), обязательны для заполнения.</div>
                <div class="cart_kont_buttons">
                    <input type="submit" value="Отправить"/>
                    <div class="clearfix"></div>
                </div>  </div>
         </form>
        </div>






        <div class="lk_pers_subsc unactive_lk_pers_subsc" style="width: 100%">
            <h2>Полезные ссылки</h2>
            <xsl:apply-templates select="document('udata://menu/draw/410')/udata" mode="leveluser" />
            <h2>Каталоги</h2>
            <xsl:apply-templates select="document('udata://menu/draw/413')/udata" mode="leveluser_catalog" />





            <!-- <form>
                <div class="cartform">
                    <span class="pers_kont_defaults">
                        <h4>Email</h4>
                                    <input placeholder="Имя" required="required" type="text" class="pers_kont_default"/>



                    </span>
                    <div class="cart_kont_buttons">
                        <input type="button" value="Отправить"/>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>

                </div>

            </form> -->
        </div>



</xsl:template>


<xsl:template match="udata" mode="leveluser_catalog">
        <table class="leveluser_catalog">

            <xsl:apply-templates select="item" mode="leveluser_catalog" />
            
        </table>
</xsl:template>


<xsl:template match="item" mode="leveluser_catalog">
    <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page" />
        <tr>
            <td style="width: 200px">
                <a href="{@link}">
                    <xsl:call-template name="thumbing">
                        <xsl:with-param name="source" select="$page/properties/group/property[@name='header_pic']/value" />
                        <xsl:with-param name="width" select="181" />
                        <xsl:with-param name="height">auto</xsl:with-param>
                    </xsl:call-template>
                </a>
            </td>
            <td>
            <h3 style="margin:0px"><xsl:value-of select="@name" disable-output-escaping="yes" /></h3>
            <xsl:value-of select="$page/properties/group/property[@name='content']/value" disable-output-escaping="yes"/>
            <a href="{@link}">Скачать</a>
           </td>

        </tr>
    </xsl:template>

<!-- Страница пользователя -->   
<xsl:template match="result[@method = 'settings']">
     <xsl:if test="user[@type = 'guest']">
        <p><xsl:text>Авторизуйтесь в системе, чтобы войти в личный кабинет</xsl:text></p>
            <p><a href="/users/forget/">Забыли пароль?</a></p>
            <xsl:apply-templates select="document('udata://users/auth/')/udata" />
    </xsl:if>

             


        <div class="lk_bookmarks_items">
            <a href="javascript://" class="active_item_menu">Персональные данные</a>
            <a href="javascript://" class="unactive_item_menu">Каталоги</a>
        </div>

        <div class="lk_pers_subsc active_lk_pers_subsc">

            <form enctype="multipart/form-data" method="post" action="/users/settings_do/">
                <div class="cartform">
                <h4>E-mail</h4>
                <input placeholder="E-mail" required="required" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" name="email" type="email" onchange=" var e = jQuery(this).next('input'), old = e.val();  e.val(this.value);" class="pers_kont_default"/>
                <input name="login" type="hidden" value="{$user-info/udata/object/properties/group/property[@name='login']/value}" class="pers_kont_default"/>
                <h4>Пароль</h4>
                <input placeholder="Пароль"  name="password" type="password" class="pers_kont_default"/>
                <h4>Пароль еще раз</h4>
                <input placeholder="Пароль еще раз"  name="password_confirm" type="password" class="pers_kont_default"/>
                <xsl:apply-templates select="document(concat('udata://data/getEditForm/', user/@id ))/udata/group[@name='short_info']/field" mode="form_registrate" />
               
                
                
                
                <hr class="wave" />
                <!-- <div class="captcha">
                    <xsl:apply-templates select="document('udata://system/captcha')/udata" />
                </div> -->
                <div class="special-order-v3"><b>Примечание:</b>&br;Поля, помеченные (<span class="mandatory">*</span>), обязательны для заполнения.</div>
                <div class="cart_kont_buttons">
                    <input type="submit" value="Отправить"/>
                    <div class="clearfix"></div>
                </div>  </div>
         </form>
        </div>






        <div class="lk_pers_subsc unactive_lk_pers_subsc">

                 <xsl:apply-templates select="document('udata://menu/draw/410')/udata" mode="leveluser" />
            
           <!--  <form>
                <div class="cartform">
    <span class="pers_kont_defaults">
        <h4>Email</h4>
                    <input placeholder="Имя" required="required" type="text" class="pers_kont_default"/>



    </span>
                    <div class="cart_kont_buttons">
                        <input type="button" value="Отправить"/>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>

                </div>

            </form> -->
        </div>


     

</xsl:template>


<xsl:template match="property" mode="prajsy">
    <li><a href="{value}"> <xsl:value-of select="@name" disable-output-escaping="no"/></a></li>
</xsl:template>


    <xsl:template match="group" mode="dop_field">
            <fieldset class="forma" id="tab{@name}">
            
            <xsl:apply-templates select="field" />
            <div>
                <input type="submit"  class="submit" value="Сохранить" />
            </div>
        </fieldset>
        
    </xsl:template>
     <xsl:template match="group" mode="groups">
        <li><a href="#tab{@name}"><xsl:value-of select="@title" disable-output-escaping="no"/></a></li>   
    </xsl:template>

    <xsl:template match="field[@type='int' or @type='string']" mode="form_registrate">

        <h4><xsl:value-of select="@title"/></h4>
        <input placeholder="{@title}" name="{@input_name}" type="text" value="{.}" class="pers_kont_default">
            <xsl:if test="@required">
                <xsl:attribute name="required">
                     required
                </xsl:attribute>
            </xsl:if>
        </input>
        
    </xsl:template>
    <xsl:template match="field[@type='relation']" mode="form_registrate">

        <h4><xsl:value-of select="@title"/></h4>
        <span class="pers_kont_defaults">
            <xsl:apply-templates select="values/item" mode="form_registrate">
                <xsl:with-param name="name" select="@input_name"/>
            </xsl:apply-templates>
        </span>
        
        
    </xsl:template>

    <xsl:template match="item" mode="form_registrate">
        <xsl:param name="name"/>
        <input type="radio" name="{$name}" id="radio{@id}" value="{@id}" class="css-checkbox">
                <xsl:if test="@selected">
                    <xsl:attribute name="checked">
                        checked
                    </xsl:attribute>
                </xsl:if>
        </input>
        <label for="radio{@id}" class="css-label"><xsl:value-of select="." /></label>
    </xsl:template>

    <xsl:template match="field[@type='boolean']" mode="form_registrate">

      
        <span class="perskont_defaults">
            <input  name="{@input_name}" type="checkbox" class="css-checkbox" id="chkbx{@id}">
                <xsl:if test="@checked">
                    <xsl:attribute name="checked">
                        checked
                    </xsl:attribute>
                </xsl:if>
            </input>
            <label for="chkbx{@id}" class="css-label2"><xsl:value-of select="@title"/></label>
        </span>
        
    </xsl:template>

     <xsl:template match="field[@type='date']" mode="form_registrate">

        <h4><xsl:value-of select="@title"/></h4>
        <input type="text" name="{@input_name}" value="{.}" id="pers_date"/>

       
        
    </xsl:template>


   <!--  <xsl:template match="Pattern" mode="QName" priority="Number">
        
    </xsl:template> -->
     
>>>>>>> 2fae45de4042c059b8573aa1a8f6ff71a028e71b
</xsl:stylesheet>