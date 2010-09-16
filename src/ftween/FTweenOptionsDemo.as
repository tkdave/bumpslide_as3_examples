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
	import com.bumpslide.tween.FTweenOptions;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.FramerateMonitor;

	import flash.display.Shape;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * FTween Options Demo
	 * 
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape
	 */
	[SWF(backgroundColor="0xffffff",frameRate="31")]
	public class FTweenOptionsDemo extends Application {

		 
		static private const NUM_BOXES:int=500;
		static private const TWEEN_DELAY:int = 10;
		
		private var loopTimer:Timer;
		private var boxes:Array = new Array();
		
		override protected function addChildren():void {
            
            var shp:Shape;
            
            // create boxes
            for(var n:int=0; n<NUM_BOXES; ++n) {
            	shp = new Shape();
            	shp.graphics.beginFill( 0, .2 + Math.random() * .8 );
            	shp.graphics.drawRect( 0, 0, 4, 4 );
            	shp.graphics.endFill();
            	shp.cacheAsBitmap;
            	addChild( shp );
            	boxes.push( shp );
            }
                
			addChild( new FramerateMonitor() );
			
		}   
		
		     
		override protected function postConstruct() : void
		{
			super.postConstruct();
			
			loopTimer = new Timer( NUM_BOXES*TWEEN_DELAY, 0);
            loopTimer.addEventListener(TimerEvent.TIMER, loop);
			loopTimer.start();
			
			loop();	
			
		}
                                           
		/**
		 * Update the target box position to match the mouse position
		 */
		private function loop( e:TimerEvent=null ):void {
			
			var n:int = NUM_BOXES;
			
			var options:FTweenOptions = new FTweenOptions();
			
			// minDelta - how close we need to be to the target to declare us finished tweening
			// default is .01, increasing to .1 lets us exit the tween faster and is enough for x/y coords
			options.minDelta = .1;
			
			// updateDelay - how many milliseconds between updates
			// default is 30, increasing to 50 gives us a bit more performance 
			// at the expense of smoothness
			options.updateDelay = 30;			
			
			while( n-- ) {				
				// milliseconds delay
				options.delay = TWEEN_DELAY*n;
				
				FTween.ease(boxes[n], 'x', Math.random()*width, .15, options );
				FTween.ease(boxes[n], 'y', Math.random()*height, .3, options );
			}
		}

	}
}