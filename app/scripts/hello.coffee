if window.DeviceOrientationEvent
  console.log 'DeviceOrientation is supported'

  $('#doEvent')
    .innerHTML = 'DeviceOrientation'

  devOrientHandler = (eventData) ->
    # console.info(eventData)

    # // gamma is the left-to-right tilt in degrees, where right is positive
    tiltLR = eventData.gamma

    # // beta is the front-to-back tilt in degrees, where front is positive
    tiltFB = eventData.beta

    # alpha is the compass direction the device is facing in degrees
    dir = eventData.alpha

    # udpate output
    $('#doTiltLR').text Math.round(tiltLR)
    $('#doTiltFB').text Math.round(tiltFB)
    $('#doDirection').text Math.round(dir)

    # Apply the transform to the image
    logo = $('#imgLogo');
    # logo.rotate(tiltLR);
    logo.css '-webkitTransform', "rotate(#{-tiltLR*.1}deg) rotate3d(1,0,0,#{(tiltFB*-1)*.1}deg  )"
    # logo.css '-mozTransform', "rotate(#{tiltLR}deg)"
    # logo.css 'transform', "rotate(#{tiltLR}deg) rotate3d(1,0,0,#{tiltFB-1})"
    # logo.style.webkitTransform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
    # logo.style.MozTransform = "rotate("+ tiltLR +"deg)";
    # logo.style.transform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
    #
    #  Apply the transform to the image
    # logo = $('#imgLogo')
    #   .get(0)
    #   console.log('logo', logo.style[])
    # logo.css "-webkitTransform", "rotate(#{tiltLR})deg) rotate3d(1,0,0, #{tiltFB}deg)"
    # logo.style.-MozTransform = "rotate(#{tiltLR}deg)"
    # logo.style.transform = "rotate(#{tiltLR}deg) rotate3d(1,0,0, #{tiltFB}deb)"

  window.addEventListener 'deviceorientation', devOrientHandler, false;
else
  $('#doEvent')
    .innerHTML = 'Device orientation not supported.'

if Modernizr.geolocation
  console.log 'GeoLocation is supported'

  # helper function
  get_location = (position_handler) ->
    navigator.geolocation.getCurrentPosition position_handler

  position_handler = (pos) ->
    console.log 'got loc', pos.coords
    coords = pos.coords
    $('#doAccuracy').text coords.accuracy
    $('#doAltitude').text coords.altitude
    $('#doAltitudeAccuracy').text coords.altitudeAccuracy
    $('#doHeading').text coords.heading
    $('#doLatitude').text coords.latitude
    $('#doLongitude').text coords.longitude
    $('#doSpeed').text coords.speed

  # set up listener
  get_location(position_handler)

else
  $('#doEvent')
    .innerHTML += 'Geolocation not supported.'
