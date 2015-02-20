<%@ page import="evoting.model.Creator" %>



<div class="fieldcontain ${hasErrors(bean: creatorInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="creator.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${creatorInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creatorInstance, field: 'token', 'error')} required">
	<label for="token">
		<g:message code="creator.token.label" default="Token" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="token" required="" value="${creatorInstance?.token}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creatorInstance, field: 'lastVisitDate', 'error')} ">
	<label for="lastVisitDate">
		<g:message code="creator.lastVisitDate.label" default="Last Visit Date" />
		
	</label>
	<g:datePicker name="lastVisitDate" precision="day"  value="${creatorInstance?.lastVisitDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: creatorInstance, field: 'submitDate', 'error')} ">
	<label for="submitDate">
		<g:message code="creator.submitDate.label" default="Submit Date" />
		
	</label>
	<g:datePicker name="submitDate" precision="day"  value="${creatorInstance?.submitDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: creatorInstance, field: 'voting', 'error')} required">
	<label for="voting">
		<g:message code="creator.voting.label" default="Voting" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="voting" name="voting.id" from="${evoting.model.Voting.list()}" optionKey="id" required="" value="${creatorInstance?.voting?.id}" class="many-to-one"/>

</div>

