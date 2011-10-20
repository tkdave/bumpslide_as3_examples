package misc
{

	import com.bumpslide.tween.FTween;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Box;
	import com.bumpslide.ui.Label;
	import com.bumpslide.util.Align;
	import com.bumpslide.util.LoremIpsum;

	import flash.display.Sprite;


	/**
	 * TweenAlignTest
	 *
	 * @author David Knape
	 */
	public class TweenAlignTest extends Application
	{

		private var box1:Box;
		private var box2:Sprite;
		private var box3:Box;		
		
		override protected function addChildren():void
		{	
			
			
			addChild( box1 = new Box( LoremIpsum.COLORS[2], 225, 100 ) );
			addChild( box2 = new Sprite() );
			box2.addChild( new Box( LoremIpsum.COLORS[1], 150, 150, -20, -20 ) );
			addChild( box3 = new Box( LoremIpsum.COLORS[0], 100, 225 ) );
			
			box1.alpha = box2.alpha = box3.alpha = .8;
			
			box1.addChild( new Label("Box 1") );
			box2.addChild( new Label("Sprite") );
			box3.addChild( new Label("Box 2") );
			
			Align.hbox( [ box1, box2, box3 ], 1, function ( obj:*, pos:Number ):void {
				FTween.ease( obj, 'x', pos, .15);
			} );		
			
			Align.vbox( [ box1, box2, box3 ], -60, function ( obj:*, pos:Number ):void {
				FTween.spring( obj, 'y', pos, .2, .25, { delay: 1500 } );
			} );		
			
		}
		


	}
}
