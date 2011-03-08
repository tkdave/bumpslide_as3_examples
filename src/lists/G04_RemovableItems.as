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

	import fl.data.DataProvider;

	import lists.supportClasses.RemovableItemRenderer;

	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.FramerateMonitor;
	import com.bumpslide.ui.IGridItem;
	import com.bumpslide.util.GridLayout;

	import flash.display.Sprite;
	import flash.events.Event;

	[SWF(backgroundColor="#e1e6ef", frameRate="60", width="960", height="480")]
	/**
	 * Test removing of items from a grid.
	 * 
	 * This demo presents a grid of items that can be removed.
	 * Clicking the X button dispatches an event which removes
	 * the corresponding item from the data provider. GridLayout
	 * responds to the data change event and updates accordingly.
	 *
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape, http://bumpslide.com/
	 */
	public class G04_RemovableItems extends Application
	{

		private var layout:GridLayout;

		private var itemHolder:Sprite;

		private var dataProvider:DataProvider;

		override protected function addChildren():void
		{
			// create item holder sprite
			itemHolder = add( Sprite, { x:10, y:10 } );

			// create dummy data
			var a:Array = new Array();
			for (var n:uint = 0; n < 50; n++) {
				a.push( { label:"Item " + n, data:n } );
			}
			dataProvider = new DataProvider( a );

			// create instance of GridLayout to manage our items
			layout = new GridLayout( itemHolder, RemovableItemRenderer, 128, 72 );
			layout.spacing = 5;
			layout.dataProvider = dataProvider;

			// listen for close event that we are bubbling up from our custom item renderer
			addEventListener( Event.CLOSE, handleCloseEvent );

			// monitor framerate and mem usage
			addChild( new FramerateMonitor() );
		}


		/**
		 * On close button clicked, remove the corresponding item from the data provider
		 */
		private function handleCloseEvent( event:Event ):void
		{
			var item:IGridItem = event.target as IGridItem;
			dataProvider.removeItemAt( item.gridIndex );
		}


		/**
		 * Fill the available space
		 */
		override protected function draw():void
		{
			layout.setSize( width - 20, height - 20 );
		}
	}
}
