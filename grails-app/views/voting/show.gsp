
<%@ page import="evoting.model.Voting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voting.label', default: 'Voting')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-voting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-voting" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list voting">
			
				<g:if test="${votingInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="voting.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${votingInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="voting.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${votingInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="voting.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="creator" action="show" id="${votingInstance?.creator?.id}">${votingInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="voting.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${votingInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="voting.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${votingInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.anonymous}">
				<li class="fieldcontain">
					<span id="anonymous-label" class="property-label"><g:message code="voting.anonymous.label" default="Anonymous" /></span>
					
						<span class="property-value" aria-labelledby="anonymous-label"><g:formatBoolean boolean="${votingInstance?.anonymous}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="voting.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${votingInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.expirationDate}">
				<li class="fieldcontain">
					<span id="expirationDate-label" class="property-label"><g:message code="voting.expirationDate.label" default="Expiration Date" /></span>
					
						<span class="property-value" aria-labelledby="expirationDate-label"><g:formatDate date="${votingInstance?.expirationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.numberOfQuestions}">
				<li class="fieldcontain">
					<span id="numberOfQuestions-label" class="property-label"><g:message code="voting.numberOfQuestions.label" default="Number Of Questions" /></span>
					
						<span class="property-value" aria-labelledby="numberOfQuestions-label"><g:fieldValue bean="${votingInstance}" field="numberOfQuestions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.numberOfVoters}">
				<li class="fieldcontain">
					<span id="numberOfVoters-label" class="property-label"><g:message code="voting.numberOfVoters.label" default="Number Of Voters" /></span>
					
						<span class="property-value" aria-labelledby="numberOfVoters-label"><g:fieldValue bean="${votingInstance}" field="numberOfVoters"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.questionList}">
				<li class="fieldcontain">
					<span id="questionList-label" class="property-label"><g:message code="voting.questionList.label" default="Question List" /></span>
					
						<g:each in="${votingInstance.questionList}" var="q">
						<span class="property-value" aria-labelledby="questionList-label"><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.sendAnswerToVoter}">
				<li class="fieldcontain">
					<span id="sendAnswerToVoter-label" class="property-label"><g:message code="voting.sendAnswerToVoter.label" default="Send Answer To Voter" /></span>
					
						<span class="property-value" aria-labelledby="sendAnswerToVoter-label"><g:formatBoolean boolean="${votingInstance?.sendAnswerToVoter}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.sendNotification}">
				<li class="fieldcontain">
					<span id="sendNotification-label" class="property-label"><g:message code="voting.sendNotification.label" default="Send Notification" /></span>
					
						<span class="property-value" aria-labelledby="sendNotification-label"><g:formatBoolean boolean="${votingInstance?.sendNotification}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.sendPartialResults}">
				<li class="fieldcontain">
					<span id="sendPartialResults-label" class="property-label"><g:message code="voting.sendPartialResults.label" default="Send Partial Results" /></span>
					
						<span class="property-value" aria-labelledby="sendPartialResults-label"><g:formatBoolean boolean="${votingInstance?.sendPartialResults}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.sendResultsToVoters}">
				<li class="fieldcontain">
					<span id="sendResultsToVoters-label" class="property-label"><g:message code="voting.sendResultsToVoters.label" default="Send Results To Voters" /></span>
					
						<span class="property-value" aria-labelledby="sendResultsToVoters-label"><g:formatBoolean boolean="${votingInstance?.sendResultsToVoters}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.voterList}">
				<li class="fieldcontain">
					<span id="voterList-label" class="property-label"><g:message code="voting.voterList.label" default="Voter List" /></span>
					
						<g:each in="${votingInstance.voterList}" var="v">
						<span class="property-value" aria-labelledby="voterList-label"><g:link controller="voter" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${votingInstance?.votingAnswerList}">
				<li class="fieldcontain">
					<span id="votingAnswerList-label" class="property-label"><g:message code="voting.votingAnswerList.label" default="Voting Answer List" /></span>
					
						<g:each in="${votingInstance.votingAnswerList}" var="v">
						<span class="property-value" aria-labelledby="votingAnswerList-label"><g:link controller="votingAnswer" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:votingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${votingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
