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
		 * Broadcast as a result of the get method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "notifications_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #get
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="notificationsGet", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the send method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "notifications_send_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #send
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="notificationsSend", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the sendRequest method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "notifications_sendRequest_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #sendRequest
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="notificationsSendRequest", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
		
	/**
	 * Contains the methods for the Feed method group in the Facebook API.
	 * 
	 * Even though the events are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Notifications {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Feed "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Notifications( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Returns information on outstanding Facebook notifications for current session user.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=notifications
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, get_result, "facebook.notifications.get", true );
		}
		
		/**
		 * Capture the result of the get call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function get_result( event:flash.events.Event ):void {
			// Create an NOTIFICATIONS_GET event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.NOTIFICATIONS_GET );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "notifications_get_response",
												  MethodGroupHelper.parseNotificationsGet );
		}
		
		/**
		 * Send a notification to a set of users. You can send emails to users that have added 
		 * the application without any confirmation, or you can direct a user of your application 
		 * to the URL returned by this function to email users who have not yet added your application.
		 * 
		 * @param to_ids Comma-separated list of recipient ids. These must be friends of the logged-in user or people who have added your application.
		 * @param notification FBML for the notifications page.
		 * @param email (Optional) FBML for the email. If not passed, no email will be sent.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=notifications
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function send( to_ids:Array, notification:String, email:String = "" ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, send_result, 
									"facebook.notifications.send", 
									true,
									new NameValuePair( "to_ids", to_ids.toString() ),
									new NameValuePair( "notification", notification ),
									new NameValuePair( "email", email ) );
		}
		
		/**
		 * Capture the result of the get call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function send_result( event:flash.events.Event ):void {
			// Create an NOTIFICATIONS_GET event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.NOTIFICATIONS_SEND );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "notifications_send_response",
												  MethodGroupHelper.parseNotificationsSend );
		}
		
		/**
		 * Send a request or invitation to a set of users. You can send requests to users 
		 * that have added the application without any confirmation, or you can direct a 
		 * user of your application to the URL returned by this function to send requests 
		 * to users who have not yet added your application.
		 * 
		 * @param to_ids Comma-separated list of recipient ids. These must be friends of the logged-in user or people who have added your application.
		 * @param type The type of request/invitation - e.g. the word "event" in "1 event invitation."
		 * @param content Content of the request/invitation. This should be FBML containing only links and the special tag <fb:req-choice url="" label="" /> to specify the buttons to be included in the request.
		 * @param image URL of an image to show beside the request. It will be resized to be 100 pixels wide.
		 * @param invite Whether to call this an "invitation" or a "request".
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=notifications
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function sendRequest( to_ids:Array, type:String, content:String, image:String, invite:Boolean = false ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, send_result, 
									"facebook.notifications.sendRequest", 
									true,
									new NameValuePair( "to_ids", to_ids.toString() ),
									new NameValuePair( "type", type ),
									new NameValuePair( "content", content ),
									new NameValuePair( "image", image ),
									new NameValuePair( "invite", invite ? "1" : "0" )
									);
		}
		
		/**
		 * Capture the result of the sendRequest call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function sendRequest_result( event:flash.events.Event ):void {
			// Create an NOTIFICATIONS_SEND_REQUEST event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.NOTIFICATIONS_SEND_REQUEST );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "notifications_sendRequest_response",
												  MethodGroupHelper.parseNotificationsSendRequest );
		}
		
	}	
	
}