
<%@ page import="evoting.model.Voter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voter.label', default: 'Voter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-voter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-voter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'voter.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="token" title="${message(code: 'voter.token.label', default: 'Token')}" />
					
						<g:sortableColumn property="lastVisitDate" title="${message(code: 'voter.lastVisitDate.label', default: 'Last Visit Date')}" />
					
						<g:sortableColumn property="submitDate" title="${message(code: 'voter.submitDate.label', default: 'Submit Date')}" />
					
						<th><g:message code="voter.voting.label" default="Voting" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${voterInstanceList}" status="i" var="voterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${voterInstance.id}">${fieldValue(bean: voterInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: voterInstance, field: "token")}</td>
					
						<td><g:formatDate date="${voterInstance.lastVisitDate}" /></td>
					
						<td><g:formatDate date="${voterInstance.submitDate}" /></td>
					
						<td>${fieldValue(bean: voterInstance, field: "voting")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${voterInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
