package images
{

	import flash.display.Bitmap;
	import com.bumpslide.ui.Image;
	import com.bumpslide.util.ImageUtil;
	import com.bumpslide.util.ObjectUtil;

	import flash.display.BitmapData;

	/**
	 * FilterableImage
	 * 
	 * fade on load is disabled so as not to fuck with our filter
	 *
	 * @author David Knape
	 */
	public class FilterableImage extends Image
	{

		private var _bitmapDataFilters:Array = [];
		protected var _filteredImage:Bitmap;
		
		public function FilterableImage(source:* = null, scale_mode:String = SCALE_NONE, w:Number = -1, h:Number = -1, loadCompleteHandler:Function = null) 
		{
			super( source, scale_mode, w, h, loadCompleteHandler );
		}
		
		
		override protected function draw() : void
		{
			fadeOnLoad = false;
			
			super.draw();

			if(loaded) applyBitmapDataFilters();
			
		}
		
		public function applyBitmapDataFilters():void {
			
			if(!_filteredImage) _filteredImage = add( Bitmap );
			
			this.image.visible = true;
			
			var bmp:BitmapData = ImageUtil.getSnapshot( this.image );			
			
			for each (var f:* in _bitmapDataFilters) {
				if(f is IBitmapDataFilter) {
					bmp = (f as IBitmapDataFilter).apply( bmp );
				}
			}
			
			_filteredImage.bitmapData = bmp;
			
			this.image.visible = false;
		}


		public function get bitmapDataFilters() : Array {
			return ObjectUtil.clone( _bitmapDataFilters ) as Array;
		}


		public function set bitmapDataFilters( val:Array ) : void {
			_bitmapDataFilters = ObjectUtil.clone(val) as Array;
		}
		
		
		
		

	}
}
