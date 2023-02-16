package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;

class ChallengeBase extends FlxState
{
	var input:FlxUIInputText;
	var output:FlxText;
	var title:FlxText;

	override public function create()
	{
		super.create();

		input = new FlxUIInputText(0, 0, 1000, 50);
		input.screenCenter();

		title = new FlxText(0, input.y - input.height, FlxG.width, '', 50);
		title.y -= 10;
		title.alignment = CENTER;

		output = new FlxText(0, input.y + input.height, FlxG.width, "", 50);
		output.y += 10;
		output.alignment = CENTER;

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

	public function doTheThing()
	{
		// do the thing
	}
}
