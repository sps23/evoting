<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="journal" />
<title>EVoting Authenticate</title>
</head>
<body>
	<h1>EVoting Authenticate</h1>

	<div class="bs-docs-section clearfix">
		<div class="row">
			<div class="col-lg-12">
				<div class="well bs-component">

					<g:form controller="participate" action="participateInVoting" class="form-horizontal">
						<fieldset>
							<legend>Provide Authentication Data</legend>
							<div class="form-group">
								<label for="voter.email" class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<g:field type="email" name="voter.email" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label for="voter.token" class="col-lg-2 control-label">Token</label>
                                <div class="col-lg-10">
                                    <g:field type="password" name="voter.token" class="form-control" />
                                </div>
							</div>
						</fieldset>

						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<g:submitButton name="authenticate" value="Authenticate"
									class="btn btn-primary" />
							</div>
						</div>

					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>