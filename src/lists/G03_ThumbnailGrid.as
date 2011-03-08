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
	 * Thumbnail Grid
	 * 
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape, http://bumpslide.com/
	 */
	[SWF(backgroundColor="#dee7ef", frameRate="60", width="960", height="480")]
	public class G03_ThumbnailGrid extends Application
	{

		private var layout:GridLayout;

		private var list:Sprite;

		private var label:Label;

		override protected function addChildren():void
		{
			
			addChild( list = new Sprite() );
			
			layout = new GridLayout( list, ThumbnailItem);
			layout.spacing = 10;
			layout.orientation = Direction.HORIZONTAL;
			layout.dataProvider = new LoopedDataProvider(LoremIpsum.THUMBNAILS);
			
		
			addChild( label = new Label() );
			
			
			addEventListener( Event.ENTER_FRAME, animate );
			
			addChild( new FramerateMonitor() );
			
				
		}


		private function animate( event:Event ):void
		{
			layout.offset+=.0234;
			layout.updateNow();
			
			label.text = "rendering items "+layout.indexFirst + "-" + layout.indexLast + "  offset: "+layout.offset;
			
		}


		override protected function draw():void
		{
			layout.rowHeight = height * .2;
			layout.columnWidth = layout.rowHeight * AspectRatio.HD;
			layout.setSize( width, height * .6 + 20);
			list.y = height * .2;
			label.y = height * .8;
			
			
		}


	}
}
