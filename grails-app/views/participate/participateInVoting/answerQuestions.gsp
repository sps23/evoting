<%! import evoting.model.QuestionTypeEnum %>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Answer Questions</title>
</head>
<body>
	<h1>EVoting AnswerQuestions</h1>

	<div class="bs-docs-section clearfix">
		<div class="row">
			<div class="col-lg-12">
				<div class="well bs-component">

					<g:form controller="participate" action="participateInVoting"
						class="form-horizontal">

						<g:each var="index" in="${voting.questionList}" var="question"
							status="indexQ">
							<fieldset>
								<legend>
									${indexQ + 1}.
									${question.text}
									?
								</legend>

								<div class="form-group">

									<g:if test="${question.type == QuestionTypeEnum.SINGLE}">
										<g:set var="answerType" value="radio" />

										<g:each in="${question.answerList}" var="answer"
											status="indexA">
											<div class="col-lg-10">
												<div class="checkbox">
													<label>
														<g:field name="question[${indexQ}].answer" type="${answerType}" multiple="false" />
															${indexA + 1}. ${answer.text}
													</label>
												</div>
											</div>
										</g:each>
<%--
										<g:radioGroup values="${question.answerList}"
											labels="${question.answerList}"
											name="question[${indexQ}].answer">

											<div class="col-lg-10">
												<div class="radio">
													<label> ${it.radio} ${it.label}
													</label>
												</div>
											</div>
										</g:radioGroup>
 --%>
									</g:if>
									<g:elseif test="${question.type == QuestionTypeEnum.MULTIPLE}">
										<g:set var="answerType" value="checkbox" />

										<g:each in="${question.answerList}" var="answer"
											status="indexA">
											<div class="col-lg-10">
												<div class="checkbox">
													<label for="question[${indexQ}].answer[${indexA}]">
														<g:field name="question[${indexQ}].answer[${indexA}]"
															type="${answerType}" multiple="false" /> ${indexA + 1}. ${answer.text}
													</label>
												</div>
											</div>
										</g:each>

									</g:elseif>
									<g:elseif test="${question.type == QuestionTypeEnum.ORDERED}">
										<g:set var="answerType" value="checkbox" />

										<g:each in="${question.answerList}" var="answer"
											status="indexA">
											<div class="col-lg-10">
												<g:select name="question[${indexQ}].answer[${indexA}]"
													from="${1..question.answerList.size()}" />
												${answer.text}
											</div>
										</g:each>
									</g:elseif>

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