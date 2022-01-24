<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign divider = contentModel.divider_s!'>'/>
<@crafter.span>
  <@crafter.breadcrumb
    url=contentModel.storeUrl
    root='/site'
    containerElementClass="breadcrumb"
    itemWrapperClass="breadcrumb-item"
    navElementAttributes={'style': '--bs-breadcrumb-divider: \'' + divider + '\''}
  />
</@crafter.span>