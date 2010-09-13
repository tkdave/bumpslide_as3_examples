package images
{

	import flash.display.BitmapData;

	/**
	 * ChromaKeyFilter
	 *
	 * @author David Knape
	 */
	public class ChromaKeyFilter implements IBitmapDataFilter
	{
		
		private var _target:uint;
		private var _tolerance:uint;
		
		public function ChromaKeyFilter( target:uint=0xffffff, tolerance:uint=100)
		{
			
		}

		
		public function apply( bitmapData:BitmapData ) : BitmapData
		{
			
			// sample from 4 corners, find outlier, and average other 3 to get target
			
			// to find tolerance, get histogram of image  
				
			
			
			
			// TODO: Auto-generated method stub
			return null;
		}


		public function get target() : uint {
			return _target;
		}


		public function set target( target:uint ) : void {
			_target = target;
		}


		public function get tolerance() : uint {
			return _tolerance;
		}


		public function set tolerance( tolerance:uint ) : void {
			_tolerance = tolerance;
		}
	}
}
