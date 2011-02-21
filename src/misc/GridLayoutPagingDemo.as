package misc
{

	import com.bumpslide.data.constant.AspectRatio;
	import com.bumpslide.data.LoopedDataProvider;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Button;
	import com.bumpslide.ui.FramerateMonitor;
	import com.bumpslide.ui.HBox;
	import com.bumpslide.ui.Slider;
	import com.bumpslide.ui.ThumbnailItem;
	import com.bumpslide.util.Align;
	import com.bumpslide.util.Delegate;
	import com.bumpslide.util.GridLayout;
	import com.bumpslide.util.LoremIpsum;

	import flash.display.Sprite;

	/**
	 * Demonstration of GridLayout class with paging controls
	 * 
	 * @mxmlc -sp=.. -l+=../libs -default-background-color #ffffff -default-frame-rate 31 -debug=true
	 * 
	 * @author David Knape
	 */
	public class GridLayoutPagingDemo extends Application
	{

		static public const PADDING:Number = 10;

		private var grid:GridLayout;

		private var buttons:HBox;
		
		private var _scale:Number = 2;

		private var scaleSlider:Slider;
		

		override protected function addChildren():void
		{
			// create grid holder
			var s:Sprite = new Sprite();
			s.x = s.y = PADDING;
			
			
			
			
			
			
			// create grid layout utility
			grid = new GridLayout( s, ThumbnailItem );
			grid.orientation = GridLayout.HORIZONTAL;
			grid.spacing = PADDING;			
			//grid.debugEnabled = true;
			grid.dataProvider = new LoopedDataProvider( LoremIpsum.IMAGES, 1000 );
			
			scaleSlider = new Slider();
			scaleSlider.setSize( 120, 20 );
			scaleSlider.setSliderParams(1, 4, scale);
			
			// create controls
			buttons = new HBox();
			buttons.children = [
				new Button( 0, 0, 0,   0, "|<<", eventDelegate( grid.pagePrevious ) ),
				new Button( 0, 0, 210, 0, ">>|", eventDelegate( grid.pageNext ) ),
				new Button( 60,  20, 70,  0, "<",   eventDelegate( scroll, -1 ) ),
				new Button( 60,  20, 140, 0, ">",   eventDelegate( scroll, 1 ) ),
				new Button( 120, 20, 300, 0, "Toggle Direction", eventDelegate( toggleGridDirection ) ),
				new Button( 120, 20, 440, 0, "Toggle Tweening",  eventDelegate( toggleTweening ) ),
				scaleSlider
			];
			
			scaleSlider.bind( 'value', this, 'scale');
			scale = 2;
			
			addChild( s );
			addChild( buttons );
			addChild( new FramerateMonitor() );
		}
		

		private function scroll( n:Number ):void
		{
			grid.scrollPosition += n;
		}


		private function toggleGridDirection():void
		{
			if(grid.orientation == GridLayout.HORIZONTAL) {
				grid.orientation = GridLayout.VERTICAL;
			} else {
				grid.orientation = GridLayout.HORIZONTAL;
			}
		}


		private function toggleTweening():void
		{
			grid.tweeningEnabled = !grid.tweeningEnabled;
		}


		override protected function draw():void
		{
			super.draw();

			var w:Number = width - 2 * PADDING;
			var h:Number = height - 3 * PADDING - 20;

			// round width and height to the nearest whole column and row
			w = Math.floor( w / grid.columnWidth ) * grid.columnWidth;
			h = Math.floor( h / grid.rowHeight ) * grid.rowHeight;

			// size the grid to match applet size
			grid.setSize( w, h );

			buttons.move( PADDING, height - PADDING - 20 );
		}


		public function get scale():Number {
			return _scale;
		}


		public function set scale( scale:Number ):void {
			_scale = scale;
			
			grid.columnWidth = scale * 48 * AspectRatio.HD;
			grid.rowHeight = scale * 48;
			updateNow();
		}
	}
}
