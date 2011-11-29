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
		 * Broadcast as a result of the setFBML method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "profile_setFBML_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #setFBML
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="profileSetFBML", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getFBML method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "profile_setFBML_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getFBML
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="profileGetFBML", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
		
	/**
	 * Contains the methods for the Feed method group in the Facebook API.
	 * 
	 * Even though the events are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Profile {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Profile "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Profile( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Sets the FBML for a user's profile, including the content for both the profile 
		 * box and the profile actions.
		 * 
		 * @param markup The FBML intended for the user's profile.
		 * @param uid (Optional) The user whose profile is to be updated. Not allowed for desktop applications (since the application secret is essentially public).
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=profile
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function setFBML( markup:String, uid:int = -1 ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, setFBML_result, 
									"facebook.profile.setFBML", 
									true,
									new NameValuePair( "markup", markup ),
									new NameValuePair( "uid", uid == -1 ? "" : uid.toString() )
									);
		}
		
		/**
		 * Capture the result of the setFBML call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function setFBML_result( event:flash.events.Event ):void {
			// Create an PROFILE_SET_FBML event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PROFILE_SET_FBML );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "profile_setFBML_response",
												  MethodGroupHelper.parseProfileSetFBML );
		}
		
		/**
		 * Gets the FBML that is currently set for a user's profile.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=profile
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getFBML():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getFBML_result, "facebook.profile.getFBML", true );
		}
		
		/**
		 * Capture the result of the setFBML call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getFBML_result( event:flash.events.Event ):void {
			// Create an PROFILE_GET_FBML event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PROFILE_GET_FBML );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "profile_getFBML_response",
												  MethodGroupHelper.parseProfileGetFBML );
		}
		
	}	
	
}