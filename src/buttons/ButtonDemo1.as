/**
 * This code is part of the Bumpslide Library maintained by David Knape
 * Fork me at http://github.com/tkdave/bumpslide_as3
 * 
 * Copyright (c) 2010 by Bumpslide, Inc. 
 * http://www.bumpslide.com/
 *
 * This code is released under the open-source MIT license.
 * See LICENSE.txt for full license terms.
 * More info at http://www.opensource.org/licenses/mit-license.php
 */
package buttons
{

	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Button;
	import com.bumpslide.ui.VBox;

	/**
	 * A demo of basic AS3 buttons using the default programmatic skin
	 * 
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * 
	 * @author David Knape
	 */
	public class ButtonDemo1 extends Application
	{

		[Embed(source="/assets/feed.png")]
		private var FeedIcon:Class;

		override protected function addChildren():void
		{
			var b1:Button = new Button();
			b1.label = "Auto-sized to Fit";

			var b2:Button = new Button();
			b2.label = "Explicit Width";
			b2.width = 200;
			
			var b3:Button = new Button();
			b3.label = "Set Size";
			b3.setSize( 100, 100 );
			
			var b4:Button = new Button();
			b4.label = "Toggle";
			b4.toggle = true;
			
			// fixed size with icon
			var b5:Button = new Button();
			b5.icon = FeedIcon;
			b5.setSize( 40, 40 );
			
			var vbox:VBox = new VBox( [ b1, b2, b3, b4, b5 ] );
			vbox.spacing = 20;
			vbox.x = vbox.y = 20;
			addChild( vbox );
		}
	}
}
