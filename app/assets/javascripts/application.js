// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


var eatpager = new Object();

eatpager.restaurant = new function() {
	

function initiate_geolocation() {
  navigator.geolocation.getCurrentPosition(handle_geolocation_query);
}

function handle_geolocation_query(position){
  window.location = "?location=" + position.coords.latitude + "," + position.coords.longitude;
}

	
	return {
		party: function() {
			$( '.current_location' ).bind( 'click', function( e ) {
				e.preventDefault();
				initiate_geolocation();
			} );
			
			$( 'a:not(.close)', '.topic' ).bind( 'click', function( e ) {
				e.preventDefault();
				
				$( '.topic' ).removeClass( 'selected' );
				
				var container = $( this ).parents( '.topic' );
				var topic = container.data( 'section' );
				
				$( '#map, #tips' ).hide();
				$( '#' + topic ).show();
				
				$( '#panels' ).fadeIn( 'fast' );
				container.addClass( 'selected' );
			} );
			
			$( '.close', '.topic' ).bind( 'click', function( e ) {
				e.preventDefault();
				
				var topic = $( this ).parents( '.topic' ).removeClass( 'selected' ).data( 'section' );
				$( '#' + topic ).show();
				$( '#panels' ).fadeOut( 'fast' );
			} );
		}
	}
};

$( document ).ready( eatpager.restaurant.party );