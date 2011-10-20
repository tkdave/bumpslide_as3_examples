package misc
{

	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Label;

	import flash.display.Sprite;
	import flash.geom.Rectangle;

	/**
	 * FindMaxScrollRectX
	 *
	 * @author David Knape, http://bumpslide.com/
	 */
	public class FindMaxScrollRectX extends Application
	{

		override protected function addChildren():void
		{
			
			trace( int.MAX_VALUE / 20 );
			
			var sprite:Sprite = new Sprite();
			sprite.x = Number.POSITIVE_INFINITY;
			sprite.x-=1;
			
			trace( sprite.x );
			
			
			sprite.scrollRect = new Rectangle( int.MAX_VALUE/20, 0, 100, 100);
			
			
			trace( sprite.scrollRect.x );
						
			
			return;
			
		}

	}
}
