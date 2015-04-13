<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Participate Summary</title>
</head>
<body>
	<h1>EVoting Participate Summary</h1>

	<div class="bs-docs-section clearfix">
		<div class="row">
			<div class="col-lg-12">
				<div class="well bs-component">

					<g:form controller="participate" action="participateInVoting"
						class="form-horizontal">
						<fieldset>
							<legend>Provide Authentication Data</legend>
						</fieldset>

						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<g:submitButton name="backToAnswerQuestions"
									value="Back To Answer" class="btn btn-primary" />
								<g:submitButton name="confirmAnswers" value="Confirm"
									class="btn btn-primary" />
							</div>
						</div>
					</g:form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
