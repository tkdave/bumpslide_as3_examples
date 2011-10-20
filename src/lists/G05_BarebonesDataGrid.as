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

	import lists.supportClasses.DataGrid;

	import net.hires.debug.Stats;

	import com.bumpslide.data.LoopedDataProvider;
	import com.bumpslide.events.UIEvent;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Grid;
	import com.bumpslide.ui.behavior.DragScrollBehavior;
	import com.bumpslide.util.Align;
	import com.bumpslide.util.LoremIpsum;

	import flash.display.InteractiveObject;

	/**
	 * Data Grid Test
	 * 
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape, http://bumpslide.com/
	 */
	[SWF(backgroundColor="#2a3347", frameRate="60", width="480", height="960")]
	public class G05_BarebonesDataGrid extends Application
	{

		private var grid:DataGrid;

		private var dragBehavior:DragScrollBehavior;

		private var enableDragging:Boolean = true;

		private var stats:Stats;

		override protected function addChildren():void
		{				
			grid = new DataGrid( null, 30, [ 'gridIndex', 'name', 'description' ], [ .3, .3, .4 ] );
			grid.addEventListener( Grid.EVENT_ITEM_CLICK, onItemSelect, true );
			grid.tweenEnabled = true;
			grid.dataProvider = new LoopedDataProvider( LoremIpsum.DATA, 5E9 );
			grid.layout.renderInBatches = true;
			grid.layout.renderBatchPageCount = 3;
			
			addChild( grid );
			
			addChild(stats = new Stats() );
			callLater( 500, initDragging );
		}


		private function onItemSelect( event:UIEvent ):void
		{
			trace( "Selected", event.data.id );
		}


		private function initDragging():void
		{
			if (enableDragging) {
				dragBehavior = DragScrollBehavior.init( InteractiveObject( grid ), grid.layout );
				grid.hideScrollbar = true;
			}
		}


		override protected function draw():void
		{
			grid.move( 10, 10 );
			grid.setSize( width - 20, height - 20 );
			
			Align.right( stats, width );
		}
	}
}
