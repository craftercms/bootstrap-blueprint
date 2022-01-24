<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign attributesByIndex = {} />
<@crafter.forEach contentModel.items_o; item, index>
  <#assign itemClasses = "btn ice-btn btn-${item.outlined_b?then('outline-', '')}${item.color_s} ${item.size_s!''}" />

  <#assign extraAttributes = {} />

  <#if item.target_s?has_content>
    <#assign extraAttributes = extraAttributes + { "data-bs-target": "#" + item.target_s } />
  </#if>

  <#if item.toggleType_s?has_content>
    <#assign extraAttributes = extraAttributes + { "data-bs-toggle": item.toggleType_s } />
    <#if item.toggleType_s == 'collapse'>
      <#assign extraAttributes = extraAttributes + { "aria-expanded": "false", "aria-controls": item.target_s } />
    </#if>
  </#if>

  <#assign
    <#-- Used later on the renderRepeatGroup nthItemAttributes. -->
    attributesByIndex = attributesByIndex + { index: { "class": itemClasses } + extraAttributes }
  />
</@crafter.forEach>

<@crafter.div>
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "btn-group ${contentModel.vertical_b?then('btn-group-vertical', '')}" }
    $nthItemAttributes=attributesByIndex
    $itemTag="button";
    item, index
  >
    <@crafter.span $field="items_o.text_s" $index="${index}">
      ${item.text_s!''}
    </@crafter.span>
  </@crafter.renderRepeatGroup>
</@crafter.div>
