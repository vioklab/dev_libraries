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
	 * Album is a ValueObject for the Facebook API.
	 */
	public class Album {
		
		private var _aid:int;
		private var _cover_pid:int;
		private var _owner:int;
		private var _name:String;
		private var _created:Date;
		private var _modified:Date;
		private var _description:String;
		private var _location:String;
		private var _size:int;

		/**
		 * Construct a new Album instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Album() {
		}	
		
		/**
		 * The aid of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get aid():int {
			return _aid;
		}
		
		public function set aid( value:int ):void {
			_aid = value;
		}
		
		/**
		 * The cover_pid of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get cover_pid():int {
			return _cover_pid;
		}
		
		public function set cover_pid( value:int ):void {
			_cover_pid = value;
		}
		
		/**
		 * The owner of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get owner():int {
			return _owner;
		}
		
		public function set owner( value:int ):void {
			_owner = value;
		}
		
		/**
		 * The name of the event membership
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
		 * The created of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get created():Date {
			return _created;
		}
		
		public function set created( value:Date ):void {
			_created = value;
		}
		
		/**
		 * The modified of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get modified():Date {
			return _modified;
		}
		
		public function set modified( value:Date ):void {
			_modified = value;
		}
		
		/**
		 * The description of the event membership
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
		 * The location of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get location():String {
			return _location;
		}
		
		public function set location( value:String ):void {
			_location = value;
		}
		
		/**
		 * The size of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get size():int {
			return _size;
		}
		
		public function set size( value:int ):void {
			_size = value;
		}

	}
	
}