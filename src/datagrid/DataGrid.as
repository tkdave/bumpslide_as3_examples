package datagrid 
{
	import com.bumpslide.ui.Grid;

	/**
	 * This is a barebones non-editable data grid built on top of the Grid component
	 *
	 * @author David Knape
	 */
	public class DataGrid extends Grid 
	{	
		private var _columns:Array;
		private var _columnSizes:Array;
		
		public function DataGrid( item_renderer:Class=null, row_height:Number=20, columns:Array=null, column_sizes:Array=null ) 
		{
			if(item_renderer==null) item_renderer=DataGridRow;
			super( item_renderer, 100, row_height);
			
			// We always want one data item per row
			// Thus, 1 gridlayout column
			fixedColumnCount = 1;
			
			// These are the properties we will assign to columns
			if(columns) this.columns = columns;
			
			// relative width of columns as percentage
			if(column_sizes) this.columnSizes = column_sizes;
		}
				
		override public function set dataProvider(dp:*):void {
			
			// Init columns based on data in data provider
			if(_columns==null && dp!=null) {
				var first_item:Object = getItemAt(0, dp);
				if(first_item!=null) {
					_columns = [];
					for( var prop:String in first_item ) {
						_columns.push( prop );
					}
				}
			}
			super.dataProvider = dp;
		}
		
		public function get columns():Array {
			return _columns;
		}
		
		
		public function set columns(columns:Array):void {
			_columns = columns;
			invalidate();
		}
		
		public function get columnSizes():Array {
			return _columnSizes;
		}
		
		
		public function set columnSizes(columnSizes:Array):void {
			_columnSizes = columnSizes;
			invalidate();
		}
	}
}
