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

	import com.bumpslide.data.LoopedDataProvider;
	import com.bumpslide.events.DragEvent;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Label;
	import com.bumpslide.ui.behavior.DragBehavior;
	import com.bumpslide.util.LoremIpsum;

	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	/**
	 * Data Grid Test
	 * 
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape, http://bumpslide.com/
	 */
	public class G05_BarebonesDataGrid extends Application
	{

		private var grid:DataGrid;

		private var dragBehavior:DragBehavior;

		private var startingPosition:Number;

		private var enableDragging:Boolean = false;

		override protected function addChildren():void
		{				
			grid = new DataGrid( null, 30, [ 'gridIndex', 'name', 'description' ], [ .3, .3, .4 ] );
			grid.tweenEnabled = false;
			grid.dataProvider = new LoopedDataProvider( LoremIpsum.DATA, 5E9 );
			addChild( grid );
						
			if(enableDragging) {
				dragBehavior = DragBehavior.init( InteractiveObject( grid ), null, false, false );
				grid.hideScrollbar = true;
				addEventListener( DragEvent.EVENT_DRAG_START, handleDragStart );
				addEventListener( DragEvent.EVENT_DRAG_MOVE, handleDragMove );
			}
		}


		private function handleDragStart( event:DragEvent ):void
		{
			startingPosition = grid.layout.scrollPosition;
		}


		private function handleDragMove( event:DragEvent ):void
		{
			grid.layout.scrollPosition = startingPosition - event.delta.y / grid.layout.rowHeight;
			grid.scrollbar.updateNow();
		}


		override protected function draw():void
		{
			grid.move( 10, 10 );
			grid.setSize( width - 20, height - 20 );
		}
	}
}
