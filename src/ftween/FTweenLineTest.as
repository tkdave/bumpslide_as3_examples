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

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	

	/**
	 * FTween Line Test
	 * 
	 * This app draws a line across the screen and tweens the y position to match the mouse loc.  
	 * This is a nice way to test various easing methods.
	 * 
	 * @author David Knape
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="900", height="480")]
	public class FTweenLineTest extends Application {

		private var background:Box;
		private var display:Sprite;
		
		public var tval:Number=0;
		private var tick:Number = 0;
		
		//private var previous:Point = new Point();

		override protected function addChildren():void {
            
			background = new Box(0x333333);
			display = new Sprite();
			addChild( background );
			addChild( display );
			
			addChild( new FramerateMonitor() );

			addEventListener(Event.ENTER_FRAME, drawTval);			
			addEventListener( MouseEvent.MOUSE_MOVE, updateTval);
		}

		
		private function updateTval( event:Event ) : void
		{
			FTween.easeInOut( this, 'tval', mouseY);
		}
		
		
		private function drawTval( e:Event ):void {
			if(++tick>width) {
				tick=0;
				display.graphics.clear();
				//previous.x = 0;
				display.graphics.moveTo( 0, tval);
			}
			
			var pt:Point = new Point( tick, tval );
			
			display.graphics.lineStyle( 3, 0x00ff00 );
			//display.graphics.moveTo( previous.x, previous.y );			
			display.graphics.lineTo( pt.x, pt.y );
			
			//previous = pt;  
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
