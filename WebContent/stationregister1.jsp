<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
	<legend>
		<h4>Station Registration</h4>
	</legend>

	<form class="form-horizontal" role="form" method=post
		action='stationregister2.jsp'>
		<div class="form-group">
			<label for="radio" class="col-sm-2 control-label">Station
				type</label>
			<div class="radio col-sm-8">
				<label> <input type="radio" name="controltype" id="CD"
					value="Crime Dept" checked>Crime Dept
				</label> <label> <input type="radio" name="controltype" id="RTA"
					value="RTA">RTA
				</label>
			</div>
		</div>
		<div class="form-group">
			<label for="stationid" class="col-sm-2 control-label">Station Id</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="stationid"
					name="stationid" placeholder="Station identification number">
			</div>
		</div>
		<div class="form-group">
			<label for="incharge" class="col-sm-2 control-label">Incharge</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="incharge"
					name="incharge" placeholder="Station incharge name">
			</div>
		</div>
		<div class="form-group">
			<label for="location" class="col-sm-2 control-label">Location</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="location"
					name="location" placeholder="City">
			</div>
		</div>
		<div class="form-group">
			<label for="areaname" class="col-sm-2 control-label">Area</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="areaname"
					name="areaname" placeholder="street">
			</div>
		</div>
		<div class="form-group">
			<label for="pincode" class="col-sm-2 control-label">Pincode</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="pincode"
					name="pincode" placeholder="Pincode">
			</div>
		</div>
		<div class="form-group">
			<label for="pwd" class="col-sm-2 control-label">Password</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" id="pwd" name="pwd"
					placeholder="6-14 characters">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary">Register</button>
				<button type="reset" class="btn btn-default">Reset</button>
			</div>
		</div>
	</form>
</body>
</html>