<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.tag $tag="form" action="${contentModel.action_s!''}">
  <input class="form-control" type="text" placeholder="${contentModel.placeholder_s!''}" aria-label="Search">
</@crafter.tag>