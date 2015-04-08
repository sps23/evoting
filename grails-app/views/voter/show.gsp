
<%@ page import="evoting.model.Voter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voter.label', default: 'Voter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-voter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-voter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list voter">
			
				<g:if test="${voterInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="voter.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${voterInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voterInstance?.token}">
				<li class="fieldcontain">
					<span id="token-label" class="property-label"><g:message code="voter.token.label" default="Token" /></span>
					
						<span class="property-value" aria-labelledby="token-label"><g:fieldValue bean="${voterInstance}" field="token"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voterInstance?.lastVisitDate}">
				<li class="fieldcontain">
					<span id="lastVisitDate-label" class="property-label"><g:message code="voter.lastVisitDate.label" default="Last Visit Date" /></span>
					
						<span class="property-value" aria-labelledby="lastVisitDate-label"><g:formatDate date="${voterInstance?.lastVisitDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${voterInstance?.submitDate}">
				<li class="fieldcontain">
					<span id="submitDate-label" class="property-label"><g:message code="voter.submitDate.label" default="Submit Date" /></span>
					
						<span class="property-value" aria-labelledby="submitDate-label"><g:formatDate date="${voterInstance?.submitDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${voterInstance?.voting}">
				<li class="fieldcontain">
					<span id="voting-label" class="property-label"><g:message code="voter.voting.label" default="Voting" /></span>
					
						<span class="property-value" aria-labelledby="voting-label"><g:link controller="voting" action="show" id="${voterInstance?.voting?.id}">${voterInstance?.voting?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:voterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${voterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
