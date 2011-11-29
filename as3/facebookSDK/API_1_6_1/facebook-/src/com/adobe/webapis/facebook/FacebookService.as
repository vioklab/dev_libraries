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

package com.adobe.webapis.facebook {
	
	import com.adobe.webapis.facebook.facebookservice_internal;
	import com.adobe.crypto.MD5;
	import com.adobe.webapis.URLLoaderBase;
	import com.adobe.webapis.facebook.methodgroups.*;
	import flash.net.URLLoader;
	
	/**
	 * Class that provides an ActionScript 3 API to the Facebook platform.
	 * 
	 * @see http://developers.facebook.com
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 8.5
	 * @tiptext
	 *
 	 * @author Keith Salisbury, www.globalkeith.com
	 */
	public class FacebookService extends URLLoaderBase {
		
		/**
		 * The REST endpoint where we can talk with Facebook service
		 */
		public static const END_POINT:String = "http://api.facebook.com/restserver.php?";
		
		/**
		 * The endpoint where we go for authentication
		 */
		public static const AUTH_END_POINT:String = "http://www.facebook.com/login.php?";
		
		/** 
		 * Store the API key that gives developers access to the Facebook service 
		 */
		private var _api_key:String;

		/** 
		 * The format the responses are returned.
		 */
		private var _format:int;
		
		/** 
		 * Store the session key of the logged in user. 
		 */
		private var _session_key:String;

		/** 
		 * The version of the API.
		 */
		private var _version:String;

		/**
		 * The "shared secret" of your application for authentication
		 */
		private var _secret:String;
		
		/**
		 * The token identifying the user as logged in
		 */
		private var _auth_token:String;
		
		/**
		 * Private variable that we provide read-only access to
		 */
		private var _auth:Auth;
		private var _fbml:Fbml;
		private var _feed:Feed;
		private var _friends:Friends;
		private var _notifications:Notifications;
		private var _profile:Profile;
		private var _users:Users;
		private var _events:Events;
		private var _groups:Groups;
		private var _photos:Photos;
		
		public function FacebookService( api_key:String ) {
			_api_key = api_key;
			_secret = "";
			_auth_token = "";
			_session_key = "";
			_version = "1.0";
			_format = ResponseFormats.FLASH;
			
			_auth = new Auth( this );
			_fbml = new Fbml( this );
			_feed = new Feed( this );
			_friends = new Friends( this );
			_notifications = new Notifications( this );
			_profile = new Profile( this );
			_users = new Users( this );
			_events = new Events( this );
			_groups = new Groups( this );
			_photos = new Photos( this );
			
		}
		
		/**
		 * Returns the current API key in use for accessing the Facebook service.
		 *  
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get api_key():String {
			return _api_key;
		}
		
		/**
		 * Sets the API key that should be used to access the Facebook service.
		 *
		 * @param value The API key to use against Facebook.com
		 * @see http://developers.facebook.com/documentation.php?v=1.0&method=auth.getSession
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set api_key( value:String ):void {
			_api_key = value;
		}
		
		/**
		 * Returns the current API version in use for accessing the Facebook service.
		 *  
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get version():String {
			return _version;	
		}
		
		/**
		 * Sets the API version that should be used to access the Facebook service.
		 *
		 * @param value The API version to use against Facebook.com
		 * @see http://developers.facebook.com/documentation.php?v=1.0&method=auth.getSession
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set version( value:String ):void {
			_version = value;	
		}
		
		/**
		 * Returns the current session key of the logged in user.
		 *  
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get session_key():String {
			return _session_key;	
		}
		
		/**
		 * Sets the session key for the logged in user.
		 *
		 * @param value The session key to use against Facebook.com
		 * @see http://developers.facebook.com/documentation.php?v=1.0&method=auth.getSession
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set session_key( value:String ):void {
			_session_key = value;	
		}

		/**
		 * Returns the "shared secret" of the Application associated with
		 * the API key for use in Authentication.
		 * 
		 * @see http://www.facebook.com/developers/apps.php
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get secret():String {
			return _secret;	
		}
		
		/**
		 * Sets the "shared secret" to that of an Application configured against
		 * the API key for use in Authentication.
		 *
		 * @param value The "shared secret" of the Application to authenticate 
		 *			against.
		 * @see http://www.facebook.com/developers/apps.php
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set secret( value:String ):void {
			_secret = value;	
		}
		
		/**
		 * Returns the auth_token identifying the user as logged in
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get auth_token():String {
			return _auth_token;	
		}
		
		/**
		 * Sets the token identifyin the user as logged in so that
		 * the FacebookService API can sign the method calls correctly.
		 *
		 * @param value The authentication token
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set auth_token( value:String ):void {
			_auth_token = value;	
		}
		
		/**
		 * Provide read-only access to the Auth method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get auth():Auth {
			return _auth;	
		}
		
		/**
		 * Provide read-only access to the Fbml method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get fbml():Fbml {
			return _fbml;	
		}
		
		/**
		 * Provide read-only access to the Feed method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get feed():Feed {
			return _feed;	
		}
		
		/**
		 * Provide read-only access to the Friends method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get friends():Friends {
			return _friends;	
		}
		
		/**
		 * Provide read-only access to the Notifications method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get notifications():Notifications {
			return _notifications;	
		}

		/**
		 * Provide read-only access to the Profile method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get profile():Profile {
			return _profile;	
		}

		/**
		 * Provide read-only access to the Users method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get users():Users {
			return _users;	
		}

		/**
		 * Provide read-only access to the Events method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get events():Events {
			return _events;	
		}

		/**
		 * Provide read-only access to the Groups method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get groups():Groups {
			return _groups;	
		}

		/**
		 * Provide read-only access to the Photos method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get photos():Photos {
			return _photos;	
		}

		/**
		 * Returns the URL to use for authentication so the developer
		 * doesn't have to build it by hand.
		 *
		 * @param token The auth_token from flickr.auth.createToken to authenticate with
		 * @return The url to open a browser to to authenticate against
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getLoginURL( auth_token:String ):String {
			/* TODO: Add other login url parameters
			next	A way for web based applications to preserve some state for this login - this will get appended to their callback_url after the user logs in as described below. Optional.
			auth_token	Before generating the login URL, the desktop application should call the facebook.auth.createToken API function, and then use the auth_token returned by that function here. Required for desktop apps.
			popup	An alternative style for the login page that does not contain any Facebook navigational elements. For the best results, the pop-up should ideally have the following dimensions: width=646 pixels, height=436 pixels. Optional.
			skipcookie	Pass this in to allow a user to re-enter their login information. This may be useful if another Facebook user previously forgot to logout. Optional.
			hide_checkbox	Pass this in to hide the "Save my login info" checkbox from the user. This may be useful if your application does not wish to persist the user's session information. See the "Infinite Sessions" section below for more info. Optional.
			*/
			
			var auth_url:String = AUTH_END_POINT;
			auth_url += "api_key=" + api_key;
			auth_url += "&v=" + version;
			//auth_url += "&auth_token=" + auth_token; // required for desktop apps
			//auth_url += "&api_sig=" + MD5.hash( sig );
			
			return auth_url;
		}
		
		/**
		 * Use our "internal" namespace to provide access to the URLLoader
		 * from this class to the helper classes in the methodgroups package.
		 * This keeps this method away from the public API since it is not meant
		 * to be used by the public.
		 */
		facebookservice_internal function get urlLoader():URLLoader {
			return getURLLoader();	
		}
		
	}
	
}
