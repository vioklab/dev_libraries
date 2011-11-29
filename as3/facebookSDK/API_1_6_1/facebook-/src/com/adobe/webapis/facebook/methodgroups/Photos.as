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
		 * Broadcast as a result of the addTag method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_addTag_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #addTag
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosAddTag", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the createAlbum method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_createAlbum_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #createAlbum
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosCreateAlbum", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the get method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #get
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosGet", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getAlbums method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getAlbums
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosGetAlbums", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getTags method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getTags
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosGetTags", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
	/**
	 * Contains the methods for the Photos method group in the Facebook API.
	 * 
	 * Even though the photos are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Photos {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Photos "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Photos( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Adds a tag with the given information to a photo. See photo uploads for a 
		 * description of the upload workflow.
		 * 
		 * @param pid The photo id of the photo to be tagged.
		 * @param tag_uid The user id of the user being tagged. Either tag_uid or tag_text must be specified.
		 * @param tag_text Some text identifying the person being tagged. Either tag_uid or tag_text must be specified. This parameter is ignored if tag_uid is specified.
		 * @param x The horizontal position of the tag, as a percentage from 0 to 100, from the left of the photo.
		 * @param y The vertical position of the tag, as a percentage from 0 to 100, from the top of the photo.
		 * @param tags A JSON-serialized array representing a list of tags to be added to the photo. If the tags parameter is specified, the x, y, tag_uid, and tag_text parameters are ignored. Each tag in the list must specify: "x", "y", and either the user id "tag_uid" or free-form "tag_text" identifying the person being tagged. 
		 * 				An example of this is the string [{"x":"30.0","y":"30.0","tag_uid":1234567890}, {"x":"70.0","y":"70.0","tag_text":"some person"}].
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function addTag( pid:int, tag_uid:int, tag_text:String, x:Number, y:Number, tags:String ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, addTag_result, 
									"facebook.photos.addTag", 
									true,
									new NameValuePair( "pid", pid.toString() ),
									new NameValuePair( "tag_uid", tag_uid.toString() ),
									new NameValuePair( "tag_text", tag_text ),
									new NameValuePair( "x", x.toString() ),
									new NameValuePair( "y", y.toString() ),
									new NameValuePair( "tags", tags ) );
		}
		
		/**
		 * Capture the result of the addTag call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function addTag_result( event:flash.events.Event ):void {
			// Create an PHOTOS_ADD_TAG event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_ADD_TAG );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_addTag_response",
												  MethodGroupHelper.parsePhotosAddTag );
		}
		
		/**
		 * Creates and returns a new album owned by the current session user. See photo uploads for a 
		 * description of the upload workflow. The only storable values returned from this call are 
		 * aid and owner.
		 * 
		 * @param name The album name.
		 * @param location (Optional) The album location.
		 * @param description (Optional) The album description.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function createAlbum( name:String, location:String = "", description:String = "" ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, createAlbum_result, 
									"facebook.photos.createAlbum", 
									true,
									new NameValuePair( "name", name ),
									new NameValuePair( "location", location ),
									new NameValuePair( "description", description ) );
		}
		
		/**
		 * Capture the result of the createAlbum call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function createAlbum_result( event:flash.events.Event ):void {
			// Create an PHOTOS_CREATE_ALBUM event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_CREATE_ALBUM );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_createAlbum_response",
												  MethodGroupHelper.parsePhotosCreateAlbum );
		}
		
		/**
		 * Returns all visible photos according to the filters specified. This may be used 
		 * to find all photos of a user, or to query specific eids. Note: It is an error to 
		 * omit all three of the subj_id, aid, and pids parameters. They have no defaults.
		 * 
		 * @param subj_id (Optional) Filter by photos associated tagged with this user.
		 * @param aid (Optional) Filter by photos in this album.
		 * @param pids (Optional) Filter by photos in this list. This is a comma-separated list of pids.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get( subj_id:int = -1, aid:int = -1, pids:Array = null ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, get_result, 
									"facebook.photos.get", 
									true,
									new NameValuePair( "subj_id", subj_id == -1 ? "" : subj_id.toString() ),
									new NameValuePair( "aid", aid == -1 ? "" : aid.toString() ),
									new NameValuePair( "pids", pids == null ? "" : pids.toString() ) );
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
			// Create an PHOTOS_GET event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_GET );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_get_response",
												  MethodGroupHelper.parsePhotosGet );
		}
		
		/**
		 * Returns membership list data associated with an event.
		 * 
		 * @param uid (Optional) Return albums created by this user.
		 * @param pids (Optional) Return albums with aids in this list. This is a comma-separated list of pids.
	 	 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getAlbums( uid:int, pids:Array ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getAlbums_result, 
									"facebook.photos.getAlbums", 
									true,
									new NameValuePair( "uid", uid == -1 ? "" : uid.toString() ),
									new NameValuePair( "pids", pids.toString() ) );
		}
		
		/**
		 * Capture the result of the getAlbums call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getAlbums_result( event:flash.events.Event ):void {
			// Create an PHOTOS_GET_MEMBERS event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_GET_ALBUMS );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_getAlbums_response",
												  MethodGroupHelper.parsePhotosGetAlbums );
		}
		
		/**
		 * Returns membership list data associated with an event.
		 * 
		 * @param pids The list of photos from which to extract photo tags. This is a comma-separated list of pids.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getTags( pids:Array ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getTags_result, 
									"facebook.photos.getTags", 
									true,
									new NameValuePair( "pids", pids.toString() ) );
		}
		
		/**
		 * Capture the result of the getTags call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getTags_result( event:flash.events.Event ):void {
			// Create an PHOTOS_GET_TAGS event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_GET_TAGS );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_getTags_response",
												  MethodGroupHelper.parsePhotosGetTags );
		}
		
		/**
		 * Uploads a photo owned by the current session user and returns the new photo. 
		 * See photo uploads for a description of the upload workflow. The only storable 
		 * values returned from this call are pid, aid, and owner.
		 * 
		 * Note: This signature is different from the facebook api because in Actionscript 
		 * required parameters are not permitted *after* optional parameters.
		 * 
		 * @param data (Optional) The raw image data for the photo.
		 * @param aid (Optional) The album id of the destination album.
		 * @param caption (Optional) The caption of the photo.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function upload( data:String, aid:int = -1, caption:String = "" ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, upload_result, 
									"facebook.photos.upload", 
									true, 
									new NameValuePair( "aid", aid == -1 ? "" : aid.toString() ),
									new NameValuePair( "caption", caption ),
									new NameValuePair( "data", data ) );
		}
		
		/**
		 * Capture the result of the upload call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function upload_result( event:flash.events.Event ):void {
			// Create an PHOTOS_UPLOAD event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_UPLOAD );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_upload_response",
												  MethodGroupHelper.parsePhotosUpload );
		}

	}	
	
}