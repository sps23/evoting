<%@ page import="evoting.model.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="question.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" min="1" max="10" value="${questionInstance.number}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="question.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${evoting.model.Question$QuestionTypeEnum?.values()}" keys="${evoting.model.Question$QuestionTypeEnum.values()*.name()}" required="" value="${questionInstance?.type?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="question.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="255" required="" value="${questionInstance?.text}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'multiplicity', 'error')} ">
	<label for="multiplicity">
		<g:message code="question.multiplicity.label" default="Multiplicity" />
		
	</label>
	<g:field name="multiplicity" type="number" value="${questionInstance.multiplicity}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'orderedMultiplicity', 'error')} ">
	<label for="orderedMultiplicity">
		<g:message code="question.orderedMultiplicity.label" default="Ordered Multiplicity" />
		
	</label>
	<g:field name="orderedMultiplicity" type="number" value="${questionInstance.orderedMultiplicity}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answerList', 'error')} ">
	<label for="answerList">
		<g:message code="question.answerList.label" default="Answer List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.answerList?}" var="a">
    <li><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="answer" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'answer.label', default: 'Answer')])}</g:link>
</li>
</ul>


</div>

