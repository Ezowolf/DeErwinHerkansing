package
{
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip
	{
		public var myHeight:Number = 45;
		
		public function Enemy()
		{
			redraw();
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
		public function grow():void
		{
			myHeight += 10;
			this.x = Math.ceil(Math.random()*stage.stageWidth/2)+100;
			redraw();
		}
		public function redraw():void
		{
			this.graphics.clear();
			this.graphics.beginFill(Math.random() * 0xFFFFFF);
			this.graphics.drawRect(0, 0, myHeight, myHeight);
			this.graphics.endFill();
		}
		public function respawn():void
		{
			myHeight = 25;
			grow();
		}
	}
}