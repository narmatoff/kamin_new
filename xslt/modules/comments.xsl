<<<<<<< HEAD
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="udata[@module = 'comments'][@method = 'insert']">
        <div class="comment">
            <div class="comment-text"><span>К сожалению, отзывы пока отсутствуют.</span>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="udata[@module = 'comments'][@method = 'insert'][items/item]">
        <xsl:variable name="doc-numpages" select="document(concat('udata://system/numpages/', total, '/', per_page, '/notemplate/p/10'))/udata" />
        <xsl:apply-templates select="items/item" mode="comments.list" />
        <xsl:apply-templates select="$doc-numpages" mode="listing" />
    </xsl:template>







    <xsl:template match="item" mode="comments.list">
        <div class="comment">

            <!-- Автор -->

            <a class="autor_name" name="{@id}">
                <xsl:apply-templates select="document(concat('udata://users/viewAuthor/', @author_id))/udata" />
            </a>

            <!-- Вывод красивой русской даты. Как лучше??? -->

            <h5>

                <xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, './(j)'))/udata"/>

                <xsl:choose>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 1"> января </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 2"> февраля </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 3"> марта </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 4"> апреля </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 5"> мая </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 6"> июня </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 7"> июля </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 8"> августа </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 9"> сентября </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 10"> октября </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 11"> ноября </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 12"> декабря </xsl:when>
                </xsl:choose>

                <xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, './(Y)'))/udata"/>

            </h5>
            <p class="comment-text">
                <xsl:value-of select="." disable-output-escaping="yes" />
            </p>
            <div class="comment-value">
                <!-- Полезен ли Вам отзыв?<a href="#" class="col-g">Да: 1</a><a class="col-b" href="#">Нет: 0</a> -->
            </div>
        </div>
    </xsl:template>









    <xsl:template match="udata[@module = 'users'][@method = 'viewAuthor']">
        <xsl:value-of select="nickname" /></xsl:template>
    <xsl:template match="udata[@module = 'users'][@method = 'viewAuthor'][email]">
        <!-- <a class="author" href="mailto:{email}"> -->
        <xsl:value-of select="nickname" />
        <!-- </a> -->
    </xsl:template>
    <xsl:template match="user" mode="addcomment">
        <xsl:apply-templates select="document(concat('udata://comments/insert/', /result/@pageId))/udata/action" />
    </xsl:template>
    <xsl:template match="user[@type = 'guest']" mode="addcomment">
        <!-- <form class="std-block firm-send" method="post" action="/comments/postnew/{/result/@pageId}" name="form_addcomment" id="form_addcomment"> -->
        <form class="std-block firm-send" method="post" action="/comments/post/{/result/@pageId}/" name="form_addcomment" id="form_addcomment">
            <div class="std-row">
                <label for="comment_name" class="td-label">Имя</label>
                <input class="std-input" type="text" id="comment_name" name="author_nick" placeholder="Представьтесь пожалуйста" />
            </div>
            <div class="std-row">
                <label for="comment_email" class="td-label">e-mail</label>
                <input class="std-input" type="text" id="comment_email" name="author_email" placeholder="Введите ваш e-mail" />
            </div>
            <div class="std-row">
                <label for="comment_text" class="td-label">Отзыв</label>
                <textarea name="comment" id="comment_text" class="std-input" placeholder="Текст отзыва"></textarea>
            </div>
            <xsl:apply-templates select="document('udata://system/captcha')/udata[url]" />
            <div class="std-row">
                <button type="submit">Добавить</button>
            </div>
        </form>
    </xsl:template>
    <xsl:template match="user[@status = 'auth']" mode="addcomment">
        <form class="std-block firm-send" method="post" action="/comments/post/{/result/@pageId}/" name="form_addcomment" id="form_addcomment">
            <!-- <form class="std-block firm-send" method="post" action="/comments/postnew/{/result/@pageId}" name="form_addcomment" id="form_addcomment"> -->
            <div class="std-row">
                <label for="comment_name" class="td-label">Имя</label>
                <input class="std-input" type="text" id="comment_name" name="author_nick" placeholder="Представьтесь пожалуйста" />
            </div>
            <div class="std-row">
                <label for="comment_text" class="td-label">Отзыв</label>
                <textarea name="comment" id="comment_text" class="std-input" placeholder="Текст отзыва"></textarea>
            </div>
            <div class="std-row">
                <button type="submit">Добавить</button>
            </div>
        </form>
    </xsl:template>
    <xsl:template match="udata[@module = 'system'][@method = 'captcha']">
        <fieldset>
            <legend>Введите символы защиты от спама&nbsp;<sup class="asterisk">*</sup>
            </legend>
            <label for="captcha" id="for_captcha" title="Защитный код">
                <div class="input">
                    <input type="text" name="captcha" id="captcha" />
                </div><span><img src="{url}{@random_string}" /></span>
            </label>
        </fieldset>
    </xsl:template>
=======
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="udata[@module = 'comments'][@method = 'insert']">
        <div class="comment">
            <div class="comment-text"><span>На данный товар отзывы еще никто не оставлял.</span>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="udata[@module = 'comments'][@method = 'insert'][items/item]">
        <xsl:variable name="doc-numpages" select="document(concat('udata://system/numpages/', total, '/', per_page, '/notemplate/p/10'))/udata" />
        <xsl:apply-templates select="items/item" mode="comments.list" />
        <xsl:apply-templates select="$doc-numpages" mode="listing" />
    </xsl:template>







    <xsl:template match="item" mode="comments.list">
        <div class="comment">

            <!-- Автор -->

            <a class="autor_name" name="{@id}">
                <xsl:apply-templates select="document(concat('udata://users/viewAuthor/', @author_id))/udata" />
            </a>

            <!-- Вывод красивой русской даты. Как лучше??? -->

            <h5>

                <xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, './(j)'))/udata"/>

                <xsl:choose>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 1"> января </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 2"> февраля </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 3"> марта </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 4"> апреля </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 5"> мая </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 6"> июня </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 7"> июля </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 8"> августа </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 9"> сентября </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 10"> октября </xsl:when>
                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 11"> ноября </xsl:when>

                <xsl:when test="document(concat('udata://system/convertDate/', @publish_time, './(n)'))/udata = 12"> декабря </xsl:when>
                </xsl:choose>

                <xsl:value-of select="document(concat('udata://system/convertDate/', @publish_time, './(Y)'))/udata"/>

            </h5>
            <p class="comment-text">
                <xsl:value-of select="." disable-output-escaping="yes" />
            </p>
            <div class="comment-value">
                <!-- Полезен ли Вам отзыв?<a href="#" class="col-g">Да: 1</a><a class="col-b" href="#">Нет: 0</a> -->
            </div>
        </div>
    </xsl:template>









    <xsl:template match="udata[@module = 'users'][@method = 'viewAuthor']">
        <xsl:value-of select="nickname" /></xsl:template>
    <xsl:template match="udata[@module = 'users'][@method = 'viewAuthor'][email]">
        <!-- <a class="author" href="mailto:{email}"> -->
        <xsl:value-of select="nickname" />
        <!-- </a> -->
    </xsl:template>
    <xsl:template match="user" mode="addcomment">
        <xsl:apply-templates select="document(concat('udata://comments/insert/', /result/@pageId))/udata/action" />
    </xsl:template>
    <xsl:template match="user[@type = 'guest']" mode="addcomment">
        <!-- <form class="std-block firm-send" method="post" action="/comments/postnew/{/result/@pageId}" name="form_addcomment" id="form_addcomment"> -->
        <form class="std-block firm-send" method="post" action="/comments/post/{/result/@pageId}/" name="form_addcomment" id="form_addcomment">
            <div class="std-row">
                <label for="comment_name" class="td-label">Имя</label>
                <input class="std-input" type="text" id="comment_name" name="author_nick" placeholder="Представьтесь пожалуйста" />
            </div>
            <div class="std-row">
                <label for="comment_email" class="td-label">e-mail</label>
                <input class="std-input" type="text" id="comment_email" name="author_email" placeholder="Введите ваш e-mail" />
            </div>
            <div class="std-row">
                <label for="comment_text" class="td-label">Отзыв</label>
                <textarea name="comment" id="comment_text" class="std-input" placeholder="Текст отзыва"></textarea>
            </div>
            <xsl:apply-templates select="document('udata://system/captcha')/udata[url]" />
            <div class="std-row">
                <button type="submit">Добавить</button>
            </div>
        </form>
    </xsl:template>
    <xsl:template match="user[@status = 'auth']" mode="addcomment">
        <form class="std-block firm-send" method="post" action="/comments/post/{/result/@pageId}/" name="form_addcomment" id="form_addcomment">
            <!-- <form class="std-block firm-send" method="post" action="/comments/postnew/{/result/@pageId}" name="form_addcomment" id="form_addcomment"> -->
            <div class="std-row">
                <label for="comment_name" class="td-label">Имя</label>
                <input class="std-input" type="text" id="comment_name" name="author_nick" placeholder="Представьтесь пожалуйста" />
            </div>
            <div class="std-row">
                <label for="comment_text" class="td-label">Отзыв</label>
                <textarea name="comment" id="comment_text" class="std-input" placeholder="Текст отзыва"></textarea>
            </div>
            <div class="std-row">
                <button type="submit">Добавить</button>
            </div>
        </form>
    </xsl:template>
    <xsl:template match="udata[@module = 'system'][@method = 'captcha']">
        <fieldset>
            <legend>Введите символы защиты от спама&nbsp;<sup class="asterisk">*</sup>
            </legend>
            <label for="captcha" id="for_captcha" title="Защитный код">
                <div class="input">
                    <input type="text" name="captcha" id="captcha" />
                </div><span><img src="{url}{@random_string}" /></span>
            </label>
        </fieldset>
    </xsl:template>
>>>>>>> 2fae45de4042c059b8573aa1a8f6ff71a028e71b
</xsl:stylesheet>