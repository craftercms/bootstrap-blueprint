<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="progress" style="${(contentModel.height_i?has_content)?then('height: ' + contentModel.height_i + 'px', '')}">
  <div
    class="progress-bar bg-${contentModel.color_s} ${contentModel.striped_b?then('progress-bar-striped', '')} ${contentModel.animatedStripes_b?then('progress-bar-animated', '')}"
    role="progressbar"
    style="width: ${contentModel.progress_i}%;"
    aria-valuenow="${contentModel.progress_i}"
    aria-valuemin="0"
    aria-valuemax="100"
  >
    ${contentModel.showLabel_b?then(contentModel.progress_i + '%', '')}
  </div>
</@crafter.div>