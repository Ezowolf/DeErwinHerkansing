package
{
	import flash.display.MovieClip;
	public class Player extends MovieClip
	{
		public var grav:int = 0;
		public var moveRight:Boolean = true;
		public var floor: int = 450;
		public var speed: Number = 5;
		public var score: int = 0;
		public var heMustRespawn:Boolean = false;
		
		public function Player()
		{
			this.graphics.beginFill(0x99FF00);
			this.graphics.drawCircle(this.x, this.y, 18);
			this.graphics.endFill();
		}
		public function adjust():void
		{
			if(moveRight == true)
			{
				this.x += speed;
			}
			if(moveRight == false)
			{
				this.x -= speed;
			}
			this.y+=grav;
			if(this.y+this.height/2<floor)
			{
			grav++;
			}
			else
			{
				grav = 0;
				this.y = floor-this.height/2;
			}
			if(this.x-this.width/2 < 0)
			{
				this.x = this.width/2;
				flip();
			}
			else if(this.x + this.width / 2 > 800)
			{
				this.x = 800 - this.width / 2;
				flip();
				if(heMustRespawn == false)
				{
				heMustRespawn = true;
				}
			}
			
			
		}
		public function flip():void
		{
			moveRight = !moveRight;
			speed += 0.2;
			score++;
		}
	}
}