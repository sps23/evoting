<%@ page import="evoting.model.Voting"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="clean-blog" />
<title>EVoting Create</title>
</head>
<body>
	<h1>EVoting CreateBasics</h1>
	<p>
		voting =
		${voting}
	</p>

	<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
		<p>Fill in basic data of your Voting</p>

		<g:form>

			<%--<div class="row control-group">
				<div class="form-group col-xs-12 floating-label-form-group controls">
					<label>Name</label> <input id="name" class="form-control"
						type="text"
						data-validation-required-message="Please enter your name."
						required="" placeholder="Name">
					<p class="help-block text-danger"></p>
				</div>
			</div>--%>


			<div class="row control-group">
				<div class="form-group col-xs-12 floating-label-form-group controls">
					<label for="name">Name</label>
					<g:textArea name="name" value="${voting.name}" placeholder="Name" />
					<p class="help-block text-danger"></p>
				</div>
			</div>

			<div class="row control-group">
				<div class="form-group col-xs-12 floating-label-form-group controls">
					<label for="description">Description</label>
					<g:textArea name="description" value="${voting.description}"
						placeholder="Description" />
					<p class="help-block text-danger"></p>
				</div>
			</div>

			<div class="row control-group">
				<div class="form-group col-xs-12 floating-label-form-group controls">
					<label for="anonymous">
					   <g:message code="voting.anonymous.label" default="Anonymous" />
					</label>
					<g:checkBox name="anonymous" value="${voting.anonymous}" />
				</div>
			</div>

			<br>
			<div class="row">
				<div class="form-group col-xs-12">
					<%--<button class="btn btn-default" type="submit">Send</button>--%>
					<g:submitButton name="next" event="createQuestions"
						value="Create Questions" class="btn btn-default" />
				</div>
			</div>
		</g:form>
	</div>

	<%--<g:link event="createQuestions">To Create Questions</g:link>--%>
</body>
</html>
