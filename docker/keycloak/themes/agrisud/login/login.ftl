<#import "template.ftl" as layout>
<link href="https://fonts.googleapis.com/css?family=Rubik:400,400i,500,500i,700,700i&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<div class="kc-base-logo-wrapper">
<div class="agrisud-navbar">
    <div class="agrisud-nav-menus-logo">
       <a target="_blank" rel="noreferrer">
          <img class="nav-image" src="${url.resourcesPath}/${properties.logoImg}" alt="" />
        </a>
    </div>
    <div class="agrisud-navbar-links">
          <div class="agrisud-navbar-links-items">
            <div class="agrisud-navbar-links-item">
              <h6>
                <a href=${properties.elearningUrl} rel="noreferrer">
                  E-Learning
                </a>
              </h6>
            </div>
            <div class="agrisud-navbar-links-item">
              <h6>
                <a href=${properties.mediathequeUrl}  rel="noreferrer">
                  Médiathèque
                </a>
              </h6>
            </div>
            <div class="agrisud-navbar-links-item">
              <h6>
                <a href=${properties.sitewebUrl} rel="noreferrer">
                  Agrisud.org
                </a>
              </h6>
            </div>
            <div>
              <h6 class="agrisud-navbar-links-item">
                <a>Aide<a/>
              </h6>
            </div>
          </div>
        </div>
        </div>
        </div>
<div class="form-container">
    <img id="form-img" class="form-img" src="${url.resourcesPath}/${properties.sideformImg}" />
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section = "header">
        ${msg("loginAccountTitle")}
        <#elseif section = "form">
        <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
            <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div class="${properties.kcFormGroupClass!}">
                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>" />
                            <#else>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autocomplete="off" placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>" />
                            </#if>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" placeholder="${msg("password")}" />
                            <span><i className="fa fa-eye-slash"></i></span>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div id="kc-form-options">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox">
                                        <label>
                                            <div class="toggle">
                                                <#if login.rememberMe??>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                                <#else>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                                </#if>
                                                <div class="dot"></div>
                                            </div>
                                            <div class="label-text">${msg("rememberMe")}</div>
                                        </label>
                                    </div>
                                </#if>
                            </div>
                            <div id="kc-form-register" class="${properties.kcFormOptionsWrapperClass!}">
                                    <span><a tabindex="5" href="${properties.signupUrl}">${msg("doSignUp")}</a></span>
                            </div>
                            <div id="kc-form-reset-psw" class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="6" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>

                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                    </form>
                </#if>
            </div>
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                    <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                        <#list social.providers as p>
                            <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
        <#elseif section = "info" >
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}" >${msg("doRegister")}</a></span>
                </div>
            </#if>
        </#if>

    </@layout.registrationLayout>
</div>
