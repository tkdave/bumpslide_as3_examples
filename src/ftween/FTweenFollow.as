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
	 * Copy of Springy Box that uses the new EaseInOut
	 * 
	 * It's like a following dog.
	 *  
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="640", height="480")]
	public class FTweenFollow extends Application {

		private var background:Box;
		private var box:Box;
		//private var line:Box;   

		override protected function addChildren():void {
            
            //trace("Hello");
            
            // we need a background to capture mouse move events on the whole stage
			background = new Box(0x333333);
			box = new Box(0xccddee, 12, 12, 0, 0, 6);
			
			//line = new Box(0x880000, 32, 1);
			            
			addChild(background);
			addChild(box);
			//addChild(line);
			addChild( new FramerateMonitor() );

			addEventListener(Event.ENTER_FRAME, updateBox);
		}        
                                           
		/**
		 * Update the target box position to match the mouse position
		 */
		private function updateBox( e:Event ):void {
			FTween.easeInOut(box, 'x', mouseX - box.width / 2, .1, .1);
			FTween.easeInOut(box, 'y', mouseY-box.width/2, .1, .1, {onUpdate:onTweenUpdate} );  
		}

		private function onTweenUpdate(tw:FTween):void {
			//trace(tw.property + '=' +tw.current );
			//line.y = tw.current;
			//tw.current 
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
