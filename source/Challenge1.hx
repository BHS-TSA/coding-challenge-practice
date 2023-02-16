package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;

using StringTools;

/**
	Write a program which takes an integer input and outputs the corresponding text.
	Example, “123” results in “one two three.”
 */
class Challenge1 extends FlxState
{
	var input:FlxUIInputText;
	var output:FlxText;
	var title:FlxText;

	override public function create()
	{
		input = new FlxUIInputText(0, 0, 1000, 50);
		input.screenCenter();

		title = new FlxText(0, input.y - input.height, FlxG.width, "Press ENTER To Stringify", 50);
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
		var thingy = input.text;
		var swagList:Array<String> = thingy.split('');

		var out:String = '';

		for (letter in swagList)
		{
			switch (letter)
			{
				case '1':
					out += 'One ';
				case '2':
					out += 'Two ';
				case '3':
					out += 'Three ';
				case '4':
					out += 'Four ';
				case '5':
					out += 'Five ';
				case '6':
					out += 'Six ';
				case '7':
					out += 'Seven ';
				case '8':
					out += 'Eight ';
				case '9':
					out += 'Nine ';
				case '0':
					out += 'Zero ';
				case _:
					trace('UNSUPPORTED CHARACTER');
			}
		}
		out = out.trim();

		trace('Outputting $out');
		output.text = out;
	}
}
