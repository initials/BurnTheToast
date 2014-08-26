package
{
	import org.flixel.*;
	import Math;

	public class PlayState extends FlxState
	{
		public var timeElapsed:Number = 0;
		public var timeToToast:int = (FlxG.random() * 6) + 2;
		[Embed(source = "toaster.png")] private var ImgToaster:Class;
		[Embed(source = "toast.png")] private var ImgToast:Class;
		public var toaster:FlxSprite;
		public var toast:FlxSprite;
		public var instr:FlxText;
		public var results:FlxText;
		public var score:FlxText;
		
		override public function create():void
		{
			//add(new FlxText(0, 0, 100, "Hello, World!")); //adds a 100x20 text field at position 0,0 (upper left)
			
			toaster = new FlxSprite(FlxG.width/2,FlxG.height/2);
			toaster.loadGraphic(ImgToaster, false, false, 30, 21);
			toaster.scale.x = 2;
			toaster.scale.y = 2;
			add(toaster);
			
			toast = new FlxSprite(FlxG.width/2,FlxG.height/2);
			toast.loadGraphic(ImgToast, false, false, 20, 20);
			toast.exists = false;
			toast.acceleration.y = 200;
			add(toast);
			
			instr = new FlxText(0,0,320,"Instructions");
			instr.size = 16;
			instr.antialiasing = true;
			instr.alignment = "center";
			add(instr);		
			
			results = new FlxText(0,24,320," ");
			results.size = 16;
			results.antialiasing = true;
			results.alignment = "center";
			add(results);			
			
			score = new FlxText(0,240-16,320,"Score: 0");
			score.size = 8;
			score.antialiasing = true;
			score.alignment = "left";
			add(score);
			
			instr.text = ("Please to toast for  " + timeToToast + "seconds");
		}
		
		override public function update():void {
			timeElapsed += FlxG.elapsed;
			if (FlxG.keys.justPressed("SPACE")) {
				var bonus:Number = FlxU.abs((1 / (timeElapsed - timeToToast))) * 100;
				toast.exists = true;
				toast.x = FlxG.width/2;
				toast.y = FlxG.height/2;
				toast.velocity.y = -200;
				if (FlxU.abs((timeElapsed - timeToToast)) < 1 ) {
					FlxG.log("SUPER BONUS!!!!!!!! with score of " + FlxU.abs((timeElapsed - timeToToast)) );
					FlxG.score += 500;
				}
				results.text = ("Time =" + (Math.round((timeElapsed*100)) / 100) + ". Bonus =" + int(bonus) );
				timeElapsed = 0;
				instr.text = ("Please to toast for  " + timeToToast + " seconds");
				FlxG.score += bonus;
			}
			
			score.text = ("Score :" + FlxG.score)
			
			super.update();
			
		}
		
		
	}
}