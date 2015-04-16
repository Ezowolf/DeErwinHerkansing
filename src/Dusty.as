package
{
	import flash.display.MovieClip;
	
	public class Dusty extends MovieClip
	{
		public var resetAlpha:Boolean = false;
		public function Dusty()
		{
			this.graphics.beginFill(0x99CCCC);
			this.graphics.drawCircle(0, 8, 8);
			this.graphics.drawCircle(15, 0, 8);
			this.graphics.drawCircle(-15, 0, 8);
			this.graphics.endFill();
		}
		
		public function adjust():void
		{
			if(this.alpha>0)
			this.alpha -= 0.075;
			this.y += 2;
			if(resetAlpha==true)
			{
				this.alpha = 1;
				resetAlpha = false;
			}
		}
	}
}