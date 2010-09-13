/**
 * This code is part of the Bumpslide Library maintained by David Knape
 * Fork me at http://github.com/tkdave/bumpslide_as3
 * 
 * Copyright (c) 2010 by Bumpslide, Inc. 
 * http://www.bumpslide.com/
 *
 * This code is released under the open-source MIT license.
 * See LICENSE.txt for full license terms.
 * More info at http://www.opensource.org/licenses/mit-license.php
 */

package buttons
{

	import com.bumpslide.ui.Button;
	import com.bumpslide.ui.Component;
	import com.bumpslide.ui.Container;

	import flash.events.MouseEvent;

	/**
	 * ButtonDemo1
	 * 
	 * @author David Knape
	 */
	public class ButtonDemo1 extends Component
	{
		private var buttons:Array = [];

		private var buttonHolder:Container;
		
		override protected function addChildren() : void
		{
			buttons.push( new Button( 300, 20, 0, 0, "Fixed Width", handleClick ) );
			buttons.push( create( Button, { label: "Auto-sized When No Width is Specified"} ) );
			
			buttonHolder = add( Container, { layout: 'vertical', children: buttons } );			
		}
		
		
		private function handleClick( event:MouseEvent ):void {
			trace('hello');		
		}
		
		
		
		
	}
}
