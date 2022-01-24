<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="card text-${contentModel.textAlignment_s!''}">
  <#assign imageHeight = (contentModel.topImageHeight_i?has_content)?then(contentModel.topImageHeight_i + 'px', 'auto') />
  <#if contentModel.topImage_s?has_content>
    <@crafter.img
      $field="topImage_s"
      src="${contentModel.topImage_s}"
      class="card-img-top"
      style="height: ${imageHeight}; object-fit: ${contentModel.topImageFit_s!''};"
    />
  </#if>
  <#if contentModel.headerContent_html?has_content>
    <@crafter.div $field="headerContent_html" class="card-header">
      ${contentModel.headerContent_html}
    </@crafter.div>
  </#if>

  <div class="card-body">
    <@crafter.renderComponentCollection $field="bodyContent_o" />
  </div>

  <#if contentModel.footerContent_html?has_content>
    <@crafter.div $field="footerContent_html" class="card-footer">
      ${contentModel.footerContent_html}
    </@crafter.div>
  </#if>
</@crafter.div>