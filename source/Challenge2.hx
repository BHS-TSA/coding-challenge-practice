package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;

using StringTools;

/**
	Write a program which takes an integer input and determines if it is a prime number.
	Example, “97” results in “is a prime number.”
 */
class Challenge2 extends FlxState
{
	var input:FlxUIInputText;
	var output:FlxText;
	var title:FlxText;

	override public function create()
	{
		input = new FlxUIInputText(0, 0, 1000, 50);
		input.screenCenter();

		title = new FlxText(0, input.y - input.height, FlxG.width, "Press ENTER To Test Number", 50);
		title.y -= 10;
		title.alignment = CENTER;

		output = new FlxText(0, input.y + input.height, FlxG.width, "", 50);
		output.y += 10;
		output.alignment = CENTER;

		super.create();

		add(input);
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

	function doTheThing()
	{
		var thingy = Std.parseInt(input.text.trim());

		var out:String = '$thingy is ';
		var flag:Bool = false;

		if (thingy > 1)
		{
			for (i in 2...Std.int(Math.sqrt(thingy) + 1))
			{
				if (thingy % i == 0)
				{
					trace('Loop count $i');
					flag = true;
					break;
				}
			}
		}
		else
		{
			flag = true;
		}

		if (flag)
			out += 'Composite';
		else
			out += 'Prime';

		trace(out);
		output.text = out;
	}
}
