<%! import evoting.model.QuestionTypeEnum %>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Participate Summary</title>
</head>
<body>
	<h1>EVoting Participate Summary</h1>
	<div class="panel panel-default">
		<div class="panel-heading">VOTER</div>
		<div class="panel-body">
			${voter.email}
		</div>
	</div>

	<div class="bs-docs-section clearfix">
		<div class="row">
			<div class="col-lg-12">
				<div class="well bs-component">

					<g:form controller="participate" action="participateInVoting"
						class="form-horizontal">

						<g:each in="${votingAnswer.questionAnswerList}"
							var="questionAnswer" status="indexQ">
							<fieldset>
								<legend>
									${indexQ + 1}.
									${questionAnswer.question.text}
									?
								</legend>

								<div class="form-group">
									<g:each in="${questionAnswer.answerList}" var="answer"
										status="indexA">
										<div class="col-lg-10">
											<div class="checkbox">
												<g:if
													test="${questionAnswer.question.type == QuestionTypeEnum.SINGLE}">
													<label> ${answer.text}
													</label>
												</g:if>
												<g:elseif
													test="${questionAnswer.question.type == QuestionTypeEnum.MULTIPLE}">
													<label> ${answer.text}
													</label>
												</g:elseif>
												<g:elseif
													test="${questionAnswer.question.type == QuestionTypeEnum.ORDERED}">
													<label> ${indexA + 1}. ${answer.text}
													</label>
												</g:elseif>
											</div>
										</div>
									</g:each>
								</div>
							</fieldset>
						</g:each>


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
