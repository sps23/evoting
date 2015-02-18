

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<g:link controller="about" class="navbar-brand">About</g:link>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><g:link controller="home">Home</g:link></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><g:link controller="create">Create</g:link></li>
                <li><g:link controller="search">Search</g:link></li>
                <li><g:link controller="participate">Participate</g:link></li>
                <li><g:link controller="edit">Edit</g:link></li>
                <li><g:link controller="view">View</g:link></li>
			</ul>
		</div>
	</div>
</nav>