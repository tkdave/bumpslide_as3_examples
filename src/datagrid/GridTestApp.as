package datagrid
{

	import com.bumpslide.ui.Application;
	import com.bumpslide.util.LoremIpsum;

	/**
	 * Data Grid Test
	 * 
	 * @mxmlc -l+=../../libs -sp+=../ -static-rsls
	 * @author David Knape
	 */
	public class GridTestApp extends Application
	{

		private var grid:DataGrid;

		override protected function addChildren():void
		{
			grid = new DataGrid( null, 30, [ 'id', 'name', 'description' ], [ .1, .3, .6 ] );
			grid.tweenEnabled = false;
			grid.dataProvider = LoremIpsum.DATA;
			addChild( grid );
		}

		override protected function draw():void
		{
			grid.setSize( width, height );
		}
	}
}
