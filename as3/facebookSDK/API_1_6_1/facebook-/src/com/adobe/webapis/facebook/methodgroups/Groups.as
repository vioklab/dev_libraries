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
		 *	data - When success is true, contains a "groups_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #get
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="groupsGet", 
			 type="com.adobe.webapis.facebook.groups.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getMembers method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "groups_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getMembers
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="groupsGetMembers", 
			 type="com.adobe.webapis.facebook.groups.FacebookResultEvent")]
	
	/**
	 * Contains the methods for the Groups method group in the Facebook API.
	 * 
	 * Even though the groups are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Groups {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Groups "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Groups( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Returns all visible groups according to the filters specified. This may be used 
		 * to find all groups of a user, or to query specific eids.
		 * 
		 * @param uid (Optional) Filter by events associated with a user with this uid.
		 * @param eids (Optional) Filter by this list of event ids. This is a comma-separated list of eids.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=groups
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get( uid:int = -1, gids:Array = null ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, get_result, 
									"facebook.groups.get", 
									true,
									new NameValuePair( "uid", uid == -1 ? "" : uid.toString() ),
									new NameValuePair( "gids", gids == null ? "" : gids.toString() )
									);
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
			// Create an GROUPS_GET event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.GROUPS_GET );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "groups_get_response",
												  MethodGroupHelper.parseGroupsGet );
		}
		
		/**
		 * Returns membership list data associated with an event.
		 * 
		 * @param gid Group id.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=groups
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getMembers( gid:int ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getMembers_result, 
									"facebook.groups.getMembers", 
									true,
									new NameValuePair( "gid", gid.toString() )
									);
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
			// Create an GROUPS_GET_MEMBERS event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.GROUPS_GET_MEMBERS );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "groups_getMembers_response",
												  MethodGroupHelper.parseGroupsGetMembers );
		}

	}	
	
}