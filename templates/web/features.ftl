<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="${crafter.printIfPreview('features-component-root')}">
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "ice-features row g-4 py-5 row-cols-1 row-cols-lg-3" }
    $itemAttributes={ "class": "col d-flex align-items-start" };
    item, index
  >
    <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
      <#-- TODO: figure out how to integrate icons in bp -->
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-collection-play" viewBox="0 0 16 16">
        <path d="M2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1zm2.765 5.576A.5.5 0 0 0 6 7v5a.5.5 0 0 0 .765.424l4-2.5a.5.5 0 0 0 0-.848l-4-2.5z"/>
        <path d="M1.5 14.5A1.5 1.5 0 0 1 0 13V6a1.5 1.5 0 0 1 1.5-1.5h13A1.5 1.5 0 0 1 16 6v7a1.5 1.5 0 0 1-1.5 1.5h-13zm13-1a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-.5-.5h-13A.5.5 0 0 0 1 6v7a.5.5 0 0 0 .5.5h13z"/>
      </svg>
    </div>
    <div>
      <@crafter.h2 $field="items_o.title_s" $index="${index}" class="${crafter.emptyFieldClass(item.title_s)}">
        ${item.title_s}
      </@crafter.h2>
      <@crafter.div $field="items_o.text_html" $index="${index}" class="${crafter.emptyFieldClass(item.text_html)}">
        ${item.text_html}
      </@crafter.div>
      <@crafter.a
        $field="items_o.buttonText_s"
        $index="${index}"
        href="${item.buttonLink_s!''}"
        class="btn btn${item.buttonOutlined_b?then('-outline', '')}-${item.buttonColor_s!''} icon-link ${crafter.emptyFieldClass(item.buttonText_s)}"
      >
        ${item.buttonText_s!''}
      </@crafter.a>
    </div>
  </@crafter.renderRepeatGroup>
</@crafter.div>
