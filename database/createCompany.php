<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
				
        <title>Maintenance</title>
    </head>

    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">WebSiteName</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="/database/index.php">Home</a></li>
                    <li><a href="/database/reporting">Reporting</a></li>
                    <li><a href="/database/searchCommitteeSearch">Search Committee Search</a></li>
                    <li><a href="/database/applicantSearch">Applicant Search</a></li>
                    <li><a href="/database/maintenance.html">Database Maintenance</a></li>
                </ul>
            </div>
        </nav>
        
        <h1 style="margin-left:1%">Company Management</h1>
		<div class="card text-center">
			<div class="card-header">
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item">
					  <a class="nav-link" href="/database/companyManagement.php">Manage Company</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link active" href="/database/createCompany.php">Create New Company</a>
					</li>
				</ul>
			</div>
			<div class="card-body">
				<div id="container">
                    <form action="/database/insert_company.php" method="post">
                        <div class=row style="margin-left:1%">
                            <div class="col-3">
                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="name">Name</span>
                                    </div>
                                    <input type="text" class="form-control" id="name" name="name">
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="Description">Description</span>
                                    </div>
                                    <input type="text" class="form-control" id="description" name="description">
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="Address">Address</span>
                                    </div>
                                    <input type="text" class="form-control" id="address" name="address">
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="Association">Association</span>
                                    </div>
                                    <input type="" class="form-control" id="association" name="association">
                                </div>
                            </div>
                        </div>
                        <br/>
                        <button type="submit" class="btn btn-primary">Create Company</button>
                    </form>
                </div>
			</div>
		</div>
	</body>
</html>