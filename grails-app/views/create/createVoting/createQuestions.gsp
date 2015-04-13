<%! import evoting.model.QuestionTypeEnum %>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Create</title>
</head>
<body>
	<h1>EVoting CreateQuestions</h1>

	<div class="bs-docs-section clearfix">
		<div class="row">
			<div class="col-lg-12">
				<div class="well bs-component">
					<g:form controller="create" action="createVoting" class="form-horizontal">
						<fieldset>
							<legend>EVoting Voters</legend>
							<g:each var="index" in="${ (0..<numberOfVoters) }">
								<div class="form-group">
									<label for="voterList[${index}].email" class="col-lg-2 control-label">Email${index + 1}
									</label>
									<div class="col-lg-10">
										<g:field type="email" name="voterList[${index}].email"
											class="form-control" />
									</div>
								</div>
							</g:each>
						</fieldset>

						<g:each var="index" in="${ (0..<numberOfQuestions) }">
							<fieldset>
								<legend>
									Question${index + 1}
								</legend>
								<g:hiddenField name="questionList[${index}].number" value="${index + 1}"/>
								<div class="form-group">
									<label for="questionList[${index}].text" class="col-lg-2 control-label">Content</label>
									<div class="col-lg-10">
										<g:textArea name="questionList[${index}].text"
											placeholder="Content of question" class="form-control"
											rows="3" />
									</div>
								</div>
								<div class="form-group">
									<label for="questionList[${index}].type" class="col-lg-2 control-label">Type</label>
									<div class="col-lg-10">
										<g:select name="questionList[${index}].type"
											from="${QuestionTypeEnum.values()}"
											value="${QuestionTypeEnum}" />
									</div>
								</div>
								<div class="form-group">
									<label for="questionList[${index}].multiplicity" class="col-lg-2 control-label">Multiplicity</label>
									<div class="col-lg-10">
										<g:field name="questionList[${index}].multiplicity"
											type="number" min="1" max="10"/>
									</div>
								</div>
								<div class="form-group">
									<label for="questionList[${index}].answerString" class="col-lg-2 control-label">Answers</label>
									<div class="col-lg-10">
										<g:textArea name="questionList[${index}].answerString"
											placeholder="Answers (each in separate line)"
											class="form-control" rows="5" />
									</div>
								</div>
							</fieldset>
						</g:each>

						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<g:submitButton name="backToBasics" value="Back to Basics"
									class="btn btn-default" />
								<g:submitButton name="createQuestions" value="Create Summary"
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

