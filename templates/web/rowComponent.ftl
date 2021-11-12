<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class=crafter.printIfPreview('row-component-root')>
  <@crafter.renderRepeatGroup
    $containerTag="section"
    $containerAttributes={ "class": "row ${crafter.printIfIsEmptyCollection(contentModel.columns_o)}" }
    $itemTag="div"
    $itemAttributes={ "class": "col" }
    $field="columns_o";
    <#-- Nested content values passed down by the macro: -->
    item, index
  >
    <@crafter.renderComponentCollection
      $field="items_o"
      $fieldCarryover="columns_o"
      $indexCarryover="${index}"
      $model=(contentModel + { "items_o": item.items_o })
    />
    <@crafter.tag
      type="hidden"
      value="col${item.size_s!''}"
      $tag="input"
      $field="columns_o.size_s"
      $index="${index}"
    />
  </@crafter.renderRepeatGroup>
</@crafter.div>
