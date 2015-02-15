<%@ page import="evoting.model.Voter" %>



<div class="fieldcontain ${hasErrors(bean: voterInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="voter.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${voterInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voterInstance, field: 'token', 'error')} required">
	<label for="token">
		<g:message code="voter.token.label" default="Token" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="token" required="" value="${voterInstance?.token}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voterInstance, field: 'lastVisitDate', 'error')} ">
	<label for="lastVisitDate">
		<g:message code="voter.lastVisitDate.label" default="Last Visit Date" />
		
	</label>
	<g:datePicker name="lastVisitDate" precision="day"  value="${voterInstance?.lastVisitDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: voterInstance, field: 'submitDate', 'error')} ">
	<label for="submitDate">
		<g:message code="voter.submitDate.label" default="Submit Date" />
		
	</label>
	<g:datePicker name="submitDate" precision="day"  value="${voterInstance?.submitDate}" default="none" noSelection="['': '']" />

</div>

