<%@ page import="evoting.model.QuestionAnswer" %>



<div class="fieldcontain ${hasErrors(bean: questionAnswerInstance, field: 'answerList', 'error')} ">
	<label for="answerList">
		<g:message code="questionAnswer.answerList.label" default="Answer List" />
		
	</label>
	<g:select name="answerList" from="${evoting.model.Answer.list()}" multiple="multiple" optionKey="id" size="5" value="${questionAnswerInstance?.answerList*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionAnswerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="questionAnswer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${evoting.model.Question.list()}" optionKey="id" required="" value="${questionAnswerInstance?.question?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionAnswerInstance, field: 'votingAnswer', 'error')} required">
	<label for="votingAnswer">
		<g:message code="questionAnswer.votingAnswer.label" default="Voting Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="votingAnswer" name="votingAnswer.id" from="${evoting.model.VotingAnswer.list()}" optionKey="id" required="" value="${questionAnswerInstance?.votingAnswer?.id}" class="many-to-one"/>

</div>

