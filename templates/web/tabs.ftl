<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign objectId = contentModel.objectId />

<@crafter.span class="${contentModel.vertical_b?then('d-flex align-items-start', '')}">
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerTag="ul"
    $itemTag="li"
    $containerAttributes={
      "class": "nav ${contentModel.vertical_b?then('flex-column nav-pills me-3', 'nav-tabs')} justify-content-${contentModel.tabsHorizontalAlignment_s} ${contentModel.pills_b?then('nav-pills', '')} ${contentModel.fill_b?then('nav-fill', '')}",
      "role": "tablist"
    }
    $itemAttributes={ "class": "nav-item", "role": "presentation" };
    item, index
  >
    <button
      class="ice-btn nav-link ${(index == 0)?then('active', '')}"
      id="tabs-${objectId}-${index}-tab"
      data-bs-toggle="tab"
      data-bs-target="#tabs-${objectId}-${index}"
      type="button"
      role="tab"
      aria-controls="tabs-${objectId}-${index}"
      aria-selected="${(index == 0)?then('true', 'false')}"
    >
      <@crafter.span $field="items_o.title_s" $index="${index}" class="${crafter.emptyFieldClass(item.title_s)}">
        ${item.title_s!''}
      </@crafter.span>
    </button>
  </@crafter.renderRepeatGroup>

  <#assign attributesByIndex = {} />
  <@crafter.forEach contentModel.items_o; item, index>
    <#assign itemClasses = "tab-pane fade">
    <#if index == 0>
      <#assign itemClasses = itemClasses + " show active">
    </#if>
    <#assign
      attributesByIndex = attributesByIndex + { index:
        {
          "class": itemClasses,
          "role": "tabpanel",
          "id": "tabs-${objectId}-${index}",
          "aria-labelledby": "tabs-${objectId}-${index}-tab"
        }
      }
    />
  </@crafter.forEach>

  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "tab-content" }
    $nthItemAttributes=attributesByIndex;
    item, index
  >
    <@crafter.renderComponentCollection
      $field="content_o"
      $fieldCarryover="items_o"
      $indexCarryover="${index}"
      $collection=item.content_o
    />
  </@crafter.renderRepeatGroup>
</@crafter.span>