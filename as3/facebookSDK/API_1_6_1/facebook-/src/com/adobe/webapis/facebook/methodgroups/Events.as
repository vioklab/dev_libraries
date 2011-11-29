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
		 *	data - When success is true, contains a "events_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #get
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="eventsGet", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getMembers method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "events_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getMembers
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="eventsGetMembers", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
	
	/**
	 * Contains the methods for the Events method group in the Facebook API.
	 * 
	 * Even though the events are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Events {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Events "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Events( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Returns all visible events according to the filters specified. This may be used 
		 * to find all events of a user, or to query specific eids.
		 * 
		 * @param uid (Optional) Filter by events associated with a user with this uid.
		 * @param eids (Optional) Filter by this list of event ids. This is a comma-separated list of eids.
		 * @param start_time (Optional) Filter with this UTC as lower bound. A missing or zero parameter indicates no lower bound.
		 * @param end_time (Optional) Filter with this UTC as upper bound. A missing or zero parameter indicates no upper bound.
		 * @param rsvp_status (Optional) Filter by this RSVP status.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=events
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get( uid:int = -1, eids:Array = null, start_time:Date = null, end_time:Date = null, rsvp_status:String = "" ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, get_result, 
									"facebook.events.get", 
									true,
									new NameValuePair( "uid", uid == -1 ? "" : uid.toString() ),
									new NameValuePair( "eids", eids == null ? "" : eids.toString() ),
									// convert dates to # of milliseconds
									new NameValuePair( "start_time", start_time == null ? "" : start_time.valueOf().toString() ),
									new NameValuePair( "end_time", end_time == null ? "" : end_time.valueOf().toString() ),
									new NameValuePair( "rsvp_status", rsvp_status ) );
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
			// Create an EVENTS_GET event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.EVENTS_GET );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "events_get_response",
												  MethodGroupHelper.parseEventsGet );
		}
		
		/**
		 * Returns membership list data associated with an event.
		 * 
		 * @param eid Event id.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=events
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getMembers( eid:int ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getMembers_result, 
									"facebook.events.getMembers", 
									true,
									new NameValuePair( "eid", eid.toString() ) );
		}
		
		/**
		 * Capture the result of the getMembers call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getMembers_result( event:flash.events.Event ):void {
			// Create an EVENTS_GET_MEMBERS event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.EVENTS_GET_MEMBERS );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "events_getMembers_response",
												  MethodGroupHelper.parseEventsGetMembers );
		}

	}	
	
}