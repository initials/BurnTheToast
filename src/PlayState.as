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
		public var timerText:FlxText;
		public var mode:String;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff1e1c1c;
			
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
			
			results = new FlxText(0,FlxG.height - 24,320,"Press [SPACE] to start.");
			results.size = 16;
			results.antialiasing = true;
			results.alignment = "center";
			add(results);			
			
			score = new FlxText(0,240-16,320,"Score: 0");
			score.size = 8;
			score.antialiasing = true;
			score.alignment = "left";
			add(score);
			
			instr.text = ("Please to toast for 5.00 seconds.");
			
			timerText = new FlxText(0,40,320,"0.00");
			timerText.size = 32;
			timerText.antialiasing = true;
			timerText.alignment = "center";
			add(timerText);
			
			
			mode = "result";
			
		}
		
		override public function update():void {
			
			score.text = ("Score :" + FlxG.score)
			
/*			timeElapsed += FlxG.elapsed;
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
			
			score.text = ("Score :" + FlxG.score)*/
			
			///results.text = ("Time =" + (Math.round((timeElapsed * 100)) / 100) + ". Bonus =" + int(bonus) );
			
			
			if (mode == "play") {
/*				if (FlxG.keys.Q)
				{
					timeElapsed += FlxG.elapsed/50;
				
				}
				else {
					timeElapsed += FlxG.elapsed;
				}*/
				
				timeElapsed += FlxG.elapsed;

				
					
					
				if (FlxG.keys.justPressed("SPACE")) {
					toast.exists = true;
					toast.x = FlxG.width/2;
					toast.y = FlxG.height / 2;
					
					toaster.x = FlxG.width/2;
					toaster.y = FlxG.height / 2;
					
					toaster.frame = 0;
					
					
				

					if (timeElapsed < 4.99)
					{
						instr.text = "Under done";
						toast.velocity.y = -150;
						toast.frame = 0;
					
					}
					else if (timeElapsed > 5.01)
					{
						instr.text = "We ask you please to not burn the toast";
						toast.velocity.y = -250;
						toast.frame = 2;
					}
					else
					{
						instr.text = "Perfect";
						FlxG.score += 2000;
						toast.velocity.y = -200;
						toast.frame = 1;
						timeElapsed = 5.00;
					}
					
					
				
					mode = "result";
				}
				
				timerText.text = (Math.round((timeElapsed * 100)) / 100) + "";
				if (timerText.text.length == 1)
				{
					timerText.text += ".00";
				}
				if (timerText.text.length == 3)
				{
					timerText.text += "0";
				}
				if (timeElapsed > 4.00)
				{
					toaster.x += (-2 + FlxG.random()*4);
					toaster.y += (-2 + FlxG.random()*4);
				}
					
			}
			else if (mode == "result")
			{
				
				if (FlxG.keys.justPressed("SPACE")) {
					toast.exists = false;
					instr.text = ("Please to toast for 5.00 seconds");
					timeElapsed = 0;
					mode = "play";
					toaster.frame = 1;
					results.text = "";
					
				}
			
			}
			super.update();
			
		}
		
		
	}
}