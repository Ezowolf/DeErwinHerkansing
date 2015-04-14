package
{
	import flash.display.MovieClip;
	
	public class Pickup extends MovieClip
	{
		public function Pickup()
		{
			redraw();	
		}
		
		public function redraw():void
		{
			this.graphics.clear();
			this.graphics.beginFill(Math.random() * 0xFFFFFF);
			this.graphics.drawEllipse(0,0,30,45);
			this.graphics.endFill();
		}
		public function adjust():void
		{
			if(this.x-this.width/2 < 0)
			{
				this.x = this.width/2;
			}
			else if(this.x + this.width / 2 > 800)
			{
				this.x = 800 - this.width / 2;
			}
		}
	}
}