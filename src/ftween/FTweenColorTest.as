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

	import com.bumpslide.events.UIEvent;
	import com.bumpslide.tween.FTween;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Box;
	import com.bumpslide.ui.Label;
	import com.bumpslide.util.GridLayout;

	import flash.display.Sprite;

	/**
	 * FTween Color Easing Test
	 * 
	 * This is also a nice barebones GridLayout Example
	 * 
	 * @author David Knape
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 */
	[SWF(backgroundColor="0xffffff",frameRate="31")]
	public class FTweenColorTest extends Application
	{

		private var colors:Array = [ 0x880000, 0xcc4400, 0xeebb00, 0x008800, 0x113388, 0x331188, 0x774422, 0x333333 ];

		private var background:Box;

		private var buttons:Sprite;

		// create background and grid of color buttons
		override protected function addChildren() : void
		{
			background = new Box( 0x333333 );
			background.name = 'background';
			addChild( background );

			buttons = new Sprite();
			buttons.x = 10;
			buttons.y = 30;
			addChild( buttons );

			add( Label, { text:"Click a box to change background color", x:10, y:10, color:0xffffff } );

			// use grid layout to place buttons and pass in color values
			var grid:GridLayout = new GridLayout( buttons, ColorButton, 64, 20 );
			grid.dataProvider = colors;

			// listen for grid item clicks
			addEventListener( GridLayout.EVENT_ITEM_CLICK, onColorClick );
		}


		// resize background on redraw
		override protected function draw() : void
		{
			background.width = width;
			background.height = height;
		}


		private function onColorClick( event:UIEvent ):void
		{
			FTween.easeColor( background, 'backgroundColor', event.data as Number, .05 );
		}
	}
}

import com.bumpslide.ui.Box;
import com.bumpslide.ui.GridItem;

import flash.filters.DropShadowFilter;

class ColorButton extends GridItem
{

	private var border:Box;

	private var colorBox:Box;

	override protected function addChildren() : void
	{
		// create border and color box
		border = new Box( 0x000000, 60, 20 );
		colorBox = new Box( 0xaaaaaa, 58, 18 );
		colorBox.x = colorBox.y = 1;
		addChild( border );
		addChild( colorBox );

		// add drop shadow
		filters = [ new DropShadowFilter( 1, 45, 0, 1, 3, 3, .5, 3 ) ];
	}


	override protected function draw() : void
	{
		colorBox.backgroundColor = gridItemData as Number;
	}
}
