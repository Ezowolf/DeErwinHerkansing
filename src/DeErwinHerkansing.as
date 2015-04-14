package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;

	[SWF(width=800,height=450, framerate=60, backgroundColor="0x00CCFF"]
	public class DeErwinHerkansing extends Sprite
	{
		private var spaceDown:Boolean = false;
		private var char:Player = new Player();
		private var obstacle:Enemy = new Enemy();
		private var myFormat:TextFormat = new TextFormat();
		public var txt:TextField;
		
		public function DeErwinHerkansing():void
		{
			var mySound:Sound = new Sound();
			mySound.load(new URLRequest("miep.mp3"));
			mySound.play(0, 9999);
			obstacle.x = Math.ceil(Math.random()*stage.stageWidth/2)+150;
			obstacle.y = stage.stageHeight - obstacle.height;
			myFormat.size = 33;
			txt = new TextField();
			addChild(txt);
			txt.defaultTextFormat = myFormat;
			txt.text = "Score: "+char.score.toString();
			txt.width = 250;
			addChild(obstacle);
			char.x = 790;
			char.y = 400;
			addChild(char);
			stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keysUp);
		}
		public function checkStuff(e:Event):void
		{
			if(char.stage)
			txt.text = "Score: "+char.score.toString();
			if (spaceDown && char.y+char.width/2 == char.floor)
			{
				var JumpSound: Sound = new Sound();
				JumpSound.load(new URLRequest("jump.mp3")); 
				JumpSound.play();
				char.grav = -12;
			}
			char.adjust();
			obstacle.adjust();
			if(char.MustRespawn == true)
			{
				obstacle.respawn();
				obstacle.myHeight += 7;
				char.MustRespawn = false;
			}
			if(char.hitTestObject(obstacle)&&char.stage)
			{
				var DieSound: Sound = new Sound();
				DieSound.load(new URLRequest("over.mp3")); 
				DieSound.play();
				txt.text = "GAME OVER";
				txt.x = stage.width/2;
				txt.y = stage.height/2;
				removeChild(char);
				
			}
		}
		public function keysDown(e:KeyboardEvent):void
		{
			if(e.keyCode == 32)
			{
				spaceDown = true;
			}
		}
		public function keysUp(e:KeyboardEvent):void
		{
			if(e.keyCode == 32)
			{
				spaceDown = false;
			}
		}
	}
}