<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div>
  <div class="card mb-4 rounded-3 shadow-sm text-center ${(contentModel.pricingColor_s == 'light')?then('', 'border-' + contentModel.pricingColor_s)}">
    <div class="card-header py-3 bg-${contentModel.pricingColor_s!''} ${(contentModel.pricingColor_s == 'light')?then('', 'text-white border-' + contentModel.pricingColor_s)}">
      <@crafter.h4 $field="label_s" class="my-0 fw-normal">${contentModel.label_s}</@crafter.h4>
    </div>
    <div class="card-body">
      <h1 class="card-title pricing-card-title">
        <@crafter.span $field="currency_s">${contentModel.currency_s!''}</@crafter.span>
        <@crafter.span $field="price_i">${contentModel.price_i!''}</@crafter.span>
        <#if contentModel.period_s?has_content>
          <small class="text-muted fw-light">
            /<@crafter.span $field="period_s">${contentModel.period_s!''}</@crafter.span>
          </small>
        </#if>
      </h1>
      <@crafter.renderRepeatGroup
        $field="features_o"
        $containerAttributes={ "class": "list-unstyled mb-4 mt-3" };
        item, index
      >
        <li>${item.feature_s}</li>
      </@crafter.renderRepeatGroup>

      <#if contentModel.buttonLabel_s?has_content>
        <a
          class="w-100 btn btn-lg btn${contentModel.outlinedButton_b?then('-outline', '')}-${contentModel.buttonColor_s!''}"
          href="${contentModel.buttonLink_s!''}"
        >
          ${contentModel.buttonLabel_s}
        </a>
      </#if>
    </div>
  </div>
</@crafter.div>