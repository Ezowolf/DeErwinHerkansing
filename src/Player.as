package
{
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.net.URLRequest;

	public class Player extends MovieClip
	{
		public var grav:int = 0;
		public var moveRight:Boolean = false;
		public var floor: int = 450;
		public var speed: Number = 9;
		public var score: int = 0;
		public var MustRespawn:Boolean = false;
		public var TwoMustRespawn:Boolean = false;
		public var hasPowerUp:Boolean = false;
		
		public function Player()
		{
			redraw();
		}
		public function adjust():void
		{
			if(this.stage)
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
			grav+=2;
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
				if(TwoMustRespawn == false)
				{
					TwoMustRespawn = true;
				}
			}
			else if(this.x + this.width / 2 > 800)
			{
				this.x = 800 - this.width / 2;
				flip();
				if(MustRespawn == false)
				{
				MustRespawn = true;
				}
			}
			}
			
		}
		public function flip():void
		{
			var BumpSound: Sound = new Sound();
			BumpSound.load(new URLRequest("metal.mp3")); 
			BumpSound.play();
			moveRight = !moveRight;
			speed += 0.2;
			score++;
			hasPowerUp = false;
			redraw();
		}
		public function redraw():void
		{
			this.graphics.beginFill(Math.random() * 0xFFFFFF);
			this.graphics.drawCircle(0, 0, 18);
			this.graphics.endFill();
		}
	}
}