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

package com.adobe.webapis.facebook.events {

	import com.adobe.webapis.events.ServiceEvent;
	
	/**
	* Event class that contains information about events broadcast in response
	* to data events from the Facebook API.
	*/
	public class FacebookResultEvent extends ServiceEvent
	{
		/* Authentication */
		
		/** Constant for the authCreateToken event type. */
		public static const AUTH_CREATE_TOKEN:String = "authCreateToken";
		
		/** Constant for the authGetSession event type. */
		public static const AUTH_GET_SESSION:String = "authGetSession";
		
		/* FQL Query */

		/** Constant for the fqlQuery event type. */
		public static const FQL_QUERY:String = "fqlQuery";
		
		/* Events */

		/** Constant for the eventsGet event type. */
		public static const EVENTS_GET:String = "eventsGet";

		/** Constant for the eventsGetMembers event type. */
		public static const EVENTS_GET_MEMBERS:String = "eventsGetMembers";
		
		/* Friends */
		
		/** Constant for the friendsAreFriends event type. */
		public static const FRIENDS_ARE_FRIENDS:String = "friendsAreFriends";
		
		/** Constant for the friendsGet event type. */
		public static const FRIENDS_GET:String = "friendsGet";
		
		/** Constant for the friendsGetAppUsers event type. */
		public static const FRIENDS_GET_APP_USERS:String = "friendsGetAppUsers";
		
		/** Constant for the friendsGetRequests event type. */
		public static const FRIENDS_GET_REQUESTS:String = "friendsGetRequests";
		
		/* Users */

		/** Constant for the usersGetInfo event type. */
		public static const USERS_GET_INFO:String = "usersGetInfo";

		/** Constant for the usersGetLoggedInUser event type. */
		public static const USERS_GET_LOGGED_IN_USER:String = "usersGetLoggedInUser";

		/** Constant for the usersIsAppAdded event type. */
		public static const USERS_IS_APP_ADDED:String = "usersIsAppAdded";
		
		/* Photos */

		/** Constant for the photosAddTag event type. */
		public static const PHOTOS_ADD_TAG:String = "photosAddTag";

		/** Constant for the photosCreateAlbum event type. */
		public static const PHOTOS_CREATE_ALBUM:String = "photosCreateAlbum";

		/** Constant for the photosGet event type. */
		public static const PHOTOS_GET:String = "photosGet";

		/** Constant for the photosGetAlbums event type. */
		public static const PHOTOS_GET_ALBUMS:String = "photosGetAlbums";

		/** Constant for the photosGetTags event type. */
		public static const PHOTOS_GET_TAGS:String = "photosGetTags";

		/** Constant for the photosUpload event type. */
		public static const PHOTOS_UPLOAD:String = "photosUpload";
		
		/* Notifications */
		
		/** Constant for the noticationsGet event type. */
		public static const NOTIFICATIONS_GET:String = "noticationsGet";
		
		/** Constant for the noticationsSend event type. */
		public static const NOTIFICATIONS_SEND:String = "noticationsSend";
		
		/** Constant for the noticationsSendRequest event type. */
		public static const NOTIFICATIONS_SEND_REQUEST:String = "noticationsSendRequest";
		
		/* Profile */

		/** Constant for the profileSetFbml event type. */
		public static const PROFILE_SET_FBML:String = "profileSetFbml";

		/** Constant for the profileGetFbml event type. */
		public static const PROFILE_GET_FBML:String = "profileGetFbml";
		
		/* Groups */

		/** Constant for the groupsGet event type. */
		public static const GROUPS_GET:String = "groupsGet";

		/** Constant for the groupsGetMembers event type. */
		public static const GROUPS_GET_MEMBERS:String = "groupsGetMembers";
		
		/* FBML */

		/** Constant for the fbmlRefreshRefUrl event type. */
		public static const FBML_REFRESH_REF_URL:String = "fbmlRefreshRefUrl";

		/** Constant for the fbmlRefreshImgSrc event type. */
		public static const FBML_REFRESH_IMG_SRC:String = "fbmlRefreshImgSrc";

		/** Constant for the fbmlSetRefHandle event type. */
		public static const FBML_SET_REF_HANDLE:String = "fbmlSetRefHandle";
		
		/* Feed */
		
		/** Constant for the feedPublishStoryToUser event type. */
		public static const FEED_PUBLISH_STORY_TO_USER:String = "feedPublishStoryToUser";
		
		/** Constant for the feedPublishActionOfUser event type. */
		public static const FEED_PUBLISH_ACTION_OF_USER:String = "feedPublishActionOfUser";
		
		/**
		 * True if the event is the result of a successful call,
		 * False if the call failed
		 */
		public var success:Boolean;
		
		/**
		 * Constructs a new FacebookResultEvent
		 */
		public function FacebookResultEvent( type:String, 
										   bubbles:Boolean = false, 
										   cancelable:Boolean = false ) {
										   	
			super( type, bubbles, cancelable );
		}
	
	}
	
}