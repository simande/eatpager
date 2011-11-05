var Eatpager = window.Eatpager || { };

// If we already have the Shopping namespace don't override
if (typeof Eatpager.GeoInfo == "undefined") {
    Eatpager.GeoInfo = {};
}
var debug_variable = null;
// If we already have the Cart object don't override
if (typeof Eatpager.GeoInfo.user == "undefined") {

    Eatpager.GeoInfo.user = {
        startPos : null,
        initialize : function( ) {
          if (navigator.geolocation) {
            Eatpager.GeoInfo.user.startPos;
            navigator.geolocation.getCurrentPosition(function(position) {
              Eatpager.GeoInfo.user.startPos = position;
              //Eatpager.GeoInfo.user.startPos.coords.latitude;
              //Eatpager.GeoInfo.user.startPos.coords.longitude;
            });
          }
          else {
            console.log('Geolocation is not supported for this Browser/OS version yet.');
          }
        }
    }
}
