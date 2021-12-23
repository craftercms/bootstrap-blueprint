<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="${crafter.printIfPreview('paragraph-component-root')}">
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" }
    $itemAttributes={ "class": "col" };
    item, index
  >
    <div class="card shadow-sm">
      <#assign imageStyles = "width: 100%;" />
      <#if contentModel.imagesHeight_i?has_content>
        <#assign imageStyles = imageStyles + " height: " + contentModel.imagesHeight_i + "px;" />
      </#if>
      <#if contentModel.imageFit_s?has_content>
        <#assign imageStyles = imageStyles + " object-fit: " + contentModel.imageFit_s />
      </#if>

      <@crafter.img
        $field="items_o.image_s"
        $index="${index}"
        src="${item.image_s}"
        class="bd-placeholder-img card-img-top img-fluid"
        style="${imageStyles}"
        alt=""
      />
      <div class="card-body">
        <@crafter.div
          $field="items_o.description_html"
          $index="${index}"
          class="card-text ${crafter.emptyFieldClass(item.description_html)}"
        >
          ${item.description_html}
        </@crafter.div>
        <div class="d-flex justify-content-between align-items-center">
          <@crafter.tag
            $tag="button"
            type="button"
            $field="items_o.actionButtonLabel_s"
            $index="${index}"
            class="btn btn-sm btn-outline-secondary ${crafter.emptyFieldClass(item.actionButtonLabel_s)}"
          >
            ${item.actionButtonLabel_s!''}
          </@crafter.tag>

          <@crafter.tag
            $tag="small"
            $field="items_o.extraDetail_s"
            $index="${index}"
            class="text-muted ${crafter.emptyFieldClass(item.extraDetail_s)}"
          >
            ${item.extraDetail_s!''}
          </@crafter.tag>
        </div>
      </div>
    </div>
  </@crafter.renderRepeatGroup>
</@crafter.div>