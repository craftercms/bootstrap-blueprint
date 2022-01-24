<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.span>
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerTag="ul"
    $itemTag="li"
    $containerAttributes={ "class": "nav justify-content-${contentModel.horizontalAlignment_s} ${contentModel.vertical_b?then('flex-column', '')} ${contentModel.pills_b?then('nav-pills', '')} ${contentModel.fill_b?then('nav-fill', '')}" }
    $itemAttributes={ "class": "nav-item" };
    item, index
  >
    <@crafter.a
      $field="items_o.title_s"
      $index="${index}"
      class="nav-link ${(index == 0)?then('active', '')} ${item.disabled_b?then('disabled', '')} ${crafter.emptyFieldClass(item.title_s)}"
      href="${item.link_s!''}"
    >
      ${item.title_s!''}
    </@crafter.a>
  </@crafter.renderRepeatGroup>
</@crafter.span>