<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.tag $tag="main" class="ice-form-signin-container">
  <div class="ice-form-signin text-center">
    <form>
      <#if contentModel.logo_s?has_content>
        <@crafter.img
          class="mb-4"
          $field="logo_s"
          src="${contentModel.logo_s!''}"
          width="${contentModel.logoWidth_i!''}"
          height="${contentModel.logoHeight_i!''}"
        />
      </#if>

      <@crafter.h1
        $field="signInLabel_s"
        class="h3 mb-3 fw-normal ${crafter.emptyFieldClass(contentModel.signInLabel_s)}"
      >
        ${contentModel.signInLabel_s!''}
      </@crafter.h1>

      <div class="form-floating">
        <input type="email" class="form-control" name="email" id="floatingInput" required>
        <label for="floatingInput">${contentModel.emailLabel_s!''}</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" name="password" id="floatingPassword" required>
        <label for="floatingPassword">${contentModel.passwordLabel_s!''}</label>
      </div>

      <#if contentModel.showRememberMe_b>
        <div class="checkbox mb-3">
          <label>
            <input type="checkbox" value="remember-me"
              class="${crafter.emptyFieldClass(contentModel.rememberMeLabel_s)}"> ${contentModel.rememberMeLabel_s!''}
            >
          </label>
        </div>
      </#if>
      <button
        class="w-100 btn btn-lg btn-primary ${crafter.emptyFieldClass(contentModel.signInButtonLabel_s)}"
        type="submit"
      >
          <@crafter.span $field="signInButtonLabel_s">${contentModel.signInButtonLabel_s!''}</@crafter.span>
      </button>
    </form>
  </div>
</@crafter.tag>