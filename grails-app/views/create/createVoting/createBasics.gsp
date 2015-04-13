<%@ page import="evoting.model.Voting"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Create</title>
</head>
<body>
	<h1>EVoting CreateBasics</h1>
	<p>
		voting =${voting}
	</p>

	<div class="bs-docs-section clearfix">
		<div class="row">
			<div class="col-lg-12">
				<div class="well bs-component">
					<g:form  controller="create" action="createVoting" class="form-horizontal">
						<fieldset>
							<legend>EVoting Basics</legend>
							<div class="form-group">
								<label for="name" class="col-lg-2 control-label">Name</label>
								<div class="col-lg-10">
									<g:textField name="name" value="${voting.name}"
										placeholder="Name" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label for="description" class="col-lg-2 control-label">Description</label>
								<div class="col-lg-10">
									<g:textArea name="description" value="${voting.description}"
										placeholder="Description" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label for="creatorEmail" class="col-lg-2 control-label">Creator
									Email</label>
								<div class="col-lg-10">
									<g:field type="email" name="creator.email"
										value="${voting.creator.email}" placeholder="email"
										class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label for="sendAnswerToVoter" class="col-lg-2 control-label">
									Send Answer To Voter </label>
								<div class="col-lg-10">
									<g:radioGroup name="sendAnswerToVoter" labels="['Yes','No']"
										values="['true','false']" value="${voting.sendAnswerToVoter}">
										<div class="radio">
											<label> ${it.radio} ${it.label}</label>
										</div>
									</g:radioGroup>
								</div>
							</div>

							<div class="form-group">
								<label for="sendResultsToVoters" class="col-lg-2 control-label">
									Send Results To Voter </label>
								<div class="col-lg-10">
									<g:radioGroup name="sendResultsToVoters" labels="['Yes','No']"
										values="['true','false']"
										value="${voting.sendResultsToVoters}">
										<div class="radio">
											<label> ${it.radio} ${it.label}</label>
										</div>
									</g:radioGroup>
								</div>
							</div>

							<div class="form-group">
								<label for="anonymous" class="col-lg-2 control-label">
									Anonymous </label>
								<div class="col-lg-10">
									<g:radioGroup name="anonymous" labels="['Yes','No']"
										values="['true','false']" value="${voting.anonymous}">
										<div class="radio">
											<label> ${it.radio} ${it.label}</label>
										</div>
									</g:radioGroup>
								</div>
							</div>

							<div class="form-group">
								<label for="sendPartialResults" class="col-lg-2 control-label">
									Send Partial Results</label>
								<div class="col-lg-10">
									<g:radioGroup name="sendPartialResults" labels="['Yes','No']"
										values="['true','false']" value="${voting.sendPartialResults}">
										<div class="radio">
											<label> ${it.radio} ${it.label}</label>
										</div>
									</g:radioGroup>
								</div>
							</div>

							<div class="form-group">
								<label for="sendNotification" class="col-lg-2 control-label">
									Send Notification</label>
								<div class="col-lg-10">
									<g:radioGroup name="sendNotification" labels="['Yes','No']"
										values="['true','false']" value="${voting.sendNotification}">
										<div class="radio">
											<label> ${it.radio} ${it.label}</label>
										</div>
									</g:radioGroup>
								</div>
							</div>

							<div class="form-group">
								<label for="startDate" class="col-lg-2 control-label">
									Start Date</label>
								<div class="col-lg-10">
									<g:datePicker name="startDate" precision="day"
										value="${voting.startDate}" />
								</div>
							</div>
							<div class="form-group">
								<label for="endDate" class="col-lg-2 control-label"> End
									Date</label>
								<div class="col-lg-10">
									<g:datePicker name="endDate" precision="day"
										value="${voting.endDate}" />
								</div>
							</div>
							<div class="form-group">
								<label for="expirationDate" class="col-lg-2 control-label">
									Expiration Date</label>
								<div class="col-lg-10">
									<g:datePicker name="expirationDate" precision="day"
										value="${voting.expirationDate}" />
								</div>
							</div>

							<div class="form-group">
								<label for="numberOfVoters" class="col-lg-2 control-label">
									Number Of Voters</label>
								<div class="col-lg-10">
									<g:field name="numberOfVoters" type="number" min="3" max="10"
										value="3" required="" />
								</div>
							</div>
							<div class="form-group">
								<label for="startDate" class="col-lg-2 control-label">
									Number Of Questions</label>
								<div class="col-lg-10">
									<g:field name="numberOfQuestions" type="number" min="1" max="10"
										value="3" required="" />
								</div>
							</div>
							
							<%--<div class="form-group">
								<label for="inputPassword" class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<input class="form-control" id="inputPassword"
										placeholder="Password" type="password">
									<div class="checkbox">
										<label> <input type="checkbox"> Checkbox
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Textarea</label>
								<div class="col-lg-10">
									<textarea class="form-control" rows="3" id="textArea"></textarea>
									<span class="help-block">A longer block of help text
										that breaks onto a new line and may extend beyond one line.</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Radios</label>
								<div class="col-lg-10">
									<div class="radio">
										<label> <input name="optionsRadios"
											id="optionsRadios1" value="option1" checked="" type="radio">
											Option one is this
										</label>
									</div>
									<div class="radio">
										<label> <input name="optionsRadios"
											id="optionsRadios2" value="option2" type="radio">
											Option two can be something else
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="select" class="col-lg-2 control-label">Selects</label>
								<div class="col-lg-10">
									<select class="form-control" id="select">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select> <br> <select multiple="" class="form-control">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>
--%>

							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<g:submitButton name="createBasics"
										value="Create Questions" class="btn btn-primary" />
								</div>
							</div>

						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
