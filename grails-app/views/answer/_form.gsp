<%@ page import="evoting.model.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="answer.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" min="1" max="10" value="${answerInstance.number}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="answer.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="255" required="" value="${answerInstance?.text}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="answer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${evoting.model.Question.list()}" optionKey="id" required="" value="${answerInstance?.question?.id}" class="many-to-one"/>

</div>

