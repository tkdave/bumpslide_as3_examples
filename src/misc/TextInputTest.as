package misc
{

	import com.bumpslide.ui.BaseClip;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Component;
	import com.bumpslide.ui.TextInput;
	import com.bumpslide.util.LoremIpsum;
	import com.demonsters.debugger.MonsterDebugger;

	/**
	 * TextPanelTest
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
			txt = add( TextInput, { x: 20, y: 20, width:400, height:32, hintText:LoremIpsum.TITLE } );
			
			// Start the MonsterDebugger
            MonsterDebugger.initialize(this);
			
			//BaseClip.LogFunction = MonsterDebugger.trace;
			
            
		}


		override protected function draw():void
		{
			txt.width = width - 40;
			
		}
	}
}
