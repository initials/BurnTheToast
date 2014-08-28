package
{
	import org.flixel.*;
	import Math;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.external.ExternalInterface;
	import flash.net.URLVariables;
	import flash.net.URLLoaderDataFormat;
	import flash.net.navigateToURL;

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
		
		public var combo:int;
		
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
			
			timerText = new FlxText(FlxG.width/2 -30,40,320,"0.00");
			timerText.size = 32;
			timerText.antialiasing = true;
			timerText.alignment = "left";
			add(timerText);
			
			
			mode = "result";
			
			combo = 0;
			
			
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
				
				CONFIG::debug
				//if (FlxG.debug)
				{
					// your code here
					
					if (FlxG.keys.Q)
					{
						timeElapsed += FlxG.elapsed/50;
					
					}
					else {
						timeElapsed += FlxG.elapsed;
					}
				
				
				}
				CONFIG::release
				{
					timeElapsed += FlxG.elapsed;
					
				}
				
/*				else {
					timeElapsed += FlxG.elapsed;
				}*/
				
					
					
				if (FlxG.keys.justPressed("SPACE")) {
					toast.exists = true;
					toast.x = FlxG.width/2;
					toast.y = FlxG.height / 2;
					
					toaster.x = FlxG.width/2;
					toaster.y = FlxG.height / 2;
					
					toaster.frame = 0;
					
					
				

					if (timeElapsed < 4.99)
					{
						instr.text = "Under done. \n\n\n\n\n\n\n\nPress [ENTER] to Tweet your score.";
						toast.velocity.y = -150;
						toast.frame = 0;
						
						FlxG.score -= (150);
						
						combo=0;
					
					}
					else if (timeElapsed > 5.01)
					{
						instr.text = "We ask you please to not burn the toast. \n\n\n\n\n\n\n\nPress [ENTER] to Tweet your score.";
						toast.velocity.y = -250;
						toast.frame = 2;
						
						FlxG.score -= (150);
						
						combo=0;
					}
					else
					{
						combo++;
						
						instr.text = "Perfect, " + combo + " in a row. \n\n\n\n\n\n\n\nPress [ENTER] to Tweet your score.";
						
						FlxG.score += (2000*combo);
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
					instr.text = ("Please to toast for 5.00 seconds.");
					timeElapsed = 0;
					mode = "play";
					toaster.frame = 1;
					results.text = "";
					
				}
				
				
				if (FlxG.keys.justPressed("ENTER")) {
					clickTweet();
					
				}
			
			}
			super.update();
			
		}
		

		function clickTweet():void
		{

			//The path to the share page
			var path:URLRequest = new URLRequest("http://twitter.com/share");

			//using the GET method means you will use a QueryString to send the variables
			//twitter likes this. This is used as an alternate method if we don’t use
			//a javascript popup
			path.method = URLRequestMethod.GET;

			//The URLVariables class is a nice way to keep everything organised. There is the added bonus
			//that we can use these values if we GET instead of using the Javascript popup.
			var tweetVars = new URLVariables();
			tweetVars.url = "http://www.initialsgames.com/burn/";
			tweetVars.text = "Please to not burn the toast. Score " + FlxG.score + " with a combo of " + combo + " via @initials_games ";
			//tweetVars.via = "initials_games";
			//tweetVars.related = " ";

			//Set the URLRequest to include the URLVariables
			path.data = tweetVars;

			//If Flash is okay with us using ExternalInterface
			if (ExternalInterface.available){
			//I would imagine that If ExternalInterface wasn’t available that would be caught
			//with the try/catch statement – oh well.
			try
			{
				//We’re going to pass this as a string to javascript, so we have to
				//"stringify" it instead of using the URLVariable + URLRequest approach
				//I’m putting a dummy placeholder in the first position of the
				//QueryString so that I can shuffle my variables around without
				//worrying about who gets a ‘?’ instead of a ‘&’. It’s faster than
				//writing a quick if statement, but commenting about it takes far more time ; )
				path.url +="?d=0";
				for (var each in tweetVars){
				path.url += "&"+each+"="+tweetVars[each];
				}

				//Make a call to the openTweetWin Javascript function
				//and pass it the ‘stringified’ version of the QueryString
				ExternalInterface.call("openTweetWin", path.url);
			} 
			catch (error:SecurityError)
			{
				//If it doesn’t work just open a damn window.
				navigateToURL(path, "_blank");
				instr.text = "SecurityError";
			} 
			catch (error:Error)
			{
			//If it doesn’t work just open a damn window.
			navigateToURL(path, "_blank");
			instr.text = "Error";
			}
			} 
			else {
			//If it doesn’t work just open a damn window.
			navigateToURL(path, "_blank");
			instr.text = "Failed";
			}
		}
	}
}