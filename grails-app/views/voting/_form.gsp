<%@ page import="evoting.model.Voting" %>



<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="voting.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${votingInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="voting.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${votingInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="voting.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${evoting.model.Creator.list()}" optionKey="id" required="" value="${votingInstance?.creator?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="voting.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${votingInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="voting.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${votingInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'anonymous', 'error')} ">
	<label for="anonymous">
		<g:message code="voting.anonymous.label" default="Anonymous" />
		
	</label>
	<g:checkBox name="anonymous" value="${votingInstance?.anonymous}" />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="voting.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${votingInstance?.creationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'expirationDate', 'error')} required">
	<label for="expirationDate">
		<g:message code="voting.expirationDate.label" default="Expiration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expirationDate" precision="day"  value="${votingInstance?.expirationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'numberOfQuestions', 'error')} required">
	<label for="numberOfQuestions">
		<g:message code="voting.numberOfQuestions.label" default="Number Of Questions" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfQuestions" type="number" value="${votingInstance.numberOfQuestions}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'numberOfVoters', 'error')} required">
	<label for="numberOfVoters">
		<g:message code="voting.numberOfVoters.label" default="Number Of Voters" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfVoters" type="number" value="${votingInstance.numberOfVoters}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'questionList', 'error')} ">
	<label for="questionList">
		<g:message code="voting.questionList.label" default="Question List" />
		
	</label>
	<g:select name="questionList" from="${evoting.model.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${votingInstance?.questionList*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'sendAnswerToVoter', 'error')} ">
	<label for="sendAnswerToVoter">
		<g:message code="voting.sendAnswerToVoter.label" default="Send Answer To Voter" />
		
	</label>
	<g:checkBox name="sendAnswerToVoter" value="${votingInstance?.sendAnswerToVoter}" />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'sendNotification', 'error')} ">
	<label for="sendNotification">
		<g:message code="voting.sendNotification.label" default="Send Notification" />
		
	</label>
	<g:checkBox name="sendNotification" value="${votingInstance?.sendNotification}" />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'sendPartialResults', 'error')} ">
	<label for="sendPartialResults">
		<g:message code="voting.sendPartialResults.label" default="Send Partial Results" />
		
	</label>
	<g:checkBox name="sendPartialResults" value="${votingInstance?.sendPartialResults}" />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'sendResultsToVoters', 'error')} ">
	<label for="sendResultsToVoters">
		<g:message code="voting.sendResultsToVoters.label" default="Send Results To Voters" />
		
	</label>
	<g:checkBox name="sendResultsToVoters" value="${votingInstance?.sendResultsToVoters}" />

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'voterList', 'error')} ">
	<label for="voterList">
		<g:message code="voting.voterList.label" default="Voter List" />
		
	</label>
	<g:select name="voterList" from="${evoting.model.Voter.list()}" multiple="multiple" optionKey="id" size="5" value="${votingInstance?.voterList*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: votingInstance, field: 'votingAnswerList', 'error')} ">
	<label for="votingAnswerList">
		<g:message code="voting.votingAnswerList.label" default="Voting Answer List" />
		
	</label>
	<g:select name="votingAnswerList" from="${evoting.model.VotingAnswer.list()}" multiple="multiple" optionKey="id" size="5" value="${votingInstance?.votingAnswerList*.id}" class="many-to-many"/>

</div>
