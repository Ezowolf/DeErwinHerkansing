package
{
	import flash.display.MovieClip;
	
	public class Pickup extends MovieClip
	{
		public var goRight:Boolean = true
		public var triangleHeight:uint = 20;
		public function Pickup()
		{
			redraw();	
		}
		
		public function redraw():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(1,0xff00ff00)
			this.graphics.beginFill(Math.random() * 0xFF0000);
			this.graphics.moveTo(0,triangleHeight);
			this.graphics.lineTo(-triangleHeight,-triangleHeight);
			this.graphics.lineTo(triangleHeight, 0);
			this.graphics.lineTo(triangleHeight, 0);
			/*this.graphics.moveTo(triangleHeight/2, 0);
			this.graphics.lineTo(triangleHeight, triangleHeight);
			this.graphics.lineTo(0, triangleHeight);
			this.graphics.lineTo(triangleHeight/2, 0);*/
		}
		public function adjust():void
		{
			this.rotation+=20;
			this.redraw();
			if (goRight == true)
			this.x += Math.random();
			else
			this.x -= Math.random();
			if(this.x-this.width/2 < 0)
			{
				this.x = this.width/2;
				goRight =! goRight;
			}
			else if(this.x + this.width / 2 > 800)
			{
				this.x = 800 - this.width / 2;
				goRight =! goRight;
			}
				
		}
		
	}
}