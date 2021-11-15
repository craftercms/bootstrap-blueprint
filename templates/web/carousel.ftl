<#import "/templates/system/common/crafter.ftl" as crafter />

<#if !crafter.isEmptyCollection(contentModel.slides_o)>
  <#assign rootElementId = "bootstrapCarousel_${contentModel.objectId}" />
  <#assign initialActiveSlideIndex = 0 />
  <#assign rootTagAttributes = {} />
  <#if !modePreview>
  <#-- Only add this attribute if not in preview. In preview, we initialize the carousel manually
  to be able to manually cycle or pause based on edit mode being on/off on Crafter CMS -->
    <#assign rootTagAttributes = { "data-bs-ride":"carousel" } />
  </#if>

  <#if contentModel.disableTouchSwiping_b?? && contentModel.disableTouchSwiping_b>
    <#assign rootTagAttributes += { "data-bs-touch":"false" } />
  </#if>

  <#assign carouselClasses = "carousel slide" />
  <#if contentModel.crossfade_b?? && contentModel.crossfade_b >
    <#assign carouselClasses = carouselClasses + ' carousel-fade' />
  </#if>
  <#if contentModel.darkMode_b?? && contentModel.darkMode_b >
    <#assign carouselClasses = carouselClasses + ' carousel-dark' />
  </#if>
  <@crafter.div
    id=rootElementId
    class=carouselClasses
    $attributes=rootTagAttributes
  >
    <#assign attributesByIndex = {} />

    <#-- Insert your head markup here -->
    <#if contentModel.showIndicators_b>
      <div class="carousel-indicators">
        <@crafter.forEach contentModel.slides_o; slide, index>
          <button
            type="button"
            data-bs-target="#${rootElementId}"
            data-bs-slide-to="${index}"
            aria-label="Slide ${index}"
            ${(initialActiveSlideIndex == index)?then('class="active" aria-current="true"', '')}
          ></button>
        </@crafter.forEach>
      </div>
    </#if>

    <@crafter.forEach contentModel.slides_o; slide, index>
      <#assign
        <#-- Used later on the renderRepeatGroup nthItemAttributes. -->
        attributesByIndex = attributesByIndex + { index: { "data-bs-interval": "${slide.delayInterval_i?c}" } }
      />
    </@crafter.forEach>

    <#assign attributesByIndex = attributesByIndex + {
      initialActiveSlideIndex: { "class": "carousel-item active" } + attributesByIndex["${initialActiveSlideIndex}"]!{}
    } />

    <#-- Macro docs @ https://docs.craftercms.org/en/4.0/search.html?q=renderRepeatGroup&check_keywords=yes&area=default -->
    <@crafter.renderRepeatGroup
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
    </@crafter.renderRepeatGroup>

    <#if contentModel.showControls_b>
      <button class="carousel-control-prev" type="button" data-bs-target="#${rootElementId}" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#${rootElementId}" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </#if>
  </@crafter.div>

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
<#elseif modePreview>
  <style>
    .crafter-carousel-no-items {
      display: none;
    }
    .craftercms-ice-on .crafter-carousel-no-items {
      display: flex;
      justify-content: center;
      align-items: center;
      background: #808080;
      color: #fff;
      font-weight: bold;
      width: 100%;
      height: 200px;
    }
  </style>
  <@crafter.div
    class="crafter-carousel-no-items"
  >
    No items have been added to the carousel.
  </@crafter.div>
</#if>
