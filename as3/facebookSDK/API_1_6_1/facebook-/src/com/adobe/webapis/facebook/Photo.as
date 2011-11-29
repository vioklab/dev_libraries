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
	 * Photo is a ValueObject for the Facebook API.
	 */
	public class Photo {
		
		private var _pid:int;
		private var _aid:int;
		private var _owner:int;
		private var _src_small:String;
		private var _src_big:String;
		private var _src:String;
		private var _link:String;
		private var _caption:String;
		private var _created:Date;

		/**
		 * Construct a new Photo instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Photo() {
		}	
		
		/**
		 * The pid of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pid():int {
			return _pid;
		}
		
		public function set pid( value:int ):void {
			_pid = value;
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
		 * The src_small of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get src_small():String {
			return _src_small;
		}
		
		public function set src_small( value:String ):void {
			_src_small = value;
		}
		
		/**
		 * The src_big of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get src_big():String {
			return _src_big;
		}
		
		public function set src_big( value:String ):void {
			_src_big = value;
		}
		
		/**
		 * The src of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get src():String {
			return _src;
		}
		
		public function set src( value:String ):void {
			_src = value;
		}
		
		/**
		 * The link of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get link():String {
			return _link;
		}
		
		public function set link( value:String ):void {
			_link = value;
		}
		
		/**
		 * The caption of the event membership
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get caption():String {
			return _caption;
		}
		
		public function set caption( value:String ):void {
			_caption = value;
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

	}
	
}