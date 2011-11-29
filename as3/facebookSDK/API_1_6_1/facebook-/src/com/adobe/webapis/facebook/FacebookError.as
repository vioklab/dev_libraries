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
	 * These are the common errors that can happen during
	 * a call to a facebook method.
	 *
	 * http://developers.facebook.com/documentation.php?v=1.0&doc=errors
	 */
	public class FacebookError {
		
		/** An unknown error occurred. Please resubmit the request. */
		public static const UNKNOWN_ERROR:int = 1;

		/** The service is not available at this time. */
		public static const SERVICE_CURRENTLY_UNAVAILABLE:int = 2;

		/** The application has reached the maximum number of requests allowed. More requests are allowed once the time window has completed. */
		public static const SERVICE_NOT_AVAILABLE:int = 4;

		/** The request came from a remote address not allowed by this application. */
		public static const ADDRESS_NOT_ALLOWED:int = 5;

		/** One of the parameters specified was missing or invalid. */
		public static const MISSING_OR_INVALID_PARAMETER:int = 100;

		/** The api key submitted is not associated with any known application. */
		public static const INVALID_API_KEY:int = 101;

		/** The session key was improperly submitted or has reached its timeout. Direct the user to log in again to obtain another key. */
		public static const SESSION_INVALID_OR_TIMEOUT:int = 102;

		/** The submitted call_id was not greater than the previous call_id for this session. */
		public static const INVALID_CALL_ID:int = 103;

		/** The passed signature was invalid. */
		public static const INVALID_SIGNATURE:int = 104;
		
		/** The requested response format was not found. */
		public static const FORMAT_NOT_FOUND:int = 111;
		
		/** The requested method was not found. */
		public static const METHOD_NOT_FOUND:int = 112;
	
		/** The SOAP envelope send in the request could not be parsed. */
		public static const INVALID_SOAP_ENVELOPE:int = 114;
		
		/** The XML-RPC request document could not be parsed */
		public static const INVALID_XML_RPC_CALL:int = 115;
		
		/** Invalid album id. */
		public static const INVALID_ALBUM_ID:int = 120;

		/** Album is full. */
		public static const ALBUM_IS_FULL:int = 321;

		/** Missing or invalid image file. */
		public static const MISSING_OR_INVALID_IMAGE_FILE:int = 324;

		/** Too many unapproved photos pending. */
		public static const TO_MANY_UNAPPROVED_PENDING:int = 325;

		/** Error while parsing FQL statement. */
		public static const ERROR_PARSING_FQL:int = 601;

		/** The field you requested does not exist. */
		public static const INVALID_FIELD:int = 602;

		/** The table you requested does not exist. */
		public static const INVALID_TABLE:int = 603;

		/** Your statement is not indexable. */
		public static const STATEMENT_IS_NOT_INDEXABLE:int = 604;

		/** The function you called does not exist. */
		public static const INVALID_FUNCTION:int = 605;

		/** Wrong number of arguments passed into the function. */
		public static const WRONG_NUMBER_OF_ARGUMENTS:int = 606;
		
		private var _errorCode:int;
		private var _errorMessage:String;
		
		/**
		 * Constructs a new FacebookError instance
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function FacebookError() {
			// do nothing	
		}
		
		/**
		 * The error code returned from Facebook
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get errorCode():int {
			return _errorCode;	
		}
		
		public function set errorCode( value:int ):void {
			_errorCode = value;	
		}
		
		/**
		 * The error message returned from Facebook
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get errorMessage():String {
			return _errorMessage;	
		}
		
		public function set errorMessage( value:String ):void {
			_errorMessage = value;	
		}
		
	}	
	
}
    