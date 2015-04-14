package
{
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip
	{
		public var myHeight:Number = 30;
		
		public function Enemy()
		{
			this.graphics.beginFill(0xFF0000);
			this.graphics.drawRect(this.x, this.y, myHeight, myHeight);
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
		public function respawn():void
		{
			//this.graphics.clear();
			this.x = Math.ceil(Math.random()*stage.stageWidth/2)+150;
			this.graphics.beginFill(0xFF0000);
			this.graphics.drawRect(this.x, this.y, myHeight, myHeight);
			this.graphics.endFill();
		}
	}
}