package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;

	[SWF(width=800,height=450, framerate=60, backgroundColor="0xFFFFFF"]
	public class DeErwinHerkansing extends Sprite
	{
		private var spaceDown:Boolean = false;
		private var char:Player = new Player();
		private var obstacle:Enemy = new Enemy();
		private var myFormat:TextFormat = new TextFormat();
		private var back:Background = new Background();
		private var coin:Pickup = new Pickup();
		public var txt:TextField;
		public var tutxt:TextField;
		
		public function DeErwinHerkansing():void
		{
			addChild(back);
			var mySound:Sound = new Sound();
			mySound.load(new URLRequest("miep.mp3"));
			mySound.play(0, 99999);
			obstacle.x = Math.ceil(Math.random()*stage.stageWidth/2)+100;
			obstacle.y = stage.stageHeight - obstacle.height;
			myFormat.size = 30;
			txt = new TextField();
			tutxt = new TextField();
			addChild(txt);
			addChild(tutxt);
			txt.defaultTextFormat = myFormat;
			tutxt.defaultTextFormat = myFormat;
			txt.width = 400;
			tutxt.width = 300;
			txt.text = "1 BUTTON GAME";
			tutxt.text = "Press Space to start";
			txt.x = stage.width/2;
			txt.y = stage.height/2;
			tutxt.x = txt.x;
			tutxt.y = txt.y +30;
			addChild(obstacle);
			addChild(coin);
			char.x = 790;
			char.y = 400;
			coin.x = Math.random()*stage.stageWidth;
			coin.y = 350;
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
				char.grav = -18;
			}
			char.adjust();
			obstacle.adjust();
			coin.adjust();
			if(char.MustRespawn == true)
			{
				obstacle.grow();
				
				char.MustRespawn = false;
			}
			if(char.hitTestObject(obstacle)&&char.stage)
			{
				var DieSound: Sound = new Sound();
				DieSound.load(new URLRequest("over.mp3")); 
				DieSound.play();
				txt.text = "GAME OVER. SCORE: "+char.score.toString();
				tutxt.x = txt.x;
				tutxt.y = (txt.y +20);
				tutxt.text = "Press space to retry";
				txt.x = stage.width/2;
				txt.y = stage.height/2;
				removeChild(char);
				
			}
			if(char.hitTestObject(coin)&&char.stage)
			{
				coin.redraw();
				char.score++;
				coin.x = Math.random()*stage.stageWidth - coin.width;
				var CoinSound: Sound = new Sound();
				CoinSound.load(new URLRequest("coin.mp3")); 
				CoinSound.play();
			}
		}
		public function keysDown(e:KeyboardEvent):void
		{
			if(e.keyCode == 32)
			{
				if(char.stage)
				spaceDown = true;
				else
				{
					char.score = 0;
					addChild(char);
					char.x = 790;
					char.y = 400;
					char.speed = 9;
					txt.text = "Score: "+char.score.toString();
					txt.x = 0;
					txt.y = 0;
					char.moveRight = false;
					obstacle.respawn();
					tutxt.text = "";
				}
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