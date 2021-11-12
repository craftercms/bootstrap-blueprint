<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="px-4 py-5 my-5 text-center">
	<img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
	<@crafter.h1 class="display-5 fw-bold" $field="title_s">${contentModel.title_s}</@crafter.h1>
	<div class="col-lg-6 mx-auto">
		<@crafter.p class="lead mb-4" $field="copy_t">${contentModel.copy_t}</@crafter.p>
		<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			<button type="button" class="btn btn-primary btn-lg px-4 gap-3">Primary button</button>
			<button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button>
		</div>
	</div>
</@crafter.div>
