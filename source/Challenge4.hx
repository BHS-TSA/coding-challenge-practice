package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;

using StringTools;

/**
	Write a program which takes two inputs, a time and an offset
	(positive or negative, in hours and minutes), and output the resulting time.
	Example, “10:00 PM” and “+2:30” results in “12:30 AM.”  Or “8:15 AM” and “-12:00” results in “8:15 PM.”
 */
class Challenge4 extends FlxState
{
	var input:FlxUIInputText;
	var inputTwo:FlxUIInputText;
	var output:FlxText;
	var title:FlxText;

	override public function create()
	{
		super.create();

		input = new FlxUIInputText(0, 0, 1000, 50);
		input.screenCenter();

		inputTwo = new FlxUIInputText(0, input.y + input.height + 10, 1000, 50);
		inputTwo.screenCenter(X);

		title = new FlxText(0, input.y - input.height, FlxG.width, 'Press ENTER TO Calculate Time', 50);
		title.y -= 10;
		title.alignment = CENTER;

		output = new FlxText(0, inputTwo.y + inputTwo.height + 10, FlxG.width, "", 50);
		output.alignment = CENTER;

		add(input);
		add(inputTwo);
		add(title);
		add(output);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(new PlayState());
		else if (FlxG.keys.justPressed.ENTER)
			doTheThing();
	}

	public function doTheThing()
	{
		var ogTime = toMinutes(input.text);
		var diffTime = toDiff(inputTwo.text);

		output.text = toFinalTime(ogTime, diffTime);
	}

	function toMinutes(inTime:String):Int
	{
		var minutes:Int = 0;
		var strArray:Array<String> = inTime.replace(' ', ':').split(':');
		if (strArray.length != 3)
			strArray.push('AM');
		// trace(strArray);

		minutes += Std.parseInt(strArray[0]) * 60;
		minutes += Std.parseInt(strArray[1]);
		if (strArray[2].contains('PM') && minutes < 720)
			minutes += 720;

		if (strArray[2].contains('AM') && minutes >= 720)
			minutes -= 720;

		// trace(minutes);
		return minutes;
	}

	function toDiff(inTime:String):Int
	{
		var minutes:Int = 0;
		var strArray:Array<String> = inTime.split(':');
		if (strArray[0].startsWith('-'))
			strArray[1] = '-' + strArray[1];
		// trace(strArray);

		minutes += Std.parseInt(strArray[0]) * 60;
		minutes += Std.parseInt(strArray[1]);

		// trace(minutes);
		return minutes;
	}

	function toFinalTime(og:Int, diff:Int):String
	{
		var time:String = '';

		var raw = og + diff;

		if (raw < 0)
			raw += 1440;
		else if (raw > 0)
			raw -= 1440;

		trace(raw);

		var hour:Int;
		var min:Int;

		hour = Std.int(raw / 60);
		trace(hour);

		return time;
	}
}
