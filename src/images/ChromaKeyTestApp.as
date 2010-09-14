package images
{

	import com.bumpslide.ui.FramerateMonitor;
	import com.bumpslide.data.type.RGB;
	import com.bumpslide.ui.Application;
	import com.bumpslide.ui.Container;
	import com.bumpslide.ui.Image;
	import com.bumpslide.ui.Label;
	import com.bumpslide.ui.Slider;
	import com.bumpslide.util.StringUtil;

	import flash.display.BitmapData;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;

	/**
	 * Testing Background Removal with Mario Klingemann's Chroma Key PixelBender Kernel
	 *
	 * @author David Knape
	 */
	[SWF(backgroundColor="#339966", frameRate="31", width="900", height="600")]
	public class ChromaKeyTestApp extends Application
	{
		
		[Embed(source='assets/product_image.jpg')]
		private var product_image:Class;
		
		[Embed(source='assets/product_image2.jpg')]
		private var product_image2:Class;
		[Embed(source='assets/product_image3.jpg')]
		private var product_image3:Class;
		[Embed(source='assets/product_image4.jpg')]
		private var product_image4:Class;
 
		[Embed("assets/chroma_key.pbj", mimeType="application/octet-stream")]
		private var ChromaKeyFilter:Class;

		private var img:Image;
		private var img2:Image;
		
		private var slider1:Slider;
		private var slider2:Slider;
		private var slider3:Slider;
		
		private var label1:Label;
		private var label2:Label;
		private var label3:Label;

		private var img3:Image;

		private var img4:Image;

		private var img5:Image;

		private var img6:Image;

		private var img7:Image;

		private var img8:Image;
		
		override protected function addChildren() : void
		{	
			add( FramerateMonitor );
			
			img = new Image( product_image, Image.SCALE_RESIZE, 200, 200 );
			img.move( 20, 100 );
			addChild( img );
			
			img2 = new Image( product_image, Image.SCALE_RESIZE, 200, 200);
			img2.move( 240, 100 );
			addChild( img2 );
			
			img3 = new Image( product_image2, Image.SCALE_RESIZE, 200, 200 );
			img3.move( 20, 340 );
			addChild( img3);
			
			img4 = new Image( product_image2, Image.SCALE_RESIZE, 200, 200);
			img4.move( 240, 340 );
			addChild( img4 );
			
			img5 = new Image( product_image3, Image.SCALE_RESIZE, 200, 200 );
			img5.move( 460, 100 );
			addChild( img5 );
			
			img6 = new Image( product_image3, Image.SCALE_RESIZE, 200, 200);
			img6.move( 680, 100 );
			addChild( img6 );
			
			img7 = new Image( product_image4, Image.SCALE_RESIZE, 200, 200 );
			img7.move( 460, 340 );
			addChild( img7);
			
			img8 = new Image( product_image4, Image.SCALE_RESIZE, 200, 200);
			img8.move( 680, 340 );
			addChild( img8 );
			
			var header:Container = add( Container, { layout:'horizontal', x:20, y:20} );
			
			header.add( Label, {text: "Background Removal Demo" , width:300, textFormat: new TextFormat( 'Arial', 16, 0xffffff, true) } );
			
			slider1 = header.add( Slider, { minValue: 0, maxValue: .5, value: .025, width:100, height:20 } );
			label1 = slider1.add( Label, { y:22, text: 'Tolerance'} );
			slider1.bind( 'value', this, eventDelegate(invalidate, 'shader') );
			
			slider2 = header.add( Slider, {  minValue: 0, maxValue: .25, value: .08, width:100, height:20 } ); 
			label2 = slider2.add( Label, { y:22, text: 'Ramp'} );
			slider2.bind( 'value', this, eventDelegate(invalidate, 'shader') );
			
			slider3 = header.add( Slider, {  minValue: 0, maxValue: 10.0, value: .8, width:100, height:20 } );
			label3 = slider3.add( Label, { y:22, text: 'Gamma'} );
			slider3.bind( 'value', this, eventDelegate(invalidate, 'shader') );
			
			
			
		}
		
		
		override protected function commitProperties() : void
		{
			super.commitProperties();
			
			if(hasChanged('shader') &&  img.loaded) {
				
				trace('shading');
				
				//Pass the loaded filter to the Shader as a ByteArray
				label1.text ="Tolerance: " + StringUtil.formatNumber( slider1.value, 3);
				label2.text ="Ramp: " + StringUtil.formatNumber(slider2.value, 3);
				label3.text ="Gamma: " + StringUtil.formatNumber( slider3.value, 3);
				
				
				var rgb:RGB = getBackgroundColor( img );
				var shader1:Shader = new Shader(new ChromaKeyFilter() as ByteArray);
				
				shader1.data.keyColor.value=[rgb.red/255, rgb.green/255, rgb.blue/255];
				shader1.data.tolerance.value = [slider1.value]; // 0 - 3.0
				shader1.data.ramp.value = [slider2.value]; // 0 - 1.0;
				shader1.data.gamma.value = [slider3.value]; // 0 - 10.0
				
				img2.filters = [ new ShaderFilter(shader1) ];
				
				
				var rgb2:RGB = getBackgroundColor( img3 );
				var shader2:Shader = new Shader(new ChromaKeyFilter() as ByteArray);

				shader2.data.keyColor.value=[rgb2.red/255, rgb2.green/255, rgb2.blue/255];
				shader2.data.tolerance.value = [slider1.value]; // 0 - 3.0
				shader2.data.ramp.value = [slider2.value]; // 0 - 1.0;
				shader2.data.gamma.value = [slider3.value]; // 0 - 10.0
				
				img4.filters = [ new ShaderFilter(shader2) ];
				
				var rgb3:RGB = getBackgroundColor( img5 );
				var shader3:Shader = new Shader(new ChromaKeyFilter() as ByteArray);

				shader3.data.keyColor.value=[rgb3.red/255, rgb3.green/255, rgb3.blue/255];
				shader3.data.tolerance.value = [slider1.value]; // 0 - 3.0
				shader3.data.ramp.value = [slider2.value]; // 0 - 1.0;
				shader3.data.gamma.value = [slider3.value]; // 0 - 10.0
				
				img6.filters = [ new ShaderFilter(shader3) ];
				
				var rgb4:RGB = getBackgroundColor( img7 );
				var shader4:Shader = new Shader(new ChromaKeyFilter() as ByteArray);

				shader4.data.keyColor.value=[rgb4.red/255, rgb4.green/255, rgb4.blue/255];
				shader4.data.tolerance.value = [slider1.value]; // 0 - 3.0
				shader4.data.ramp.value = [slider2.value]; // 0 - 1.0;
				shader4.data.gamma.value = [slider3.value]; // 0 - 10.0
				
				img8.filters = [ new ShaderFilter(shader4) ];
					
				validate('shader');
			}
		}
		
		protected function getBackgroundColor( img:Image ):RGB {
			// sample color at corners
			var bmp:BitmapData = img.bitmap.bitmapData;
			var sample_inset:int = 2;
			var rgb:RGB = RGB.createFromNumber( bmp.getPixel(sample_inset, sample_inset) );
			var rgb2:RGB = RGB.createFromNumber( bmp.getPixel( sample_inset, bmp.height-sample_inset) );
			var rgb3:RGB = RGB.createFromNumber( bmp.getPixel( bmp.width-sample_inset, sample_inset) );
			var rgb4:RGB = RGB.createFromNumber( bmp.getPixel( bmp.width-sample_inset, bmp.height-sample_inset) );
			
			// average them together
			var r:Number = (rgb.red + rgb2.red + rgb3.red + rgb4.red) / 4 ;
			var g:Number = (rgb.green + rgb2.green + rgb3.green + rgb4.green) / 4 ;
			var b:Number = (rgb.blue + rgb2.blue + rgb3.blue + rgb4.blue) / 4 ;
			
			return new RGB( r, g, b );
		}

		
	}
}
