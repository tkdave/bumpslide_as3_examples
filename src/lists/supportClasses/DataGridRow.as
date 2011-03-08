package lists.supportClasses 
{
	import com.bumpslide.util.ObjectPool;
	import com.bumpslide.ui.GridItem;
	import com.bumpslide.ui.Label;

	/**
	 * DataGridRow
	 *
	 * @author David Knape
	 */
	public class DataGridRow extends GridItem 
	{
		public var grid:DataGrid;
		public var labels:Array;
		static public var labelPool:ObjectPool = new ObjectPool( Label );		
		
		override protected function draw():void 
		{
			// recreate labels each time, but pull them from an 
			// object pool so that instances get reused
			var lbl:Label;
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
					lbl = labelPool.getObject( { text:s, width: col_width,  padding:5, x: col_x, y: 0, maxLines:1 } );
					labels.push( addChild( lbl ) );
					col_num++;
					col_x+=col_width;
				}
			}
			
			graphics.clear();
			graphics.lineStyle( 0, 0x999999, 1.0, false);
			graphics.moveTo( 0, height );
			graphics.lineTo( width, height );
			
		}
		
		

		
	}
}
