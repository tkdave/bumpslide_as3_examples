package
misc{

	import com.bumpslide.ui.Box;
	import com.bumpslide.ui.Label;
	import com.bumpslide.ui.skin.defaults.DefaultButtonSkin;
	import com.bumpslide.ui.skin.defaults.Style;

	/**
	 * MenuItem
	 *
	 * @author David Knape
	 */
	public class MenuItemSkin extends DefaultButtonSkin
	{
		
		override protected function addChildren():void 
		{
			background = add(Box);
			labelDisplay = add(Label);
		}
		
		
		
		override public function _off():void 
		{
			background.backgroundColor = Style.BUTTON_OFF;
			labelDisplay.textField.textColor = Style.BUTTON_LABEL;
			alpha = 1.0;
		}

		
		override public function _over():void 
		{
			background.backgroundColor = Style.BUTTON_OVER;
			labelDisplay.textField.textColor = Style.BUTTON_LABEL;
			alpha = 1.0;
		}

		
		override public function _down():void 
		{
			background.backgroundColor = Style.BUTTON_DOWN;	
			labelDisplay.textField.textColor = Style.BUTTON_LABEL;
			alpha = 1.0;
		}

		
		override public function _selected():void 
		{
			background.backgroundColor = Style.BUTTON_SELECTED;
			labelDisplay.textField.textColor = Style.BUTTON_LABEL_OVER;
			alpha = 1.0;
		}
		
		override public function _disabled():void 
		{
			background.backgroundColor = Style.BUTTON_SELECTED;
			labelDisplay.textField.textColor = Style.BUTTON_LABEL_OVER;
			alpha = 1.0;
		}
	}
}
