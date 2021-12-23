<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="${crafter.printIfPreview('features-component-root')}">
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "ice-features row g-4 py-5 row-cols-1 row-cols-lg-3" }
    $itemAttributes={ "class": "feature col" };
    item, index
  >
    <div class="feature-icon bg-primary bg-gradient">
      <svg class="bi" width="1em" height="1em">
        <use xlink:href="#collection"></use>
      </svg>
    </div>
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
  </@crafter.renderRepeatGroup>
</@crafter.div>
