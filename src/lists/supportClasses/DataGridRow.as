package lists.supportClasses 
{

	import com.bumpslide.ui.Box;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	import com.bumpslide.ui.Button;
	import com.bumpslide.ui.Label;
	import com.bumpslide.util.ObjectPool;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	/**
	 * DataGridRow
	 *
	 * @author David Knape
	 */
	public class DataGridRow extends Button
	{
		public var grid:DataGrid;
		public var labels:Array;

		static public var labelPool:ObjectPool = new ObjectPool( Label );

		private var bmp:Bitmap;

		private var box:Box;
		
		
		override protected function addChildren():void
		{
			super.addChildren();
			mouseChildren = false;
			buttonMode = true;
			//addChild( bmp = new Bitmap() );
			box = new Box( 0xff0000, 64, 64, 0, 0, 0, 0, 0x999999);
			box.cacheAsBitmap = true;
			skin = box;
			invalidate(VALID_SKIN_STATE);
		}
		
		override protected function draw():void 
		{
			if(hasChanged(VALID_SIZE)) {
			//	bmp.bitmapData = new BitmapData( width, height, false, 0xcccccc );
				if(box) box.setSize( width, height );
			}
						
			if(hasChanged(VALID_SKIN_STATE)) {
				//trace(this,skinState);
				var color:uint;			
				switch(skinState) {
					case 'over': color = 0xffffff; break;
					case 'down': color = 0xeeffee; break;
					default:
						color = 0xeeeeee;
					break;
				}
				//bmp.bitmapData.fillRect(new Rectangle(0,1,width,height-1), color);
				box.backgroundColor = color;
				
			}
			
			if(hasChanged(VALID_DATA) || hasChanged(VALID_SIZE)) {
				renderData();
			}
			
			
			validate(VALID_SIZE);
			validate(VALID_DATA);
			validate(VALID_SKIN_STATE);
		}
		
		private function renderData():void {
			//trace('renderData',this);
			
			var lbl:Label;
			
			// recreate labels each time, but pull them from an 
			// object pool so that instances get reused
			
			if(labels) while(lbl = labels.shift()) {
				labelPool.releaseObject( lbl );
				destroyChild( lbl );
			}
			
			if(grid && gridItemData) {
				
				var col_num:Number = 0;
				var col_x:Number = 0;
				var col_width:Number;
			
				labels = [];
				
				for each (var col:String in grid.columns ) {				
					if(grid.columnSizes && grid.columnSizes[col_num]) {
						col_width = grid.columnSizes[col_num];
						// values of less than 1 are interpretted as percentages
						if(col_width<1) col_width = col_width*width; 
					} else {
						col_width = width/grid.columns.length;
					}
					var s:String = String(gridItemData[ col ]);
					if(s=='undefined' && col=='gridIndex') s = ""+gridIndex;
					lbl = labelPool.getObject( { text:s, width: col_width,  padding:5, x: col_x, y: 0, maxLines:1, cacheAsBitmap: true } );
					labels.push( addChild( lbl ) );
					col_num++;
					col_x+=col_width;
				}
			}
			
			
		}
		

		
		

		
	}
}
