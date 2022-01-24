<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign objectId = contentModel.objectId />

<@crafter.div class="${contentModel.direction_s!'dropdown'} ice-dropdown">
  <button
    class="btn btn-${contentModel.color_s!'primary'} ${contentModel.size_s!''} dropdown-toggle"
    type="button"
    id="${objectId}-dropdownMenuButton"
    data-bs-toggle="dropdown"
    aria-expanded="false"
  >
    <@crafter.span $field="buttontext_s" class="${crafter.emptyFieldClass(contentModel.buttontext_s)}">
      ${contentModel.buttontext_s!''}
    </@crafter.span>
  </button>

  <#assign containerClasses = 'dropdown-menu ' + contentModel.darkDropdown_b?then('dropdown-menu-dark', '') />
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": containerClasses, "aria-labelledby": "${objectId}-dropdownMenuButton" }
    $containerTag="ul"
    $itemTag="li";
    item, index
  >
    <#if item.type_s == 'dropdown-item'>
      <@crafter.a $field="items_o.text_s" $index=index class="dropdown-item" href="${item.link_s}">
        ${item.text_s!''}
      </@crafter.a>
    <#elseif item.type_s == 'dropdown-header'>
      <@crafter.h6 $field="items_o.text_s" $index=index class="dropdown-header">
        ${item.text_s!''}
      </@crafter.h6>
    <#elseif item.type_s == 'dropdown-divider'>
      <hr class="dropdown-divider" />
    </#if>
  </@crafter.renderRepeatGroup>
</@crafter.div>

<#if modePreview>
  <script>
    (() => {
      window.iceBootstrap?.components.dropdown.initialize("${objectId}-dropdownMenuButton");
    })();
  </script>
</#if>