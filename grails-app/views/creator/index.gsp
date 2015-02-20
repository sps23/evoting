
<%@ page import="evoting.model.Creator" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'creator.label', default: 'Creator')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-creator" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-creator" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'creator.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="token" title="${message(code: 'creator.token.label', default: 'Token')}" />
					
						<g:sortableColumn property="lastVisitDate" title="${message(code: 'creator.lastVisitDate.label', default: 'Last Visit Date')}" />
					
						<g:sortableColumn property="submitDate" title="${message(code: 'creator.submitDate.label', default: 'Submit Date')}" />
					
						<th><g:message code="creator.voting.label" default="Voting" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${creatorInstanceList}" status="i" var="creatorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${creatorInstance.id}">${fieldValue(bean: creatorInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: creatorInstance, field: "token")}</td>
					
						<td><g:formatDate date="${creatorInstance.lastVisitDate}" /></td>
					
						<td><g:formatDate date="${creatorInstance.submitDate}" /></td>
					
						<td>${fieldValue(bean: creatorInstance, field: "voting")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${creatorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
