
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<meta charset="utf-8">
<title>Header</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp" %>  
	<div class="container-fluid ">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner responsive-image" role="listbox">
				<div class="item active ">
					<a href="# "><img src="resource\image\teddy.jpg"
						style="width: 100%;"></a>
					<div class="carousel-caption ">
						<h1 style="color: blue;">Friendly Teddy Bears are available</h1>
					</div>
				</div>
				<div class="item ">
					<a href="# "><img src="resource\image\Slide_30716.jpg"
						style="width: 100%;"></a>
				</div>
				<div class="item ">
					<a href="# "><img src="resource\image\kids.jpg "
						style="width: 100%;"></a>
				</div>
				<div class="item ">
					<a href="# "><img src="resource\image\baby.jpg
        "
						style="width: 100%;"></a>
					<div class="carousel-caption ">
						<h1 style="color: blue;">The Lego</h1>
						<p style="color: blue;">Brain stimulator for kids</p>

					</div>
				</div>

				<!-- Left and right controls -->

				<a class="left carousel-control " href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left "></span> <span class="sr-only">Previous</span>
				</a> <a class="right carousel-control " href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right "></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

	</div>
	<div class="container-fluid">
		<div class="row">
			<h2 class="divide-vertical" style="text-align: center">
				<strong>Top Picks</strong>
			</h2>
		</div>
		<div class="row">
			<p style="text-align: center">only the best of the deals</p>
		</div>
		<div class="row">
			<div class="col-md-3 col-xs-6">
				<a href="#"> <img src="resource\image\static1.jpg">
				</a>
			</div>
			<div class="col-md-3 col-xs-6">
				<a href="#"> <img src="resource\image\static2.jpg">
				</a>
			</div>
			<div class="col-md-3 col-xs-6">
				<a href="#"> <img src="resource\image\static3.jpg">
				</a>
			</div>
			<div class="col-md-3 col-xs-6">
				<a href="#"> <img src="resource\image\static4.jpg">
				</a>
			</div>
		</div>

	</div>

</body>
</html>
