<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="${crafter.printIfPreview('features-component-root')}">
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "ice-features row g-4 py-5 row-cols-1 row-cols-lg-3" }
    $itemAttributes={ "class": "col d-flex align-items-start" };
    item, index
  >
    <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
      <#if item.icon_s?has_content>
        <i class="${item.icon_s!''}"></i>
      </#if>
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
