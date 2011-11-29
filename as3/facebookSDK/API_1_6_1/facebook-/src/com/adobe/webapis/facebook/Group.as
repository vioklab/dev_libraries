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
	 * Group is a ValueObject for the Facebook API.
	 */
	public class Group {
		
		private var _gid:int;
		private var _name:String;
		private var _nid:int;
		private var _pic_small:String;
		private var _pic_big:String;
		private var _pic:String;
		private var _description:String;
		private var _group_type:String;
		private var _group_subtype:String;
		private var _recent_news:String;
		private var _creator:int;
		private var _update_time:Date;
		private var _office:String;
		private var _website:String;
		private var _venue:String;

		/**
		 * Construct a new Group instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Group() {
		}	
		
		/**
		 * The gid of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get gid():int {
			return _gid;
		}
		
		public function set gid( value:int ):void {
			_gid = value;
		}
		
		/**
		 * The name of the group
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
		 * The nid of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get nid():int {
			return _nid;
		}
		
		public function set nid( value:int ):void {
			_nid = value;
		}
		
		/**
		 * The pic_small of the group
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
		 * The pic_big of the group
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
		 * The pic of the group
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
		 * The description of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get description():String {
			return _description;
		}
		
		public function set description( value:String ):void {
			_description = value;
		}
		
		/**
		 * The group_type of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get group_type():String {
			return _group_type;
		}
		
		public function set group_type( value:String ):void {
			_group_type = value;
		}
		
		/**
		 * The group_subtype of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get group_subtype():String {
			return _group_subtype;
		}
		
		public function set group_subtype( value:String ):void {
			_group_subtype = value;
		}
		
		/**
		 * The recent_news of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get recent_news():String {
			return _recent_news;
		}
		
		public function set recent_news( value:String ):void {
			_recent_news = value;
		}
		
		/**
		 * The creator of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get creator():int {
			return _creator;
		}
		
		public function set creator( value:int ):void {
			_creator = value;
		}
		
		/**
		 * The update_time of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get update_time():Date {
			return _update_time;
		}
		
		public function set update_time( value:Date ):void {
			_update_time = value;
		}
		
		/**
		 * The office of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get office():String {
			return _office;
		}
		
		public function set office( value:String ):void {
			_office = value;
		}
		
		/**
		 * The website of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get website():String {
			return _website;
		}
		
		public function set website( value:String ):void {
			_website = value;
		}
		
		/**
		 * The venue of the group
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get venue():String {
			return _venue;
		}
		
		public function set venue( value:String ):void {
			_venue = value;
		}

	}
	
}