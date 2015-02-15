
<%@ page import="evoting.model.QuestionAnswer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionAnswer.label', default: 'QuestionAnswer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-questionAnswer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-questionAnswer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list questionAnswer">
			
				<g:if test="${questionAnswerInstance?.answerList}">
				<li class="fieldcontain">
					<span id="answerList-label" class="property-label"><g:message code="questionAnswer.answerList.label" default="Answer List" /></span>
					
						<g:each in="${questionAnswerInstance.answerList}" var="a">
						<span class="property-value" aria-labelledby="answerList-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionAnswerInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="questionAnswer.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${questionAnswerInstance?.question?.id}">${questionAnswerInstance?.question?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionAnswerInstance?.votingAnswer}">
				<li class="fieldcontain">
					<span id="votingAnswer-label" class="property-label"><g:message code="questionAnswer.votingAnswer.label" default="Voting Answer" /></span>
					
						<span class="property-value" aria-labelledby="votingAnswer-label"><g:link controller="votingAnswer" action="show" id="${questionAnswerInstance?.votingAnswer?.id}">${questionAnswerInstance?.votingAnswer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:questionAnswerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${questionAnswerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
