package lists.supportClasses
{

	import com.bumpslide.tween.FTween;
	import com.bumpslide.ui.Box;
	import com.bumpslide.ui.Button;
	import com.bumpslide.ui.GridItem;
	import com.bumpslide.ui.skin.defaults.Style;
	import com.bumpslide.util.LoremIpsum;

	import flash.display.BlendMode;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * RemovableItemRenderer
	 *
	 * @author David Knape, http://bumpslide.com/
	 */
	public class RemovableItemRenderer extends GridItem
	{

		private var closeButton:Button;

		private var labelButton:Button;

		private var overlay:Box;


		override protected function addChildren():void
		{
			Style.BUTTON_CORNER_RADIUS = 3;
			Style.BUTTON_LABEL = 0x000000;

			labelButton = add( Button, { enabled:false } );
			overlay = add( Box, { cornerRadius:Style.BUTTON_CORNER_RADIUS, blendMode:BlendMode.MULTIPLY } );
			closeButton = add( Button, { label:'x', padding:'2 5', alignH:'right -5', y:5, onClick:handleCloseClick } );

			cacheAsBitmap = true;
		}


		private function handleCloseClick( event:MouseEvent ):void
		{
			dispatchEvent( new Event( Event.CLOSE, true ) );
		}


		override protected function draw():void
		{
			super.draw();
			labelButton.setSize( width, height );
			overlay.setSize( width, height );
		}


		override protected function drawGridItem():void
		{
			labelButton.label = gridIndex + ". " + gridItemData.label;
			overlay.backgroundColor = LoremIpsum.COLORS[ gridItemData.data % LoremIpsum.COLORS.length ];
			overlay.visible = true;
		}


		override protected function clearGridItem():void
		{
			labelButton.label = "";
			overlay.visible = false;
		}


		/**
		 * Override X and Y setters to tween into position
		 * 
		 * This lets us see clearly when items are being reused
		 */
		override public function set x( x:Number ):void {
			// super.x = x;
			FTween.ease( this, 'tweenX', x, .2, { delay:gridIndex * 10 } );
		}


		override public function set y( y:Number ):void {
			// super.y = y;
			FTween.spring( this, 'tweenY', y, .3, .45, { delay:gridIndex * 12 } );
		}


		public function get tweenX():Number {
			return super.x;
		}


		public function set tweenX( val:Number ):void {
			super.x = val;
		}


		public function get tweenY():Number {
			return super.y;
		}


		public function set tweenY( val:Number ):void {
			super.y = val;
		}
	}
}
