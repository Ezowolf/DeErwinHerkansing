package
{
	import flash.display.MovieClip;
	
	public class Explode extends MovieClip
	{
		public var resetAnimation:Boolean = false;
		public var mySize:int = 0;
		public function Explode()
		{
		}
		
		public function adjust():void
		{
			if(alpha>0)
			{
			this.alpha -= 0.02;
			this.graphics.clear();
			mySize++;
			this.graphics.beginFill(0xFF0000);
			this.graphics.drawCircle(0, 0, mySize);
			this.graphics.endFill();
			this.graphics.beginFill(0xFF9900);
			this.graphics.drawCircle(0, 0, mySize-10);
			this.graphics.endFill();
			}
			if(resetAnimation == true)
			{
				this.graphics.clear();
				mySize = 0;
				this.alpha = 1;
				resetAnimation = false;
			}
		}
	}
}