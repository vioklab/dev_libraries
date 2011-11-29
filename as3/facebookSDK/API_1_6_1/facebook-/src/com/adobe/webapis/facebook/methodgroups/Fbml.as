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
		 * Broadcast as a result of the refreshImgSrc method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "fbml_refreshImgSrc_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #RefreshImgSrc
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="fbmlRefreshImgSrc", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
		
		/**
		 * Broadcast as a result of the refreshRefUrl method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains an "fbml_refreshRefUrl_response"
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #refreshRefUrl
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="fbmlRefreshRefUrl", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]	
		
		/**
		 * Broadcast as a result of the setRefHandle method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains an "fbml_setRefHandle_response"
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #setRefHandle
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="fbmlSetRefHandle", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]	
	
	/**
	 * Contains the methods for the Auth method group in the Facebook API.
	 * 
	 * Even though the events are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Fbml {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Auth "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Fbml( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Fetches and re-caches the image stored at the given URL, for use in images published 
		 * to non-canvas pages via the API (e.g. to user profiles via facebook.profile.setFBML, 
		 * or to news feed via facebook.feed.publishActionOfUser).
		 * 
		 * @param url Absolute URL from which to refresh the image.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&method=fbml.refreshImgSrc
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function refreshImgSrc( url:String ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, refreshImgSrc_result, 
										"facebook.fbml.refreshImgSrc",
										true,
										new NameValuePair( "url", url ) );
		}
		
		/**
		 * Capture the result of the refreshImgSrc call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function refreshImgSrc_result( event:flash.events.Event ):void {
			// Create an FBML_REFRESH_IMG_SRC event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.FBML_REFRESH_IMG_SRC );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "fbml_refreshImgSrc_response",
												  MethodGroupHelper.parseFbmlRefreshImgSrc );
		}
		
		/**
		 * Fetches and re-caches the content stored at the given URL, for use in a fb:ref FBML tag.
		 * 
		 * @param url Absolute URL from which to fetch content. This URL should be used in a fb:ref FBML tag.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&method=fbml.refreshRefUrl
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function refreshRefUrl( url:String ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, refreshRefUrl_result, 
										"facebook.fbml.refreshImgSrc", 
										true,
										new NameValuePair( "url", url ) );
		}
		
		/**
		 * Capture the result of the refreshRefUrl call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function refreshRefUrl_result( event:flash.events.Event ):void {
			// Create an FBML_REFRESH_REF_URL event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.FBML_REFRESH_REF_URL );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "fbml_refreshRefUrl_response",
												  MethodGroupHelper.parseFbmlRefreshRefUrl );
		}
		
		/**
		 * Associates a given "handle" with FBML markup so that the handle can be used within the
		 * fb:ref FBML tag. A handle is unique within an application and allows an application to 
		 * publish identical FBML to many user profiles and do subsequent updates without having 
		 * to republish FBML on behalf of each user.
		 * 
		 * @param handle Handle to associate with the given FBML.
		 * @param fbml FBML to associate with the given handle.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&method=fbml.refreshRefUrl
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function setRefHandle( handle:String, fbml:String ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, setRefHandle_result,
									"facebook.fbml.setRefHandle", 
									true,
									new NameValuePair( "handle", handle ),
									new NameValuePair( "fbml", fbml ) );
		}
		
		/**
		 * Capture the result of the setRefHandle call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function setRefHandle_result( event:flash.events.Event ):void {
			// Create an FBML_SET_REF_HANDLE event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.FBML_SET_REF_HANDLE );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "fbml_setRefHandle_response",
												  MethodGroupHelper.parseFbmlSetRefHandle );
		}
		
	}	
	
}