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
package zoom
{

	import com.bumpslide.data.type.Padding;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Button;
	import com.bumpslide.ui.FramerateMonitor;
	import com.bumpslide.ui.HBox;
	import com.bumpslide.ui.Image;
	import com.bumpslide.ui.VSlider;
	import com.bumpslide.ui.ZoomPanel;
	import com.bumpslide.ui.skin.defaults.Style;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;

	/**
	 * Zoom Demo 1 Applet
	 *  
	 * @mxmlc -sp=.. -l+=../../libs -default-background-color 0xffffff -default-frame-rate 60 --use-network=false -static-rsls
	 * @author David Knape
	 */
	public class ZoomDemo_01 extends Application {

		static private const CONTENT_URL:String = "map.jpg";
		static private const PAN_DISTANCE:Number = 256;		
		
		private var zoomPanel:ZoomPanel;
		private var controls:Sprite;
		
		/**
		 * Called during initialization
		 */
		override protected function addChildren():void {
			
			// create zoom panel with image as content
			zoomPanel = new ZoomPanel();
			zoomPanel.padding = new Padding(0,0,0,0);		
			zoomPanel.content = new Image( CONTENT_URL );
			zoomPanel.zoomContent.cacheAsBitmap = true;
			addChild( zoomPanel );
			
			// tween when dragging, and tweak the easing factor
			zoomPanel.dragZoomControl.tweenOnPan = true;
			zoomPanel.dragZoomControl.tweenEaseFactor = .2;			
			
			// create zoom slider
			var zoomSlider:VSlider = new VSlider();
			zoomSlider.setSliderParams( 4, .25, 1);
			zoomSlider.setSize( 32, 128 );
			zoomSlider.bind('value', zoomPanel, 'zoom');
			
			// create sprite to hold controls
			controls = new HBox();
			controls.x = controls.y = 16;
			controls.addChild( zoomSlider );
			
			// make the controls semi-transparent and adjust default button styles
			controls.alpha = .8;
			Style.LABEL_TEXT_FORMAT = new TextFormat( 'Arial', 14, 0x000000, true );
			Style.BUTTON_CORNER_RADIUS = 3;
			
			var btn:Button;
			
			// create buttons and add to the controls box
			controls.addChild( btn = new Button() );
			btn.label = "Home";
			btn.addEventListener( MouseEvent.CLICK, function(e:Event):void {
				zoomPanel.panTo(0,0);
				zoomPanel.zoom = 1;
			} );
			
			controls.addChild( btn = new Button() );
			btn.label = "←";
			btn.addEventListener( MouseEvent.CLICK, eventDelegate( zoomPanel.panLeft, PAN_DISTANCE ) );
			
			controls.addChild( btn = new Button() );
			btn.label = "→";
			btn.addEventListener( MouseEvent.CLICK, eventDelegate( zoomPanel.panRight, PAN_DISTANCE) );
			
			controls.addChild( btn = new Button() );
			btn.label = "↑";
			btn.addEventListener( MouseEvent.CLICK, eventDelegate( zoomPanel.panUp, PAN_DISTANCE) );
			
			controls.addChild( btn = new Button() );
			btn.label = "↓";
			btn.addEventListener( MouseEvent.CLICK, eventDelegate( zoomPanel.panDown, PAN_DISTANCE) );
			
			addChild( controls );		
			
			// add a framerate monitor
			addChild( new FramerateMonitor() );			
		}
		
		/**
		 * Applets are resized when stage size changes, so re-center content during redraw
		 */
		override protected function draw():void {
			zoomPanel.setSize( width, height );			
			
		}
	}
}
