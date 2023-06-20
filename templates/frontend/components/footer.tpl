{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</div><!-- pkp_structure_main -->

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<div class="pkp_structure_sidebar left" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">



<div class="pkp_block">
<span class="title">{translate key="user.username"}</span>
<form class="cmp_form cmp_form login" id="login" method="post"
action="/index.php/docencia/login/signIn">                                                                                                                                                   
        {csrf}
       
        {if $error}
            <div class="pkp_form_error">
                {translate key=$error reason=$reason}
            </div>
        {/if}
       
        <input type="hidden" name="source"
value="{$source|strip_unsafe_html|escape}" />
       
        <fieldset class="fields">
            <div class="username">
                <label>
                    <span class="label">
                        {translate key="user.username"}
                        <span class="required">*</span>
                        <span class="pkp_screen_reader">
                            {translate key="common.required"}
                        </span>
                    </span>
                    <input type="text" name="username" id="username"
value="{$username|escape}" maxlength="32" required>
                </label>
            </div>
            <div class="password">
                <label>
                    <span class="label">
                        {translate key="user.password"}
                        <span class="required">*</span>
                        <span class="pkp_screen_reader">
                            {translate key="common.required"}
                        </span>
                    </span>
                    <input type="password" name="password" id="password"
value="{$password|escape}" password="true" maxlength="32" required>
                    <a href="{url page="login" op="lostPassword"}">
                        {translate key="user.login.forgotPassword"}
                    </a>
                </label>
            </div>
            <div class="remember checkbox">
                <label>
                    <input type="checkbox" name="remember" id="remember"
value="1" checked="$remember">
                    <span class="label">
                        {translate key="user.login.rememberUsernameAndPassword"}
                    </span>
                </label>
            </div>
            <div class="buttons">
                <button class="submit" type="submit">
                    {translate key="user.login"}
                </button>
       
                {if !$disableUserReg}
                    {capture assign=registerUrl}{url page="user" op="register"
source=$source}{/capture}
                    <a href="{$registerUrl}" class="register">
                        {translate key="user.login.registerNewAccount"}
                    </a>
                {/if}
            </div>
        </fieldset>
    </form>

</div>



				{$sidebarCode}
			</div><!-- pkp_sidebar.left -->
		{/if}
	{/if}
</div><!-- pkp_structure_content -->

<div class="pkp_structure_footer_wrapper" role="contentinfo">
	<a id="pkp_content_footer"></a>

	<div class="pkp_structure_footer">

		{if $pageFooter}
			<div class="pkp_footer_content">
                <div class="laureate"><img src="/public/site/images/laureate.png"></div>
				<div class="footer-content">{$pageFooter}</div>
                <div class="innova"><img src="/public/site/images/innova.png"></div>
			</div>
		{/if}

		
	</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
