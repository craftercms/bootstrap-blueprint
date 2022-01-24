<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign attributesByIndex = {} />
<@crafter.forEach contentModel.columns_o; item, index>
  <#assign attributesByIndex = attributesByIndex + { index: { "class": "col" + item.size_s } } />
</@crafter.forEach>

<@crafter.div class=crafter.printIfPreview('row-component-root')>
  <@crafter.renderRepeatGroup
    $containerTag="section"
    $containerAttributes={ "class": "row" }
    $itemTag="div"
    $nthItemAttributes=attributesByIndex
    $field="columns_o";
    <#-- Nested content values passed down by the macro: -->
    item, index
  >
    <#assign columnItemsAttributes = {} />
    <#if item.displayContents_b?? && item.displayContents_b>
      <#assign columnItemsAttributes = { "style": "display: contents" } />
    </#if>

    <@crafter.renderComponentCollection
      $field="items_o"
      $fieldCarryover="columns_o"
      $indexCarryover="${index}"
      $itemAttributes=columnItemsAttributes
      $collection=item.items_o
    />
  </@crafter.renderRepeatGroup>
</@crafter.div>

<#-- display: contents -->
