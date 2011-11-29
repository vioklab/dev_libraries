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
	
	import com.adobe.webapis.facebook.events.FacebookResultEvent;
	import com.adobe.webapis.facebook.*;
	import flash.events.Event;
	import flash.net.URLLoader;
	
		/**
		 * Broadcast as a result of the getInfo method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "users_getInfo_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getInfo
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="usersGetInfo", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getLoggedInUser method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "users_getLoggedInUser_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getLoggedInUser
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="usersGetLoggedInUser", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]

	/**
	 * Contains the methods for the Feed method group in the Facebook API.
	 * 
	 * Even though the events are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Users {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Users "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Users( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Returns a wide array of user-specific information for each user 
		 * identifier passed, limited by the view of the current user. The 
		 * current user is determined from the session_key parameter. The 
		 * only storable values returned from this call are the those under 
		 * the affiliations element, the notes_count value, and the contents 
		 * of the profile_update_time element.
		 * 
		 * @param uids List of user ids. This is a comma-separated list of user ids.
		 * @param fields List of desired fields in return. This is a comma-separated list of field strings.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=users
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getInfo( uids:Array, fields:Array ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getInfo_result, 
									"facebook.users.getInfo", 
									true,
									new NameValuePair( "uids", uids.toString() ),
									new NameValuePair( "fields", fields.toString() )
									 );
		}
		
		/**
		 * Capture the result of the getInfo call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getInfo_result( event:flash.events.Event ):void {
			// Create an USERS_GET_INFO event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.USERS_GET_INFO );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "users_getInfo_response",
												  MethodGroupHelper.parseUsersGetInfo );
		}
		
		/**
		 * Gets the user id (uid) associated with the current sesssion. This value 
		 * should be stored for the duration of the session, to avoid unnecessary 
		 * subsequent calls to this method. The same value is also returned by 
		 * facebook.auth.getSession.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=users
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getLoggedInUser():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getLoggedInUser_result, "facebook.users.getLoggedInUser", true );
		}
		
		/**
		 * Capture the result of the getInfo call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getLoggedInUser_result( event:flash.events.Event ):void {
			// Create an USERS_GET_LOGGED_IN_USER event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.USERS_GET_LOGGED_IN_USER );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "users_getLoggedInUser_response",
												  MethodGroupHelper.parseUsersGetLoggedInUser );
		}

	}	
	
}