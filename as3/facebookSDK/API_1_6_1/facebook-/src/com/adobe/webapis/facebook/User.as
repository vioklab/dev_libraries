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
	
	/**
	 * User is a ValueObject for the Facebook API.
	 */
	public class User {
		
		private var _uid:int;
		private var _first_name:String;
		private var _last_name:String;
		private var _name:String;
		private var _pic_small:String;
		private var _pic_big:String;
		private var _pic_square:String;
		private var _pic:String;
		private var _affiliations:Array;
		private var _profile_update_time:Date;
		private var _timezone:int;
		private var _religion:String;
		private var _birthday:String;
		private var _sex:String;
		private var _hometown_location:Location;
		private var _meeting_sex:Array;
		private var _meeting_for:Array;
		private var _relationship_status:String;
		private var _significant_other_id:int;
		private var _political:String;
		private var _current_location:Location;
		private var _activities:String;
		private var _interests:String;
		private var _is_app_user:Boolean;
		private var _music:String;
		private var _tv:String;
		private var _movies:String;
		private var _books:String;
		private var _quotes:String;
		private var _about_me:String;
		private var _hs_info:HsInfo;
		private var _education_history:Array;
		private var _work_history:Array;
		private var _notes_count:String;
		private var _wall_count:String;
		private var _status:String;
		private var _has_added_app:Boolean;

		/**
		 * Construct a new User instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function User() {
			_affiliations = new Array();
			_meeting_sex = new Array();
			_meeting_for = new Array();
			_education_history = new Array();
			_work_history = new Array();
		}	
		
		/**
		 * The uid of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get uid():int {
			return _uid;
		}
		
		public function set uid( value:int ):void {
			_uid = value;
		}
		
		/**
		 * The first_name of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get first_name():String {
			return _first_name;
		}
		
		public function set first_name( value:String ):void {
			_first_name = value;
		}
		
		/**
		 * The last_name of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get last_name():String {
			return _last_name;
		}
		
		public function set last_name( value:String ):void {
			_last_name = value;
		}
		
		/**
		 * The name of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get name():String {
			return _name;
		}
		
		public function set name( value:String ):void {
			_name = value;
		}
		
		/**
		 * The pic_small of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic_small():String {
			return _pic_small;
		}
		
		public function set pic_small( value:String ):void {
			_pic_small = value;
		}
		
		/**
		 * The pic_big of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic_big():String {
			return _pic_big;
		}
		
		public function set pic_big( value:String ):void {
			_pic_big = value;
		}
		
		/**
		 * The pic_square of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic_square():String {
			return _pic_square;
		}
		
		public function set pic_square( value:String ):void {
			_pic_square = value;
		}
		
		/**
		 * The pic of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic():String {
			return _pic;
		}
		
		public function set pic( value:String ):void {
			_pic = value;
		}
		
		/**
		 * The affiliations of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get affiliations():Array {
			return _affiliations;
		}
		
		public function set affiliations( value:Array ):void {
			_affiliations = value;
		}
		
		/**
		 * The profile_update_time of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get profile_update_time():Date {
			return _profile_update_time;
		}
		
		public function set profile_update_time( value:Date ):void {
			_profile_update_time = value;
		}
		
		/**
		 * The timezone of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get timezone():int {
			return _timezone;
		}
		
		public function set timezone( value:int ):void {
			_timezone = value;
		}
		
		/**
		 * The religion of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get religion():String {
			return _religion;
		}
		
		public function set religion( value:String ):void {
			_religion = value;
		}
		
		/**
		 * The birthday of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get birthday():String {
			return _birthday;
		}
		
		public function set birthday( value:String ):void {
			_birthday = value;
		}
		
		/**
		 * The sex of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sex():String {
			return _sex;
		}
		
		public function set sex( value:String ):void {
			_sex = value;
		}
		
		/**
		 * The hometown_location of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get hometown_location():Location {
			return _hometown_location;
		}
		
		public function set hometown_location( value:Location ):void {
			_hometown_location = value;
		}
		
		/**
		 * The meeting_sex of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get meeting_sex():Array {
			return _meeting_sex;
		}
		
		public function set meeting_sex( value:Array ):void {
			_meeting_sex = value;
		}
		
		/**
		 * The meeting_for of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get meeting_for():Array {
			return _meeting_for;
		}
		
		public function set meeting_for( value:Array ):void {
			_meeting_for = value;
		}
		
		/**
		 * The relationship_status of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get relationship_status():String {
			return _relationship_status;
		}
		
		public function set relationship_status( value:String ):void {
			_relationship_status = value;
		}
		
		/**
		 * The significant_other_id of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get significant_other_id():int {
			return _significant_other_id;
		}
		
		public function set significant_other_id( value:int ):void {
			_significant_other_id = value;
		}
		
		/**
		 * The political of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get political():String {
			return _political;
		}
		
		public function set political( value:String ):void {
			_political = value;
		}
		
		/**
		 * The current_location of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get current_location():Location {
			return _current_location;
		}
		
		public function set current_location( value:Location ):void {
			_current_location = value;
		}
		
		/**
		 * The activities of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get activities():String {
			return _activities;
		}
		
		public function set activities( value:String ):void {
			_activities = value;
		}
		
		/**
		 * The interests of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get interests():String {
			return _interests;
		}
		
		public function set interests( value:String ):void {
			_interests = value;
		}
		
		/**
		 * The is_app_user of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get is_app_user():Boolean {
			return _is_app_user;
		}
		
		public function set is_app_user( value:Boolean ):void {
			_is_app_user = value;
		}
		
		/**
		 * The music of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get music():String {
			return _music;
		}
		
		public function set music( value:String ):void {
			_music = value;
		}
		
		/**
		 * The tv of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get tv():String {
			return _tv;
		}
		
		public function set tv( value:String ):void {
			_tv = value;
		}
		
		/**
		 * The movies of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get movies():String {
			return _movies;
		}
		
		public function set movies( value:String ):void {
			_movies = value;
		}
		
		/**
		 * The books of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get books():String {
			return _books;
		}
		
		public function set books( value:String ):void {
			_books = value;
		}
		
		/**
		 * The quotes of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get quotes():String {
			return _quotes;
		}
		
		public function set quotes( value:String ):void {
			_quotes = value;
		}
		
		/**
		 * The about_me of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get about_me():String {
			return _about_me;
		}
		
		public function set about_me( value:String ):void {
			_about_me = value;
		}
		
		/**
		 * The high school info of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get hs_info():HsInfo {
			return _hs_info;
		}
		
		public function set hs_info( value:HsInfo ):void {
			_hs_info = value;
		}
		
		/**
		 * The education_history of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get education_history():Array {
			return _education_history;
		}
		
		public function set education_history( value:Array ):void {
			_education_history = value;
		}
		
		/**
		 * The work_history of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get work_history():Array {
			return _work_history;
		}
		
		public function set work_history( value:Array ):void {
			_work_history = value;
		}
		
		/**
		 * The notes_count of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get notes_count():String {
			return _notes_count;
		}
		
		public function set notes_count( value:String ):void {
			_notes_count = value;
		}
		
		/**
		 * The wall_count of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get wall_count():String {
			return _wall_count;
		}
		
		public function set wall_count( value:String ):void {
			_wall_count = value;
		}
		
		/**
		 * The status of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get status():String {
			return _status;
		}
		
		public function set status( value:String ):void {
			_status = value;
		}
		
		/**
		 * The has_added_app of the user
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get has_added_app():Boolean {
			return _has_added_app;
		}
		
		public function set has_added_app( value:Boolean ):void {
			_has_added_app = value;
		}

	}
	
}