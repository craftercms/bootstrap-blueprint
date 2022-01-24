<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="card bg-${contentModel.color_s!''} ${(contentModel.color_s == 'light')?then('', 'text-white')} text-center p-3">
  <figure class="mb-0">
    <blockquote class="blockquote">
      <@crafter.p $field="quote_s">${contentModel.quote_s!''}</@crafter.p>
    </blockquote>
    <figcaption class="blockquote-footer mb-0 text-white">
      <@crafter.span
        $field="author_s"
        class="${crafter.emptyFieldClass(contentModel.author_s)}"
      >
        ${contentModel.author_s!''}
      </@crafter.span>
    </figcaption>
  </figure>
</@crafter.div>