<%! import evoting.model.QuestionTypeEnum %>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Answer Questions</title>
</head>
<body>
	<h1>EVoting AnswerQuestions</h1>
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
									<g:each in="${questionAnswer.question.answerList}" var="answer"
										status="indexA">
										<div class="col-lg-10">
											<g:if
												test="${questionAnswer.question.type == QuestionTypeEnum.SINGLE}">
												<div class="radio">
													<label> <g:radio
															name="questionAnswerList[${indexQ}].answerList"
															value="${answer.id}"
															checked="${votingAnswer.questionAnswerList[indexQ].answerList.contains(answer)}" />
														${indexA + 1}. ${answer.text}
													</label>
												</div>
											</g:if>
											<g:elseif
												test="${questionAnswer.question.type == QuestionTypeEnum.MULTIPLE}">
												<div class="checkbox">
													<label> <g:checkBox
															name="questionAnswerList[${indexQ}].answerList"
															value="${answer.id}"
															checked="${votingAnswer.questionAnswerList[indexQ].answerList.contains(answer)}" />
														${indexA + 1}. ${answer.text}
													</label>
												</div>
											</g:elseif>
											<g:elseif
												test="${questionAnswer.question.type == QuestionTypeEnum.ORDERED}">
												<label> ${indexA + 1}. <g:select
														name="questionAnswerList[${indexQ}].answerList"
														from="${questionAnswer.question.answerList}"
														optionKey="id" optionValue="text"
														value="${votingAnswer.questionAnswerList[indexQ].answerList[indexA]?.id}" />
												</label>
											</g:elseif>
										</div>
									</g:each>
								</div>
							</fieldset>
						</g:each>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<g:submitButton name="answerQuestions" value="Answer"
									class="btn btn-primary" />
							</div>
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>