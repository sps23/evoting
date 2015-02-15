
<%@ page import="evoting.model.Voting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voting.label', default: 'Voting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-voting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-voting" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'voting.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'voting.description.label', default: 'Description')}" />
					
						<th><g:message code="voting.creator.label" default="Creator" /></th>
					
						<g:sortableColumn property="startDate" title="${message(code: 'voting.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'voting.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="anonymous" title="${message(code: 'voting.anonymous.label', default: 'Anonymous')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${votingInstanceList}" status="i" var="votingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${votingInstance.id}">${fieldValue(bean: votingInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: votingInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: votingInstance, field: "creator")}</td>
					
						<td><g:formatDate date="${votingInstance.startDate}" /></td>
					
						<td><g:formatDate date="${votingInstance.endDate}" /></td>
					
						<td><g:formatBoolean boolean="${votingInstance.anonymous}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${votingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
