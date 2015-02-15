
<%@ page import="evoting.model.Creator" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'creator.label', default: 'Creator')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-creator" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-creator" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list creator">
			
				<g:if test="${creatorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="creator.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${creatorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creatorInstance?.token}">
				<li class="fieldcontain">
					<span id="token-label" class="property-label"><g:message code="creator.token.label" default="Token" /></span>
					
						<span class="property-value" aria-labelledby="token-label"><g:fieldValue bean="${creatorInstance}" field="token"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creatorInstance?.lastVisitDate}">
				<li class="fieldcontain">
					<span id="lastVisitDate-label" class="property-label"><g:message code="creator.lastVisitDate.label" default="Last Visit Date" /></span>
					
						<span class="property-value" aria-labelledby="lastVisitDate-label"><g:formatDate date="${creatorInstance?.lastVisitDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${creatorInstance?.submitDate}">
				<li class="fieldcontain">
					<span id="submitDate-label" class="property-label"><g:message code="creator.submitDate.label" default="Submit Date" /></span>
					
						<span class="property-value" aria-labelledby="submitDate-label"><g:formatDate date="${creatorInstance?.submitDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:creatorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${creatorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
