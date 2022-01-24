<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign attributesByIndex = {} />
<@crafter.forEach contentModel.items_o; item, index>
  <#assign itemClasses = "list-group-item ${(contentModel.actionableItems_b)?then('list-group-item-action', '')} ${item.active_b?then('active', '')} ${item.disabled_b?then('disabled', '')} list-group-item-${item.color_s!'default'}" />
  <#if contentModel.actionableItems_b>
    <#assign
      <#-- Used later on the renderRepeatGroup nthItemAttributes. -->
      attributesByIndex = attributesByIndex + { index: { "class": itemClasses, "href": item.link_s!'#' } }
    />
  <#else>
    <#assign
      <#-- Used later on the renderRepeatGroup nthItemAttributes. -->
      attributesByIndex = attributesByIndex + { index: { "class": itemClasses } }
    />
  </#if>
</@crafter.forEach>

<@crafter.div>
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "list-group ${contentModel.flush_b?then('list-group-flush', '')} ${contentModel.numbered_b?then('list-group-numbered', '')} ${contentModel.horizontal_b?then('list-group-horizontal', '')}" }
    $nthItemAttributes=attributesByIndex
    $itemTag="${contentModel.actionableItems_b?then('a', 'div')}";
    item, index
  >
    <@crafter.renderComponentCollection
      $field="content_o"
      $fieldCarryover="items_o"
      $indexCarryover="${index}"
      $containerAttributes={ "class": "d-inline-block" }
      $collection=item.content_o
    />
  </@crafter.renderRepeatGroup>
</@crafter.div>
