package
{
	import org.flixel.*;
	import flash.events.Event;
    import flash.ui.Mouse;

	public dynamic class MenuState extends FlxState
	{
		private var _gibs:FlxEmitter;
		private var _b:FlxButton;
		private var _t1:FlxText;
		private var _t2:FlxText;
		private var _t22:FlxText;
		private var _t3:FlxText;
		private var _ok:Boolean;
		private var _ok2:Boolean;
		
		override public function create():void
		{
			
			FlxG.bgColor = 0xff333333;
			
			_t1 = new FlxText(FlxG.width, 20, 320, "Please To Not \nBurn The Toast");
			_t1.size = 16;
			_t1.color = 0xFFAEAE;
			_t1.antialiasing = true;
			add(_t1);
/*			_t2 = new FlxText(-500,40,320,"When Your Car Is A BMX");
			_t2.size = _t1.size;
			_t2.color = _t1.color;
			_t2.antialiasing = _t1.antialiasing;
			add(_t2);*/
			
			_ok = false;
			_ok2 = false;
			
			FlxG.mouse.show();
			
			//Simple use of flixel save game object
			var save:FlxSave = new FlxSave();
			if(save.bind("Mode"))
			{
				if(save.data.plays == null)
					save.data.plays = 0;
				else
					save.data.plays++;
				FlxG.log("Number of plays: "+save.data.plays);
			}
		}

		override public function update():void
		{			
			var t1m:uint = FlxG.width/2-120;
			if(_t1.x > t1m)
			{
				_t1.x -= FlxG.elapsed*FlxG.width;
				if(_t1.x < t1m) _t1.x = t1m;
			}
/*			var t2m:uint = FlxG.width/2-120;
			if(_t2.x < t2m)
			{
				_t2.x += FlxG.elapsed*FlxG.width;
				if(_t2.x > t2m) _t2.x = t2m;
			}*/
			
			//Check to see if the text is in position
			if(!_ok && ((_t1.x == t1m) ))
			{
				//explosion
				_ok = true;
				//FlxG.play(SndHit);
				//FlxG.flash.start(0xffd8eba2,0.5);
				//FlxG.quake.start(0.035,0.5);
				_t1.color = 0xFF0000;
				//_t2.color = 0xFF0000;
				//_gibs.start(true,5);
				//_t1.angle = FlxU.random()*40-20;
				//_t2.angle = FlxU.random()*40-20;
				
				var t1:FlxText;
				var t11:FlxText;
				var t2:FlxText;
				var b:FlxButton;
				
				
			
				//flixel button
/*				this.add((new FlxSprite(t1m+150,FlxG.height-20)).createGraphic(106,19,0xffFF0000));
				b = new FlxButton(t1m+151,FlxG.height-20,onFlixel);
				b.loadGraphic((new FlxSprite()).createGraphic(104,15,0xffFF8A8A),(new FlxSprite()).createGraphic(104,15,0xffDDDDDD));
				t1 = new FlxText(15,1,100,"Initials Website");
				t1.color = 0x000000;
				t2 = new FlxText(t1.x,t1.y,t1.width,t1.text);
				t2.color = 0x000111;
				b.loadText(t1,t2);
				add(b);
				t1 = new FlxText(t1m-60,FlxG.height/3+139,210,"PRESS SPACE TO PLAY.");
				t1.color = 0xFF0000;
				t1.alignment = "center";
				add(t1);*/
				
				_t22 = new FlxText(120,200,320,"A Game By: Initials");
				_t22.size = 8;
				//_t2.color = _t1.color;
				_t22.antialiasing = true;
				//_t22.alignment = "center";
				add(_t22);
				
			}
			
			//Begin
			if(_ok && !_ok2 && FlxG.keys.SPACE)
			{
				_ok2 = true;
				//FlxG.play(SndHit2);
/*				FlxG.flash.start(0xFF0000,0.5);
				FlxG.fade.start(0xff131c1b,1,onFade);*/
			}

			super.update();
		}
		
		private function onFlixel():void
		{
			FlxU.openURL("http://initialsgames.com");
		}
		
		private function onDanny():void
		{
			FlxU.openURL("http://dbsoundworks.com");
		}
		
		private function onButton():void
		{
			_b.visible = false;
			_b.active = false;
			//FlxG.play(SndHit2);
		}
		
		private function onFade():void
		{
			//FlxG.state = new PlayState();
			FlxG.switchState(new PlayState());
			
			//FlxG.state = new PlayStateTiles();
		}
	}
}
