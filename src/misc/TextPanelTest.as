package misc
{

	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.ScrollPanel;
	import com.bumpslide.ui.TextPanel;
	import com.bumpslide.util.LoremIpsum;

	/**
	 * TextPanelTest
	 *
	 * @author David Knape
	 */
	public class TextPanelTest extends Application
	{

		private var panel:ScrollPanel;


		override protected function addChildren():void
		{
			panel = add( TextPanel, { width:400, height:300, text:LoremIpsum.TEXT } );
		}


		override protected function draw():void
		{
			panel.setSize( width, height );
		}
	}
}
