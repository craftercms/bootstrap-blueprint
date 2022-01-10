<#import "/templates/system/common/crafter.ftl" as crafter />

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>${model.title_t}</title>
		<@crafter.head />
    <link rel="stylesheet" href="/static-assets/css/font-awesome/css/all.css" />
	</head>
	<body>
		<@crafter.body_top />
		<@crafter.section>
			<@crafter.renderComponentCollection $field="mainContent_o" />
		</@crafter.section>
		<#--
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
		-->
		<link href="/static-assets/css/bootstrap.min.css" rel="stylesheet">
		<script src="/static-assets/js/bootstrap.bundle${crafter.printIfPreview('.min')}.js"></script>
		<@crafter.body_bottom />
	</body>
</html>
