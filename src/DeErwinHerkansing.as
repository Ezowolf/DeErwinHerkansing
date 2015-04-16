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
		private var obstacletwo:Enemy = new Enemy();
		private var particle:Dusty = new Dusty();
		private var exploder:Explode = new Explode();
		public var txt:TextField;
		public var tutxt:TextField;
		public var htxt:TextField;
		public var highscore:int = 0;
		
		public function DeErwinHerkansing():void
		{
			addChild(back);
			var mySound:Sound = new Sound();
			mySound.load(new URLRequest("miep.mp3"));
			mySound.play(0, 99999);
			obstacle.x = -200;
			obstacle.y = -400;
			myFormat.size = 30;
			txt = new TextField();
			tutxt = new TextField();
			htxt = new TextField();
			addChild(txt);
			addChild(tutxt);
			addChild(htxt);
			txt.defaultTextFormat = myFormat;
			tutxt.defaultTextFormat = myFormat;
			htxt.defaultTextFormat = myFormat;
			txt.width = 400;
			tutxt.width = 300;
			htxt.width = 400;
			htxt.text = "";
			txt.text = "1 BUTTON GAME";
			tutxt.text = "Press Space to start";
			txt.x = stage.width/2;
			txt.y = stage.height/2;
			tutxt.x = txt.x;
			tutxt.y = txt.y +30;
			addChild(obstacle);
			addChild(obstacletwo);
			obstacletwo.x = -999;
			obstacletwo.y = -999;
			addChild(coin);
			char.x = 790;
			char.y = 400;
			coin.x = Math.random()*stage.stageWidth;
			coin.y = 350;
			addChild(particle);
			addChild(exploder);
			
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
				particle.x = char.x;
				particle.y = char.y;
				particle.resetAlpha = true;
				
			}
			char.adjust();
			obstacle.adjust();
			coin.adjust();
			particle.adjust();
			exploder.adjust();
			if(char.MustRespawn == true)
			{
				obstacle.grow();
				char.MustRespawn = false;
			}
			if(char.TwoMustRespawn == true)
			{
				if(!obstacletwo.stage && char.score > 19)
				{
					addChild(obstacletwo)
					obstacletwo.myHeight = 45; 
					obstacletwo.redraw();
					obstacletwo.x = Math.ceil(Math.random()*stage.stageWidth/4)+425;;
					obstacletwo.y = 400;
					obstacletwo.redraw()
				}
				if(obstacletwo.stage)
				obstacletwo.growtwo();
				char.TwoMustRespawn = false;
			}
			if(char.hitTestObject(obstacle)&&char.stage&&obstacle.lethal ==true)
			{
				if(char.hasPowerUp == false)
				hitenemy();
				if(char.hasPowerUp == true)
				{
				obstacle.die();
				char.score++;
				var KillSound: Sound = new Sound();
				KillSound.load(new URLRequest("bump.mp3")); 
				KillSound.play();
				}
			}
			if(char.hitTestObject(obstacletwo)&&char.stage&&obstacletwo.lethal ==true)
			{
				if(char.hasPowerUp == false)
				hitenemy();
				else
				{
				obstacletwo.die();
				char.score++;
				var KillSoundtwo: Sound = new Sound();
				KillSoundtwo.load(new URLRequest("bump.mp3")); 
				KillSoundtwo.play();
				}
				
			}
			if(char.hitTestObject(coin)&&char.stage)
			{
				char.hasPowerUp=true;
				coin.redraw();
				char.score++;
				coin.x = Math.random()*stage.stageWidth - coin.width;
				var CoinSound: Sound = new Sound();
				CoinSound.load(new URLRequest("coin.mp3")); 
				CoinSound.play();
			}
			if(char.hasPowerUp == true)
			{
				obstacle.redraw();
				if(obstacletwo.stage)
					obstacletwo.redraw();
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
					obstacle.x = 200;
					obstacle.y = 400;
					tutxt.text = "";
					char.score = 0;
					addChild(char);
					char.x = 790;
					char.y = 400;
					char.speed = 9;
					txt.text = "Score: "+char.score.toString();
					txt.x = 0;
					txt.y = 0;
					htxt.x = 0;
					htxt.y = 30;
					htxt.text = "Record: "+highscore.toString();
					obstacle.die();
					char.moveRight = false;
					obstacle.respawn();
					
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
		public function hitenemy():void
		{
			if(char.score>highscore)
			{
				var CoinSound: Sound = new Sound();
				CoinSound.load(new URLRequest("win.mp3")); 
				CoinSound.play();
				highscore = char.score;
				htxt.text = "NEW RECORD!";
			}
			else{
				var DieSound: Sound = new Sound();
				DieSound.load(new URLRequest("over.mp3")); 
				DieSound.play();
			}
			obstacle.x = -200;
			obstacle.y = -400;
			exploder.x = char.x;
			exploder.y = char.y;
			exploder.resetAnimation = true;
			char.hasPowerUp = false;
			tutxt.x = txt.x;
			tutxt.y = 0;
			tutxt.text = "Press space to retry";
			txt.x = 300;
			txt.y = 300;
			txt.text = "GAME OVER. SCORE: "+char.score.toString();
			removeChild(char);
			if(obstacletwo.stage)
			{
				obstacletwo.x = 0;
				obstacletwo.y = 0;
				obstacletwo.x = -999;
				obstacletwo.y = -999;
				
			}
			
		}
		

		}
	}
