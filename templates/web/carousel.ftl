<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign rootElementId = "bootstrapCarousel_${contentModel.objectId}" />
<#assign initialActiveSlideIndex = 0 />
<#assign rootTagAttributes = {} />
<#if !modePreview>
  <#-- Only add this attribute if not in preview. In preview, we initialize the carousel manually
  to be able to manually cycle or pause based on edit mode being on/off on Crafter CMS -->
  <#assign rootTagAttributes = { "data-bs-ride":"carousel" } />
</#if>

<@crafter.componentRootTag
  id=rootElementId
  class="carousel slide"
  $attrs=rootTagAttributes
  $tag="div"
>

  <#assign attributesByIndex = {} />

  <#-- Insert your head markup here -->
  <div class="carousel-indicators">
    <@crafter.forEach contentModel.slides_o; slide, index>
      <#assign
        <#-- Used later on the renderRepeatCollection nthItemAttributes. Just taking advantage of this loop. -->
        attributesByIndex = attributesByIndex + { index: { "data-bs-interval": "${slide.delayInterval_i?c}" } }
      />
      <button
        type="button"
        data-bs-target="#${rootElementId}"
        data-bs-slide-to="${index}"
        aria-label="Slide ${index}"
        ${(initialActiveSlideIndex == index)?then('class="active" aria-current="true"', '')}
      ></button>
    </@crafter.forEach>
  </div>

  <#assign attributesByIndex = attributesByIndex + {
    initialActiveSlideIndex: { "class": "carousel-item active" } + attributesByIndex["${initialActiveSlideIndex}"]
  } />

  <#-- Macro docs @ https://docs.craftercms.org/en/4.0/search.html?q=renderRepeatCollection&check_keywords=yes&area=default -->
  <@crafter.renderRepeatCollection
    $field="slides_o"
    $containerAttributes={ "class": "carousel-inner" }
    $itemAttributes={ "class": "carousel-item" }
    $nthItemAttributes=attributesByIndex;
    item, index
  >
    <@crafter.img
      $field="slides_o.image_s"
      $index="${index}"
      src="${item.image_s}"
      class="d-block w-100"
      alt=""
    />
    <#if item.caption_html?has_content>
      <div class="carousel-caption d-none d-md-block">
        <@crafter.div $field="slides_o.caption_html" $index="${index}">${item.caption_html!''}</@crafter.div>
      </div>
    </#if>
  </@crafter.renderRepeatCollection>

  <button class="carousel-control-prev" type="button" data-bs-target="#${rootElementId}" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#${rootElementId}" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>

</@crafter.componentRootTag>

<#if modePreview>
<script>
  window.addEventListener('DOMContentLoaded', () => {
    const carousel = bootstrap.Carousel.getOrCreateInstance(document.getElementById('${rootElementId}'));
    carousel.cycle();
    document.addEventListener('craftercms.editMode', (e) => {
      const isEditMode = e.detail;
      if (isEditMode) {
        carousel.pause();
      } else {
        carousel.cycle();
      }
    }, false);
  });
</script>
</#if>
