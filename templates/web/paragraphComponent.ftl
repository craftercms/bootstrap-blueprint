<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.componentRootTag class="${crafter.printIfPreview('paragraph-component-root')}">
    <@crafter.p $field"copy_t">${contentModel.copy_t}</@crafter.p>
</@crafter.componentRootTag>
