package
{
	import flash.display.MovieClip;
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.Regular;
	
	public class Enemy extends MovieClip
	{
		public var myHeight:Number = 45;
		public var lethal:Boolean = true;
		private var myTween:Tween;
		
		public function Enemy()
		{
			redraw();
		}
		
		public function adjust():void
		{
			if(myHeight<45)
				this.y = 0;
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
			if (myHeight<45)
			{
				myHeight = 45;
			}
			
			myHeight += 5;
			redraw();
			var myTween:Tween = new Tween(this, "x", Regular.easeOut , this.x, (Math.random()*stage.stageWidth/4)+85, 0.25, true);
			myTween.addEventListener(TweenEvent.MOTION_FINISH, end);   //doesnt work
			function end(event:TweenEvent)
			{
				lethal = true;
			}
		}
		public function growtwo():void
		{
			if (myHeight<45)
			{
				myHeight = 45;
			}
			myHeight += 5;
			redraw();
			var myTween:Tween = new Tween(this, "x", Regular.easeOut , this.x, (Math.random()*stage.stageWidth/4)+400, 0.25, true);
			myTween.addEventListener(TweenEvent.MOTION_FINISH, end);   //doesnt work
			function end(event:TweenEvent)
			{
				lethal = true;
			}
		}
		
		
		
		public function die():void
		{
			lethal = false;
			this.x = -999;
			myHeight = 0;
			redraw();
		}
		public function redraw():void
		{
			this.y = 400;
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