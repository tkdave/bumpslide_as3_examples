/**
 * This code is part of the Bumpslide Library by David Knape
 * http://bumpslide.com/
 * 
 * Copyright (c) 2006, 2007, 2008 by Bumpslide, Inc.
 * 
 * Released under the open-source MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * see LICENSE.txt for full license terms
 */ 
package lists
{

	import com.bumpslide.data.LoopedDataProvider;
	import com.bumpslide.data.constant.AspectRatio;
	import com.bumpslide.data.constant.Direction;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.FramerateMonitor;
	import com.bumpslide.ui.Label;
	import com.bumpslide.ui.ThumbnailItem;
	import com.bumpslide.util.GridLayout;
	import com.bumpslide.util.LoremIpsum;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;

	/**
	 * One long strip of images
	 *
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape, http://bumpslide.com/
	 */
	[SWF(backgroundColor="#dee7ef", frameRate="60", width="960", height="480")]
	public class G02_ImageStrip extends Application
	{

		private var layout:GridLayout;

		private var list:Sprite;

		private var label:Label;

		override protected function addChildren():void
		{
			
			addChild( list = new Sprite() );
			
			layout = new GridLayout( list, ThumbnailItem, 200, 100 );
			//layout.debugEnabled = true;
			layout.itemInitProperties = { buttonMode: true, cornerRadius: 6, cacheAsBitmap: true, borderPixelHinting: false };
			layout.spacing = 10;
			layout.orientation = Direction.HORIZONTAL;
			layout.dataProvider = new LoopedDataProvider(LoremIpsum.THUMBNAILS, 5.0E10);
			
		
			addChild( label = new Label() );
			
			
			addEventListener( Event.ENTER_FRAME, animate );
			
			addChild( new FramerateMonitor() );
			
				
		}


		private function animate( event:Event ):void
		{
			layout.offset += .015; //Math.sin( getTimer() / 1000 ) / 100 + .023;
			layout.updateNow();
			
			label.text =  "scrollRectOffset: " + layout.scrollRectOffset + " offset: "+layout.offset + " indexLast: " + layout.indexLast;
		}


		override protected function draw():void
		{
			layout.rowHeight = height * .5;
			layout.columnWidth = layout.rowHeight * AspectRatio.HD;
			layout.setSize( width, height * .5 );
			list.y = height * .25;
			
		}


	}
}
