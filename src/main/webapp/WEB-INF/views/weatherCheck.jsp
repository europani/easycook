<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function geo_error() { 
	   alert("위치 정보를 사용할 수 없습니다.");
	 };
	 
	function geo_options() {
		enableHighAccuracy: true
	};
	 
	function showPosition(position) {
	 	var lat = position.coords.latitude; 
		var lng = position.coords.longitude; 
		loadJSON(lat,lng);
	}
	
	function loadJSON(lat,lng){
		
		$.getJSON('http://api.openweathermap.org/data/2.5/weather?lat=' + lat +'&lon='+ lng + '&appid=b183228f5584b086c11025ca242b360d&units=metric'
				,function(data){
			let $weather = data.weather[0].main;
			window.location.href = "/easycook/weather?weather=" + $weather;
		}); 
	}
	
	function getLocation() {
		if (navigator.geolocation) {
		 navigator.geolocation.getCurrentPosition(showPosition, geo_error, geo_options);
		} else { 
			alert("Geolocation is not supported by this browser.");
		}
	}
getLocation();

</script>
<script src="/easycook/resources/js/jquery-3.2.1.min.js"></script>