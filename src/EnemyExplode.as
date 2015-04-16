package
{
	import flash.display.MovieClip;
	
	public class EnemyExplode extends MovieClip
	{
		public var resetAnimation:Boolean = false;
		public var mySize:int = 5;
		public function EnemyExplode()
		{
		}
		
		public function adjust():void
		{
			if(alpha>0)
			{
				this.alpha -= 0.025;
				this.graphics.clear();
				mySize++;
				this.graphics.beginFill(Math.random() * 0xFFFFFF);
				this.graphics.drawCircle(0, 0, mySize);
				this.graphics.endFill();
				this.graphics.beginFill(Math.random() * 0xFFFFFF);
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