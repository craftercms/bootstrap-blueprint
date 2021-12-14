<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign extraAttributes = {} />

<#if contentModel.target_s?has_content>
  <#assign extraAttributes = extraAttributes + { "data-bs-target": "#" + contentModel.target_s } />
</#if>
<#if contentModel.toggleType_s?has_content>
  <#assign extraAttributes = extraAttributes + { "data-bs-toggle": contentModel.toggleType_s } />
  <#if contentModel.toggleType_s == 'collapse'>
    <#assign extraAttributes = extraAttributes + { "aria-expanded": "false", "aria-controls": contentModel.target_s } />
  </#if>
</#if>

<@crafter.tag
  $tag="button"
  type="button"
  class="btn ice-btn btn-${contentModel.outlined_b?then('outline-', '')}${contentModel.color_s} ${contentModel.size_s!''}"
  id="btn-${contentModel.objectId}"
  $attributes=extraAttributes
>
  <@crafter.span $field="text_s" class="${crafter.emptyFieldClass(contentModel.text_s)}">
    ${contentModel.text_s!''}
  </@crafter.span>
</@crafter.tag>