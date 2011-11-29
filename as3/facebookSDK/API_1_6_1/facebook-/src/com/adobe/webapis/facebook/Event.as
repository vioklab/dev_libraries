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
	 * Event is a ValueObject for the Facebook API.
	 */
	public class Event {
		
		private var _eid:int;
		private var _name:String;
		private var _tagline:String;
		private var _nid:int;
		private var _pic_small:String;
		private var _pic_big:String;
		private var _pic:String;
		private var _host:String;
		private var _description:String;
		private var _event_type:String;
		private var _event_subtype:String;
		private var _start_time:Date;
		private var _end_time:Date;
		private var _creator:int;
		private var _update_time:Date;
		private var _location:Location;
		private var _venue:String;

		/**
		 * Construct a new Event instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Event() {
		}	
		
		/**
		 * The eid of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get eid():int {
			return _eid;
		}
		
		public function set eid( value:int ):void {
			_eid = value;
		}
		
		/**
		 * The name of the event
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
		 * The tagline of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get tagline():String {
			return _tagline;
		}
		
		public function set tagline( value:String ):void {
			_tagline = value;
		}
		
		/**
		 * The nid of the event
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
		 * The pic_small of the event
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
		 * The pic_big of the event
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
		 * The pic of the event
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
		 * The host of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get host():String {
			return _host;
		}
		
		public function set host( value:String ):void {
			_host = value;
		}
		
		/**
		 * The description of the event
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
		 * The event_type of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get event_type():String {
			return _event_type;
		}
		
		public function set event_type( value:String ):void {
			_event_type = value;
		}
		
		/**
		 * The event_subtype of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get event_subtype():String {
			return _event_subtype;
		}
		
		public function set event_subtype( value:String ):void {
			_event_subtype = value;
		}
		
		/**
		 * The start_time of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get start_time():Date {
			return _start_time;
		}
		
		public function set start_time( value:Date ):void {
			_start_time = value;
		}
		
		/**
		 * The end_time of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get end_time():Date {
			return _end_time;
		}
		
		public function set end_time( value:Date ):void {
			_end_time = value;
		}
		
		/**
		 * The creator of the event
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
		 * The update_time of the event
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
		 * The location of the event
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get location():Location {
			return _location;
		}
		
		public function set location( value:Location ):void {
			_location = value;
		}
		
		/**
		 * The venue of the event
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