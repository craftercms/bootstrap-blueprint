<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.componentRootTag $tag="span">
  <@crafter.img
    $field="image_s"
    src="${contentModel.image_s!''}"
    class="${contentModel.variant_s!''}"
    alt="${contentModel.alt_s!''}"
  />
</@crafter.componentRootTag>
