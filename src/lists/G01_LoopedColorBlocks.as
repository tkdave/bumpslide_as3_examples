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
	import com.bumpslide.ui.Box;
	import com.bumpslide.ui.FramerateMonitor;
	import com.bumpslide.ui.Label;
	import com.bumpslide.util.Delegate;
	import com.bumpslide.util.GridLayout;
	import com.bumpslide.util.LoremIpsum;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * Just color blocks in a scrolling grid
	 *
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape, http://bumpslide.com/
	 */
	[SWF(backgroundColor="#dddddd", frameRate="60", width="960", height="480")]
	public class G01_LoopedColorBlocks extends Application
	{

		private var layout:GridLayout;

		private var list:Sprite;

		private var label:Label;

		override protected function addChildren():void
		{
			
			addChild( list = new Sprite() );
			
			layout = new GridLayout( list, Box, 300, 200 );
			//layout.debugEnabled = true;
			layout.itemInitProperties = { cornerRadius: 6, cacheAsBitmap: true, borderPixelHinting: false };
			layout.spacing = 10;
			layout.orientation = Direction.HORIZONTAL;
			layout.dataProvider = new LoopedDataProvider(LoremIpsum.COLORS);
			
		
			addChild( label = new Label() );
			
						
			addEventListener( Event.ENTER_FRAME, animate );
			
			addChild( new FramerateMonitor() );
			
				
		}


		private function animate( event:Event ):void
		{
			layout.offset+=.0345;
			layout.updateNow();
			
			label.text = "offset: "+layout.offset;
		}


		override protected function draw():void
		{
			layout.rowHeight = height * .2;
			layout.columnWidth = layout.rowHeight * AspectRatio.HD;
			layout.setSize( width, height * .6 + 4 );
			list.y = height*.2;
			label.x = 20;
			label.y = height * .8;			
			label.width = width;
			
		}


	}
}
