/*
Adobe Systems Incorporated(r) Source Code License Agreement
Copyright(c) 2005 Adobe Systems Incorporated. All rights reserved.
	
Please read this Source Code License Agreement carefully before using
the source code.
	
Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright license, to reproduce,
prepare derivative works of, publicly display, publicly perform, and
distribute this source code and such derivative works in source or
object code form without any attribution requirements.
	
The name "Adobe Systems Incorporated" must not be used to endorse or promote products
derived from the source code without prior written permission.
	
You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
against any loss, damage, claims or lawsuits, including attorney's
fees that arise or result from your use or distribution of the source
code.
	
THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT
ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.adobe.webapis.facebook.methodgroups {
	
	import com.adobe.crypto.MD5;
	import com.adobe.webapis.facebook.*;
	import com.adobe.webapis.facebook.facebookservice_internal;
	import com.adobe.webapis.facebook.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.xml.*;
	import flash.geom.Rectangle;

	/**
	 * Contains helper functions for the method group classes that are
	 * reused throughout them.
	 */
	internal class MethodGroupHelper {
	
		/** 
		 * The request's sequence number. Each successive call for any session 
		 * must use a sequence number greater than the last.
		 */
		internal static var call_id:int = 0;

		/** 
		 * Set the internal DefaultXMLNamespace property to the facebook namespace.
		 */
		default xml namespace = facebook;
		
		/**
		 * Reusable method that the "method group" classes can call to invoke a
		 * method on the API.
		 *
		 * @param callBack The function to be notified when the RPC is complete
		 * @param method The name of the method to invoke ( like facebook.test.echo )
		 * @param signed A boolean value indicating if the method call needs
		 *			an api_sig attached to it
		 * @param params An array of NameValuePair or primitive elements to pass
		 *			as parameters to the remote method
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function invokeMethod( service:FacebookService, 
												callBack:Function, method:String, 
												signed:Boolean, ... params:Array ):void
		{
			
			// Create an array to store our name/value pairs
			// for the query because during signing we need to sort
			// these alphabetically
			var args:Array = new Array();
			
			args.push( new NameValuePair( "call_id", String(call_id++) ) );
			args.push( new NameValuePair( "v", service.version ) );
			args.push( new NameValuePair( "method", method ) );
			args.push( new NameValuePair( "api_key", service.api_key ) );
			
			// Loop over the params and add them as arguments
			for ( var i:int = 0; i < params.length; i++ ) {
				// Do we have an argument name, or do we create one
				if ( params[i] is NameValuePair ) {
					args.push( params[i] );
				} else {
					// Create a unique argument name using our loop counter
					args.push( new NameValuePair( "param" + i, params[i].toString() ) );
				}
			}

			// If a user is authenticated, automatically add their session_key
			if ( service.session_key ) {
				args.push( new NameValuePair( "session_key", service.session_key ) );
				// auto-sign the call because the user is authenticated
				signed = true;
			}
			
			// Sign the call
			if ( signed ) {
				
				// sign the call according to the documentation
				// here: http://developers.facebook.com/documentation.php?v=1.0&doc=auth
				
				args.sortOn( "name" );
				var sig:String = "";
				for ( var j:int = 0; j < args.length; j++ ) {
					sig += args[j].name.toString() + "=" + args[j].value.toString();	
				}
				sig += service.secret;
				args.push( new NameValuePair( "sig", MD5.hash( sig ) ) );
			}
			
			// Construct the query string to send to the Facebook service
			var query:String = "";
			for ( var k:int = 0; k < args.length; k++ ) {
				query += args[k].name + "=" + args[k].value
				if (k<args.length-1) query += "&";
			}
			
			// Use the "internal" facebookservice namespace to be able to
			// access the urlLoader so we can make the request.
			var loader:URLLoader = service.facebookservice_internal::urlLoader;

			trace("URL:" + FacebookService.END_POINT + query);

			// Construct a url request with our query string and invoke
			// the Facebook method
			loader.addEventListener( "complete", callBack );
			loader.load( new URLRequest( FacebookService.END_POINT + query ) );
		}
		
		/**
		 * Handle processing the result of the API call.
		 *
		 * @param service The FacebookService associated with the method group
		 * @param response The XML response we got from the loader call
		 * @param result The event to fill in the details of and dispatch
		 * @param propertyName The property in event.data that the results should be placed
		 * @param parseFunction The function to parse the response XML with
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function processAndDispatch( service:FacebookService, response:String, result:FacebookResultEvent, propertyName:String = "", parseFunction:Function = null ):void {
			
			trace("processAndDispatch1: response = " + response)
			
			// Process the response to create an object for return values
			var rsp:Object = processResponse( response, propertyName, parseFunction );

			// Copy some properties from the response to the result event
			result.success = rsp.success;
			result.data = rsp.data;
			
			// Notify everyone listening
			service.dispatchEvent( result );
		}
		
		/**
		 * Reusable method that the "method group" classes can call
		 * to process the results of the Facebook method.
		 *
		 * @param facebookResponse The rest response string that aligns
		 *		with the documentation here: 
		 *			http://developers.facebook.com/documentation.php?v=1.0
		 *			http://api.facebook.com/1.0/facebook.xsd
		 * @param parseFunction A reference to the function that should be used
		 *		to parse the XML received from the server
		 * @param propertyName The name of the property to put the parsed data in.
		 *  	For example, the result object will contain a "data" property that
		 * 		will contain an additional property (the value of propertyName) that
		 * 		contains the actual data.
		 * @return An object with success and data properties.  Success
		 *		will be true if the call was completed, false otherwise.
		 *		Data will contain ether an array of NameValuePair (if
		 *		successful) or errorCode and errorMessage properties.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function processResponse( facebookResponse:String, propertyName:String, parseFunction:Function ):Object {

			var result:Object = new Object();
			result.data = new Object();
			
			// Use an XMLDocument to convert a string to XML
			var doc:XMLDocument = new XMLDocument();
			doc.ignoreWhite = true;
			doc.parseXML( facebookResponse );
			
			// Get the root rsp node from the document
			var rsp:XMLNode = doc.firstChild;
			
			// Clean up a little
			doc = null; 
			
			if ( rsp.nodeName != "error_response" ) {
				result.success = true;
				
				// Parse the XML object into a user-defined class (This gives us
				// nice code hinting, and abstracts away the FacebookAPI a bit - if
				// the FacebookAPI changes responses we can modify this service
				// without the user having to update their program code
				if ( parseFunction == null ) {
					// No parse function speficied, just pass through the XML data.
					// Construct an object that we can access via E4X since
					// the result we get back from Facebook is an xml response
					result.data = XML( rsp );
				} else {
					//result.data[propertyName] = parseFunction( XML( rsp ) );	
					result.data = parseFunction( XML( rsp ) );
				}			
								
			} else {
				result.success = false;
				
				
				// In the event that we don't get an xml object
				// as part of the error returned, just
				// use the plain text as the error message
				
				var error:FacebookError = new FacebookError();
				if ( rsp != null )
				{
					var errorResponse:XML = XML( rsp );
					error.errorCode = int( errorResponse.error_code );
					error.errorMessage = errorResponse.error_msg;
					
					result.data = error;
				}
				else 
				{
					error.errorCode = -1;
					error.errorMessage = rsp.nodeValue;
					
					result.data = error;
				}
				
			}
			
			
			return result;			
		}
		
		/**
		 * Converts a date object into a Facebook date string
		 *
		 * @param date The date to convert
		 * @return A string representing the date in a format
		 *		that Facebook understands
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function dateToString( date:Date ):String {
			// Don't do anything if the date is invalid
			if ( date == null ) {
				return "";
			} else {
				return date.getFullYear() + "-" + (date.getMonth() + 1)
					+ "-" + date.getDate() + " " + date.getHours()
					+ ":" + date.getMinutes() + ":" + date.getSeconds();
			}
		}
		
		/**
		 * Converts a Facebook date string into a date object
		 *
		 * @param date The string to convert
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function stringToDate( str:String = "" ):Date {
			if ( str == "" ) {
				return null;
			}
			
			var date:Date = new Date();
			// split the date into date / time parts
			var parts:Array = str.split( " " );
			
			// See if we have the xxxx-xx-xx xx:xx:xx format
			if ( parts.length == 2 ) {
				var dateParts:Array = parts[0].split( "-" );
				var timeParts:Array = parts[1].split( ":" );
				
				date.setFullYear( dateParts[0] );
				date.setMonth( dateParts[1] - 1 ); // subtract 1 (Jan == 0)
				date.setDate( dateParts[2] );
				date.setHours( timeParts[0] );
				date.setMinutes( timeParts[1] );
				date.setSeconds( timeParts[2] );
			} else {
				// Create a date based on # of seconds since Jan 1, 1970 GMT
				date.setTime( parseInt( str ) * 1000 );
			}
			
			return date;
		}
		
		/**
		 * Converts an auth_getSession XML object into an AuthSession instance
		 */
		internal static function parseAuthSession( xml:XML ):AuthSession {
			var authSession:AuthSession = new AuthSession();
			authSession.session_key = xml.session_key.toString();
			authSession.uid = xml.uid.toString();
			authSession.expires = xml.expires.toString();
			authSession.secret = xml.secret.toString();
			return authSession;
		}
		
		/**
		 * Converts a auth_createToken XML object into a string (the auth_token value)
		 */
		internal static function parseAuthToken( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a photos_addTag XML object into a string (the photos_addTag value)
		 */
		internal static function parsePhotosAddTag( xml:XML ):String {
			return xml.photos_addTag_response.toString();
		}
		
		/**
		 * Converts a photos_createAlbum XML object into an Album instance
		 */
		internal static function parsePhotosCreateAlbum( xml:XML ):Album {
			
			var album:Album = new Album();
			album.aid = parseInt( xml.aid );
			album.cover_pid = parseInt( xml.cover_pid );
			album.owner = parseInt( xml.owner );
			album.name = xml.name.toString();
			album.created = stringToDate( xml.created.toString() );
			album.modified = stringToDate( xml.modified.toString() );
			album.description = xml.description.toString();
			album.location = xml.location.toString();
			album.size = parseInt( xml.size );

			return album
		}
		
		/**
		 * Converts a photos_get XML object into an array of Photo instances
		 */
		internal static function parsePhotosGet( xml:XML ):Array {
			
			var photos:Array = new Array();
			
			for each ( var p:XML in xml.photo ) {
				var photo:Photo = new Photo();
				photo.pid = parseInt( p.pid );
				photo.aid = parseInt( p.aid );
				photo.owner = parseInt( p.owner );
				photo.src = p.src.toString();
				photo.src_big = p.src_big.toString();
				photo.src_small = p.src_small.toString();
				photo.link = p.link.toString();
				photo.caption = p.caption.toString();
				photo.created = stringToDate( p.created.toString() );
				
				photos.push( photo );
			}
			
			return photos;
		}
		
		/**
		 * Converts a photos_getAlbums XML object into an array of Album instances
		 */
		internal static function parsePhotosGetAlbums( xml:XML ):Array {

			var albums:Array = new Array();
			
			for each ( var a:XML in xml.album ) {
				var album:Album = new Album();
				album.aid = parseInt( a.aid );
				album.cover_pid = parseInt( a.cover_pid );
				album.owner = parseInt( a.owner );
				album.name = a.name.toString();
				album.created = stringToDate( a.created.toString() );
				album.modified = stringToDate( a.modified.toString() );
				album.description = a.description.toString();
				album.location = a.location.toString();
				album.size = parseInt( a.size );
				
				albums.push( album );
			}
			
			return albums;
		}
		
		/**
		 * Converts a photos_getTags XML object into an array of PhotoTag instances
		 */
		internal static function parsePhotosGetTags( xml:XML ):Array {

			var photoTags:Array = new Array();
			
			for each ( var t:XML in xml.photo_tag ) {
				var photoTag:PhotoTag = new PhotoTag();
				photoTag.pid = parseInt( t.cover_pid );
				photoTag.subject = t.subject.toString();
				photoTag.xcoord = t.xcoord.toString();
				photoTag.ycoord = t.ycoord.toString();
				
				photoTags.push( photoTag );
			}
			
			return photoTags;
		}
		
		/**
		 * Converts a photos_upload XML object into a string (the photos_upload value)
		 */
		internal static function parsePhotosUpload( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a groups_get XML object into an array of Group instances
		 */
		internal static function parseGroupsGet( xml:XML ):Array {
			
			var groups:Array = new Array();
			
			for each ( var g:XML in xml.group ) {
				var group:Group = new Group();
				group.gid = parseInt( g.gid );
				group.name = g.name.toString();
				group.nid = parseInt( g.nid );
				group.pic_small = g.pic_small.toString();
				group.pic_big = g.pic_big.toString();
				group.pic = g.pic.toString();
				group.description = g.description.toString();
				group.group_type = g.group_type.toString();
				group.group_subtype = g.group_subtype.toString();
				group.recent_news = g.recent_news.toString();
				group.creator = parseInt( g.creator );
				group.update_time = stringToDate( g.update_time.toString() );
				group.office = g.office.toString();
				group.website = g.website.toString();
				group.venue = g.venue.toString();
				
				groups.push( group );
			}
			
			return groups;
		}
		
		/**
		 * Converts a groups_getMembers XML object into a string (the groups_getMembers value)
		 */
		internal static function parseGroupsGetMembers( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a users_getInfo XML object into a User instance
		 */
		internal static function parseUsersGetInfo( xml:XML ):User {

			var user:User = new User();

			user.uid = parseInt( xml.user.nid );
			user.first_name = xml.user.first_name.toString();
			user.last_name = xml.user.last_name.toString();
			user.name = xml.user.name.toString();
			user.pic_small = xml.user.pic_small.toString();
			user.pic_big = xml.user.pic_big.toString();
			user.pic_square = xml.user.pic_square.toString();
			user.pic = xml.user.pic.toString();
			
			var affiliations:Array = new Array();
			for each ( var a:XML in xml.user.affiliations ) {
				var affiliation:Affiliation = new Affiliation();
				affiliation.nid = parseInt( a.nid );
				affiliation.name = a.name.toString();
				affiliation.type = a.type.toString();
				affiliation.status = a.status.toString();
				affiliation.year = a.year.toString();

				affiliations.push( affiliation );
			}
			user.affiliations = affiliations;
			
			user.profile_update_time = stringToDate( xml.user.profile_update_time.toString() );
			user.timezone = parseInt( xml.user.timezone );
			user.religion = xml.user.religion.toString();
			user.birthday = xml.user.birthday.toString();
			user.sex = xml.user.sex.toString();
			
			var hometownLocation:Location = new Location();
			hometownLocation.city = xml.user.hometown_location.city.toString();
			hometownLocation.state = xml.user.hometown_location.state.toString();
			hometownLocation.country = xml.user.hometown_location.country.toString();
			hometownLocation.zip = xml.user.hometown_location.zip.toString();
			user.hometown_location = hometownLocation;
			
			var meetingSex:Array = new Array();
			for each ( var sex:XML in xml.user.meeting_sex.sex ) {
				meetingSex.push( sex.toString() )
			}
			user.meeting_sex = meetingSex;
			
			var meetingFor:Array = new Array();
			for each ( var seeking:XML in xml.user.meeting_for.seeking ) {
				meetingFor.push( seeking.toString() )
			}
			user.meeting_for = meetingFor;
			
			user.relationship_status = xml.user.relationship_status.toString();
			user.significant_other_id = parseInt( xml.user.significant_other_id );
			user.political = xml.user.political.toString();

			var currentLocation:Location = new Location();
			currentLocation.city = xml.user.hometown_location.city.toString();
			currentLocation.state = xml.user.hometown_location.state.toString();
			currentLocation.country = xml.user.hometown_location.country.toString();
			currentLocation.zip = xml.user.hometown_location.zip.toString();
			user.current_location = currentLocation;

			user.activities = xml.user.activities.toString();
			user.interests = xml.user.interests.toString();
			user.is_app_user = ( xml.user.is_app_user.toString() == "1" ) ? true : false;
			user.music = xml.user.music.toString();
			user.tv = xml.user.tv.toString();
			user.movies = xml.user.movies.toString();
			user.books = xml.user.books.toString();
			user.quotes = xml.user.quotes.toString();
			user.about_me = xml.user.about_me.toString();
			
			var hsInfo:HsInfo = new HsInfo();
			hsInfo.hs1_name = xml.user.hs_info.hs1_name.toString();
			hsInfo.hs2_name = xml.user.hs_info.hs2_name.toString();
			hsInfo.grad_year = xml.user.hs_info.grad_year.toString();
			hsInfo.hs1_key = xml.user.hs_info.hs1_key.toString();
			hsInfo.hs2_key = xml.user.hs_info.hs2_key.toString();
			user.hs_info = hsInfo;
			
			var educationHistory:Array = new Array();
			for each ( var e:XML in xml.user.education_info ) {
				var educationInfo:EducationInfo = new EducationInfo();
				educationInfo.name = e.name.toString();
				educationInfo.year = e.year.toString();
				
				var concentrations:Array = new Array();
				for each ( var c:XML in e.concentration ) {
					concentrations.push( c.toString() )
				}
				educationInfo.concentrations = concentrations;

				educationHistory.push( affiliation );
			}
			user.education_history = educationHistory;
			

			var workHistory:Array = new Array();
			for each ( var w:XML in xml.user.work_info ) {
				var workInfo:WorkInfo = new WorkInfo();

				var location:Location = new Location();
				location.city = w.location.city.toString();
				location.state = w.location.state.toString();
				location.country = w.location.country.toString();
				location.zip = w.location.zip.toString();
				workInfo.location = location;

				workInfo.company_name = w.company_name.toString();
				workInfo.description = w.description.toString();
				workInfo.position = w.position.toString();
				workInfo.start_date = stringToDate( w.start_date.toString() );
				workInfo.end_date = stringToDate( w.end_date.toString() );

				workHistory.push( workInfo );
			}
			user.work_history = workHistory;
			
			user.notes_count = xml.user.notes_count.toString();
			user.wall_count = xml.user.wall_count.toString();
			user.status = xml.user.status.toString();
			user.has_added_app = ( xml.user.has_added_app.toString() == "1" ) ? true : false;
			
			return user;		}
		
		/**
		 * Converts a users_getLoggedInUser XML object into a string (the users_getLoggedInUser value)
		 */
		internal static function parseUsersGetLoggedInUser( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a fbml_refreshImgSrc XML object into a string (the fbml_refreshImgSrc value)
		 */
		internal static function parseFbmlRefreshImgSrc( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a fbml_refreshRefUrl XML object into a string (the fbml_refreshRefUrl value)
		 */
		internal static function parseFbmlRefreshRefUrl( xml:XML ):String {
			return xml.fbml_refreshRefUrl_response.toString();
		}
		
		/**
		 * Converts a fbml_setRefHandle XML object into a string (the fbml_setRefHandle value)
		 */
		internal static function parseFbmlSetRefHandle( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a feed_publishStoryToUser XML object into a string (the feed_publishStoryToUser value)
		 */
		internal static function parseFeedPublishStoryToUser( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a feed_publishActionOfUser XML object into a string (the feed_publishActionOfUser value)
		 */
		internal static function parseFeedPublishActionOfUser( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a events_get XML object into an array of Event instances
		 */
		internal static function parseEventsGet( xml:XML ):Array {

			var events:Array = new Array();
			
			for each ( var e:XML in xml.event ) {
				var event:com.adobe.webapis.facebook.Event = new com.adobe.webapis.facebook.Event();
				event.eid = parseInt( e.eid );
				event.name = e.name.toString();
				event.tagline = e.tagline.toString();
				event.nid = parseInt( e.nid );
				event.pic_small = e.pic_small.toString();
				event.pic_big = e.pic_big.toString();
				event.pic = e.pic.toString();
				event.host = e.host.toString();
				event.description = e.description.toString();
				event.event_type = e.event_type.toString();
				event.event_subtype = e.event_subtype.toString();
				event.start_time = stringToDate( e.start_time.toString() );
				event.end_time = stringToDate( e.end_time.toString() );
				event.creator = parseInt( e.creator );
				event.update_time = stringToDate( e.update_time.toString() );

				var location:Location = new Location();
				location.city = e.location.city.toString();
				location.state = e.location.state.toString();
				location.country = e.location.country.toString();
				location.zip = e.location.zip.toString();
				event.location = location;
				event.venue = e.venue.toString();
				
				events.push( event );
			}
			
			return events;
		}
		
		/**
		 * Converts a events_getMembers XML object into a string (the events_getMembers value)
		 */
		internal static function parseEventsGetMembers( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a notifications_get XML object into a Notification instance
		 */
		internal static function parseNotificationsGet( xml:XML ):Notification {

			var notification:Notification = new Notification();

			var messages:Object = new Object();
			messages.unread = parseInt( xml.messages.unread );
			messages.most_recent = parseInt( xml.messages.most_recent );
			notification.messages = messages;

			var pokes:Object = new Object();
			pokes.unread = parseInt( xml.pokes.unread );
			pokes.most_recent = parseInt( xml.pokes.most_recent );
			notification.pokes = pokes;

			var shares:Object = new Object();
			shares.unread = parseInt( xml.shares.unread );
			shares.most_recent = parseInt( xml.shares.most_recent );
			notification.shares = shares;

			var friendRequests:Array = new Array();
			for each ( var u:XML in xml.friend_requests.uid ) {
				friendRequests.push( u.toString() )
			}
			notification.friend_requests = friendRequests;

			var groupInvites:Array = new Array();
			for each ( var g:XML in xml.group_invites.uid ) {
				groupInvites.push( g.toString() )
			}
			notification.group_invites = groupInvites;

			var eventInvites:Array = new Array();
			for each ( var e:XML in xml.event_invites.uid ) {
				eventInvites.push( e.toString() )
			}
			notification.event_invites = eventInvites;

			return notification;
		}
		
		/**
		 * Converts a notifications_send XML object into a string (the notifications_send value)
		 */
		internal static function parseNotificationsSend( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a notifications_sendRequest XML object into a string (the notifications_sendRequest value)
		 */
		internal static function parseNotificationsSendRequest( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a profile_setFBML XML object into a string (the profile_setFBML value)
		 */
		internal static function parseProfileSetFBML( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a profile_getFBML XML object into a string (the profile_getFBML value)
		 */
		internal static function parseProfileGetFBML( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a friends_areFriends XML object into a string (the friends_areFriends value)
		 */
		internal static function parseFriendsAreFriends( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a friends_get XML object into an array of User instances
		 */
		internal static function parseFriendsGet( xml:XML ):Array {

			var friends:Array = new Array();
			
			for each ( var f:XML in xml.uid ) {
				var friend:User = new User();
				friend.uid = parseInt( f.toString() );
				
				friends.push( friend );
			}
			
			return friends;
		}

		/**
		 * Converts a friends_getAppUsers XML object into a string (the friends_getAppUsers value)
		 */
		internal static function parseFriendsGetAppUsers( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a fql_query XML object into a string (the fql_query value)
		 */
		internal static function parseFqlQuery( xml:XML ):String {
			return xml.toString();
		}

	}
	
}