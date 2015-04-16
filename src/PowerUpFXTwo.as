package
{
	import flash.display.MovieClip;
	
	public class PowerUpFXTwo extends MovieClip
	{
		public var resetAlpha:Boolean = false;
		public var triangleHeight:uint = 10;
		public var xMover:uint = Math.random() * 5 + 5 ;
		public var yMover:uint = Math.random() * 5 + 5;
		public var reverser:Boolean = true;
		public function PowerUpFXTwo()
		{
			this.graphics.clear();
			this.graphics.lineStyle(1,0xff00ff00)
			this.graphics.beginFill(Math.random() * 0xFF0000);
			this.graphics.moveTo(0,triangleHeight);
			this.graphics.lineTo(-triangleHeight,-triangleHeight);
			this.graphics.lineTo(triangleHeight, 0);
			this.graphics.lineTo(triangleHeight, 0);
		}
		
		public function adjust():void
		{
			this.rotation+=xMover + yMover;
			if(this.alpha>0)
			{
				this.alpha -= 0.1;
			}
			else
			{
				reverser =! reverser;
				xMover = Math.random() * 5 + 5 ;
				yMover = Math.random() * 5 + 5;
				resetAlpha = true;
			}
			if(reverser == true)
			{
				this.y -= yMover;
				this.x -= xMover;
			}
			else
			{
				this.y -= yMover;
				this.x += xMover;
			}
			if(resetAlpha==true)
			{
				this.alpha = 1;
				//resetAlpha = false;
			}
		}
	}
}