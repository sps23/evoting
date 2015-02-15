
<%@ page import="evoting.model.QuestionAnswer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionAnswer.label', default: 'QuestionAnswer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-questionAnswer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-questionAnswer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="questionAnswer.question.label" default="Question" /></th>
					
						<th><g:message code="questionAnswer.votingAnswer.label" default="Voting Answer" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionAnswerInstanceList}" status="i" var="questionAnswerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionAnswerInstance.id}">${fieldValue(bean: questionAnswerInstance, field: "question")}</g:link></td>
					
						<td>${fieldValue(bean: questionAnswerInstance, field: "votingAnswer")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionAnswerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
