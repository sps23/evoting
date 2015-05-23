
<%@ page import="evoting.model.VotingAnswer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'votingAnswer.label', default: 'VotingAnswer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-votingAnswer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-votingAnswer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list votingAnswer">
			
				<g:if test="${votingAnswerInstance?.questionAnswerList}">
				<li class="fieldcontain">
					<span id="questionAnswerList-label" class="property-label"><g:message code="votingAnswer.questionAnswerList.label" default="Question Answer List" /></span>
					
						<g:each in="${votingAnswerInstance.questionAnswerList}" var="q">
						<span class="property-value" aria-labelledby="questionAnswerList-label"><g:link controller="questionAnswer" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${votingAnswerInstance?.submissionDate}">
				<li class="fieldcontain">
					<span id="submissionDate-label" class="property-label"><g:message code="votingAnswer.submissionDate.label" default="Submission Date" /></span>
					
						<span class="property-value" aria-labelledby="submissionDate-label"><g:formatDate date="${votingAnswerInstance?.submissionDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingAnswerInstance?.voter}">
				<li class="fieldcontain">
					<span id="voter-label" class="property-label"><g:message code="votingAnswer.voter.label" default="Voter" /></span>
					
						<span class="property-value" aria-labelledby="voter-label"><g:link controller="voter" action="show" id="${votingAnswerInstance?.voter?.id}">${votingAnswerInstance?.voter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${votingAnswerInstance?.voting}">
				<li class="fieldcontain">
					<span id="voting-label" class="property-label"><g:message code="votingAnswer.voting.label" default="Voting" /></span>
					
						<span class="property-value" aria-labelledby="voting-label"><g:link controller="voting" action="show" id="${votingAnswerInstance?.voting?.id}">${votingAnswerInstance?.voting?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:votingAnswerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${votingAnswerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
