<%@ page import="evoting.model.Voting"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Create</title>
</head>
<body>
	<h1>EVoting CreateBasics</h1>
	<p>
		voting =
		${voting}
	</p>

	<div class="bs-docs-section clearfix">
		<div class="row">
			<div class="col-lg-12">
				<div class="well bs-component">
					<form class="form-horizontal">
						<fieldset>
							<legend>Legend</legend>
							<div class="form-group">
								<label for="inputEmail" class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<input class="form-control" id="inputEmail" placeholder="Email"
										type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<input class="form-control" id="inputPassword"
										placeholder="Password" type="password">
									<div class="checkbox">
										<label> <input type="checkbox"> Checkbox
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Textarea</label>
								<div class="col-lg-10">
									<textarea class="form-control" rows="3" id="textArea"></textarea>
									<span class="help-block">A longer block of help text
										that breaks onto a new line and may extend beyond one line.</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Radios</label>
								<div class="col-lg-10">
									<div class="radio">
										<label> <input name="optionsRadios"
											id="optionsRadios1" value="option1" checked="" type="radio">
											Option one is this
										</label>
									</div>
									<div class="radio">
										<label> <input name="optionsRadios"
											id="optionsRadios2" value="option2" type="radio">
											Option two can be something else
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="select" class="col-lg-2 control-label">Selects</label>
								<div class="col-lg-10">
									<select class="form-control" id="select">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select> <br> <select multiple="" class="form-control">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%--
	<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
		<p>Fill in basic data of your Voting</p>

		<g:form>

			<div class="row control-group">
				<div class="form-group col-xs-12 floating-label-form-group controls">
					<label>Name</label> <input id="name" class="form-control"
						type="text"
						data-validation-required-message="Please enter your name."
						required="" placeholder="Name">
					<p class="help-block text-danger"></p>
				</div>
			</div>


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
					<button class="btn btn-default" type="submit">Send</button>
					<g:submitButton name="next" event="createQuestions"
						value="Create Questions" class="btn btn-default" />
				</div>
			</div>
		</g:form>
	</div>--%>

	<%--<g:link event="createQuestions">To Create Questions</g:link>--%>
</body>
</html>
