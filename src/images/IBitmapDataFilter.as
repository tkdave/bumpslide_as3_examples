package images
{

	import flash.display.BitmapData;
	/**
	 * IBitmapDataFilter
	 *
	 * @author David Knape
	 */
	public interface IBitmapDataFilter
	{
		
		function apply( bitmapData:BitmapData ) : BitmapData;
	}
}
