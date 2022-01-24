<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign rootAttributes = {
  "aria-labelledby": "offcanvas-${contentModel.objectId}-label",
  "data-bs-scroll": "${contentModel.enableScroll_b?then('true', 'false')}",
  "data-bs-backdrop": "${contentModel.showBackdrop_b?then('true', 'false')}"
} />

<#if contentModel.id_s?has_content>
  <#assign rootAttributes = rootAttributes + { "id": "${contentModel.id_s}" } />
</#if>

<@crafter.div
  class="offcanvas offcanvas-${contentModel.placement_s}"
  tabindex="-1"
  $attributes=rootAttributes
>
  <div class="offcanvas-header">
    <@crafter.h5
      class="offcanvas-title ${crafter.emptyFieldClass(contentModel.title_s)}"
      id="offcanvas-${contentModel.objectId}-label"
    >
      ${contentModel.title_s!''}
    </@crafter.h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <@crafter.renderComponentCollection $field="content_o" />
  </div>
</@crafter.div>

<#if modePreview>
  <@crafter.div class="craftercms-edit-field" />
</#if>