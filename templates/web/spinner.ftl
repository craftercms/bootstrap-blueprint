<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="${contentModel.type_s} ${contentModel.color_s} ${(contentModel.useSmallSize_b?then(contentModel.type_s+'sm', ''))}" role="status">
  <span class="visually-hidden">${contentModel.visuallyHiddenLabel_s!''}...</span>
</@crafter.div>