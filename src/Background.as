package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;

	public class Background extends Sprite
	{
		[Embed(source="rain.jpg")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap
		
		public function Background() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			super();
			bgImage = new BackgroundImage();
			addChild(bgImage);
		}
	}
}