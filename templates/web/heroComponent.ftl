<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign columns = contentModel.contentImage_s?has_content && contentModel.showInColumns_b?has_content && contentModel.showInColumns_b />
<#assign darkMode = contentModel.darkMode_b?has_content && contentModel.darkMode_b />

<@crafter.div class="px-4 py-5 my-5 ${(!columns)?then('text-center', '')} ${darkMode?then('bg-dark text-secondary', '')}">
  <#-- TOP IMAGE -->
  <#if contentModel.image_s?has_content>
    <@crafter.img
      $field="image_s"
      class="d-block mx-auto mb-4"
      src="${contentModel.image_s!''}"
      alt=""
      width="${contentModel.imageWidth_i}"
      height="${contentModel.imageHeight_i}"
    />
  </#if>

  <#if columns>
    <div class="container col-xxl-8 px-4 py-5">
      <div class="row align-items-center ${contentModel.showImageAtLeftColumn_b?then('flex-lg-row-reverse', '')}">
 </#if>

  <#-- MAIN CONTENT -->
  <div class="col-lg-6 ${(!columns)?then('mx-auto', '')} mb-5">
    <@crafter.h1
      class="display-5 fw-bold ${crafter.emptyFieldClass(contentModel.title_s)} ${darkMode?then('text-white', '')}"
      $field="title_s"
    >
      ${contentModel.title_s!''}
    </@crafter.h1>
    <@crafter.p class="lead mb-4 ${crafter.emptyFieldClass(contentModel.copy_t)}" $field="copy_t">${contentModel.copy_t!''}</@crafter.p>
    <@crafter.renderComponentCollection
      $field="buttons_o"
      $containerAttributes={ "class": "d-grid gap-2 d-sm-flex ${(!columns)?then('justify-content-sm-center', '')}" }
      $itemTag="span"
    />
  </div>

  <#-- CONTENT IMAGE -->
  <#if contentModel.contentImage_s?has_content>
    <#if columns>
      <div class="col-10 col-sm-8 col-lg-6">
    <#else>
      <div class="overflow-hidden" style="max-height: 30vh;">
        <div class="container px-5">
    </#if>
      <@crafter.img
        $field="contentImage_s"
        src="${contentModel.contentImage_s}"
        class="img-fluid border rounded-3 shadow-lg mb-4"
        alt=""
        width="${contentModel.contentImageWidth_i!''}"
        height="${contentModel.contentImageHeight_i!''}"
        loading="lazy"
      />
    <#if columns>
      </div>
    <#else>
        </div>
      </div>
    </#if>
  </#if>

  <#if columns>
      </div>
    </div>
  </#if>
</@crafter.div>
