package slider
{

	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Image;
	import com.bumpslide.ui.Label;
	import com.bumpslide.ui.ScrollPanel;
	import com.bumpslide.ui.Slider;


	/**
	 * SliderTest
	 *
	 * @author David Knape
	 */
	public class SliderTest extends Application
	{
		public function SliderTest()
		{
			
			var label:Label = add( Label, { x: 220, y: 20 } );			
			var image:Image = new Image('http://placekitten.com/200/598');
			
			add( Slider, { width: 200, height: 40, x: 10, y: 10 } ).bind('value', label, 'text');			
			add( ScrollPanel, { width: 200, height: 300, x: 10, y: 60, content: image } );	
		}

	}
}
