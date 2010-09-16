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
package ftween
{

	import com.bumpslide.tween.FTween;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Box;
	import com.bumpslide.ui.FramerateMonitor;

	import flash.events.Event;

	/**
	 * FTween Springy Box Test
	 * 
	 * This applet draws a box on the screen that will follow the mouse.
	 * A small line on the left side of the screen is drawn to demonstrate
	 * FTween onUpdate callback functionality.
	 * 
	 * @author David Knape
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="640", height="480")]
	public class FTweenSpringyBox extends Application {

		private var background:Box;
		private var box:Box;
		private var line:Box;   

		override protected function addChildren():void {
            
            //trace("Hello");
            
            // we need a background to capture mouse move events on the whole stage
			background = new Box(0xeeeeee);
			box = new Box(0x333333, 32, 32);
			line = new Box(0x880000, 32, 1);
			            
			addChild(background);
			addChild(box);
			addChild(line);
			addChild( new FramerateMonitor() );

			addEventListener(Event.ENTER_FRAME, updateBox);
		}        
                                           
		/**
		 * Update the target box position to match the mouse position
		 */
		private function updateBox( e:Event ):void {
			FTween.smooth(box, 'x', mouseX - box.width / 2);
			FTween.smooth(box, 'y', mouseY-box.width/2, .2, .2, {onUpdate:onTweenUpdate} );  
		}

		private function onTweenUpdate(tw:FTween):void {
			//trace(tw.property + '=' +tw.current );
			line.y = tw.current;
		}
		
		/**
		 * on stage resize, update background to fill
		 */
		override protected function draw():void {
			background.width = width;
			background.height = height;
		}       
	}
}
