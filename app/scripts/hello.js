(function() {
  var devOrientHandler, get_location, position_handler;

  if (window.DeviceOrientationEvent) {
    console.log('DeviceOrientation is supported');
    $('#doEvent').innerHTML = 'DeviceOrientation';
    devOrientHandler = function(eventData) {
      var dir, logo, tiltFB, tiltLR;
      tiltLR = eventData.gamma;
      tiltFB = eventData.beta;
      dir = eventData.alpha;
      $('#doTiltLR').text(Math.round(tiltLR));
      $('#doTiltFB').text(Math.round(tiltFB));
      $('#doDirection').text(Math.round(dir));
      logo = $('#imgLogo');
      return logo.css('-webkitTransform', "rotate(" + (-tiltLR * .1) + "deg) rotate3d(1,0,0," + ((tiltFB * -1) * .1) + "deg  )");
    };
    window.addEventListener('deviceorientation', devOrientHandler, false);
  } else {
    $('#doEvent').innerHTML = 'Device orientation not supported.';
  }

  if (Modernizr.geolocation) {
    console.log('GeoLocation is supported');
    get_location = function(position_handler) {
      return navigator.geolocation.getCurrentPosition(position_handler);
    };
    position_handler = function(pos) {
      var coords;
      console.log('got loc', pos.coords);
      coords = pos.coords;
      $('#doAccuracy').text(coords.accuracy);
      $('#doAltitude').text(coords.altitude);
      $('#doAltitudeAccuracy').text(coords.altitudeAccuracy);
      $('#doHeading').text(coords.heading);
      $('#doLatitude').text(coords.latitude);
      $('#doLongitude').text(coords.longitude);
      return $('#doSpeed').text(coords.speed);
    };
    get_location(position_handler);
  } else {
    $('#doEvent').innerHTML += 'Geolocation not supported.';
  }

}).call(this);
