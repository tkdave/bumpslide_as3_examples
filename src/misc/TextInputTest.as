package misc
{

	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.TextInput;


	/**
	 * Text Input Resize Test
	 *
	 * @author David Knape
	 */
	public class TextInputTest extends Application
	{

		private var txt:TextInput;

		override protected function initStage():void
		{
			super.initStage();
			stageProxy.updateDelay = 0;
		}


		override protected function addChildren():void
		{
			txt = add( TextInput, { x: 20, y: 20, width: 400, height: 32, hintText: "Enter your name" } );
		}


		override protected function draw():void
		{
			txt.width = width - 40;
		}
	}
}
