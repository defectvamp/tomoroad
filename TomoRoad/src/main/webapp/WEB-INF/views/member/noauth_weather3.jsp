<!DOCTYPE html>
<html lang="en">
<head>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css" />
	<script src="js/jquery.js" type="text/javascript"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style type="text/css">
		.row {
			padding-top:1.5em;
		}
	</style>
	<script>
		var openWeatherAppId = 'c89c5f3e9f18d586e9279e9e218a31de',
		  openWeatherUrl = 'http://api.openweathermap.org/data/2.5/forecast'
		var prepareData = function(units) {
			// Replace loading image
			var cityName = $('#city-name').val()
			// Make ajax call, callback
			if (cityName && cityName != ''){
				cityName = cityName.trim()
				getData(openWeatherUrl, cityName, openWeatherAppId, units)
			}
			else {
				alert('Please enter the city name')
			}
		}
		$(document).ready(function(){
			$('.btn-metric').click(function() {
				prepareData('metric')
			})
		})
		function getData (url, cityName, appid, units) {
			var request = $.ajax({
				url: url,
				dataType: "jsonp",
				data: {q: cityName, appid: appid, units: units},
				jsonpCallback: "fetchData",
				type: "GET"
			}).fail(function(error){
				console.error(error)
				alert('Error sending request')
			})
		}
		function fetchData (forecast) {
			console.log(forecast)
			var html = '',
			  cityName = forecast.city.name,
				country = forecast.city.country
			html += '<h3> Weather Forecast for ' + cityName + ', ' + country + '</h3>'
			forecast.list.forEach(function(forecastEntry, index, list){
				html += '<p>' + forecastEntry.dt_txt + ': ' + forecastEntry.main.temp + '</p>'
			})
			$('#log').html(html)
		}
	</script>
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="span4 offset 3">
				<h2>Weather App</h2>
				<p>Enter city name to get the weather forecast</p>
			</div>
			<div class="span6  offset1"><input class="span4" type="text" placeholder="Enter the city name" id="city-name" value=""/>
			</div>

		</div>
		<div class="row">
			<div class="span6 offset1"><input type="button" class="btn-primary btn btn-metric" value="Get forecast in metric"/>
			</div>			
		</div>

		<div class="row">
			<div class="span6 offset1">
				<div id="log">Nothing to show yet</div>
			</div>
		</div>

		<div class="row">
			<hr/>
		</div>

	</div>

</body>
</html>