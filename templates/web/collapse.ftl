<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div
  class="collapse ice-collapse ${contentModel.horizontalCollapsing_b?then('collapse-horizontal', '')}"
  id="${contentModel.id_s!''}"
>
  <div class="card card-body">
    <@crafter.renderComponentCollection $field="content_o" />
  </div>
</@crafter.div>

<#if modePreview>
  <script>
    (() => {
      window.iceBootstrap?.components.collapse.initialize();
    })();
  </script>
</#if>