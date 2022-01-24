<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign imageStyles = ""/>
<#if contentModel.width_i?has_content>
  <#assign imageStyles = imageStyles + "width: " + contentModel.width_i?c + "px; " />
</#if>
<#if contentModel.height_i?has_content>
  <#assign imageStyles = imageStyles + "height: " + contentModel.height_i?c + "px; " />
</#if>
<#assign imageStyles = imageStyles + "object-fit: " + contentModel.objectFit_s />

<#if contentModel.imageLink_s?has_content>
  <a href="${contentModel.imageLink_s}">
</#if>

<@crafter.span>
  <@crafter.img
    $field="image_s"
    src="${contentModel.image_s!''}"
    class="${contentModel.variant_s!''}"
    alt="${contentModel.alt_s!''}"
    style="${imageStyles}"
  />
</@crafter.span>

<#if imageLink_s?has_content>
  </a>
</#if>