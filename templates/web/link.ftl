<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign linkClass = "${crafter.emptyFieldClass(contentModel.text_s)}" />

<#if contentModel.showAsButton_b>
  <#assign linkClass = linkClass + " btn btn-${contentModel.color_s}" />
<#else>
  <#assign linkClass = linkClass + " link-${contentModel.color_s}" />
</#if>

<#assign linkAttributes = {} />

<#if contentModel.showAsButton_b>
  <#assign linkAttributes = linkAttributes + { "role": "button" } />
</#if>

<@crafter.span>
  <@crafter.a
    $field="text_s"
    href="${contentModel.link_s!''}"
    class=linkClass
    $attributes=linkAttributes
  >
    ${contentModel.text_s!''}
  </@crafter.a>
</@crafter.span>