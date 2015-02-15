<%@ page import="evoting.model.VotingAnswer" %>



<div class="fieldcontain ${hasErrors(bean: votingAnswerInstance, field: 'questionAnswerList', 'error')} ">
	<label for="questionAnswerList">
		<g:message code="votingAnswer.questionAnswerList.label" default="Question Answer List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${votingAnswerInstance?.questionAnswerList?}" var="q">
    <li><g:link controller="questionAnswer" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="questionAnswer" action="create" params="['votingAnswer.id': votingAnswerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'questionAnswer.label', default: 'QuestionAnswer')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: votingAnswerInstance, field: 'submissionDate', 'error')} required">
	<label for="submissionDate">
		<g:message code="votingAnswer.submissionDate.label" default="Submission Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="submissionDate" precision="day"  value="${votingAnswerInstance?.submissionDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: votingAnswerInstance, field: 'voter', 'error')} ">
	<label for="voter">
		<g:message code="votingAnswer.voter.label" default="Voter" />
		
	</label>
	<g:select id="voter" name="voter.id" from="${evoting.model.Voter.list()}" optionKey="id" value="${votingAnswerInstance?.voter?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

