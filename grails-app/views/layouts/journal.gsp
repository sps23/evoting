<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<title>Easy Voting</title>
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="IE=edge" http-equiv="X-UA-Compatible">

<!-- Bootstrap Core CSS -->
<link href="${request.contextPath}/journal/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->

<g:layoutHead />

</head>
<body>
	<div class="container">

		<div id="banner" class="page-header">
			<div class="row">
				<g:render template="/templates/journal/navbar" />
			</div>
		</div>

		<g:render template="/templates/journal/jumbotron" />

		<g:layoutBody />

	</div>
</body>