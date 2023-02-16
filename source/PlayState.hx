package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var listText:FlxText;

	override public function create()
	{
		listText = new FlxText(0, 0, 0, 'Press 1 For Challenge 1\nPress 2 For Challenge 2\nPress 3 For Challenge 3\nPress 4 For Challenge 4', 40);
		listText.alignment = CENTER;
		listText.screenCenter();
		add(listText);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ONE)
			FlxG.switchState(new Challenge1());
		else if (FlxG.keys.justPressed.TWO)
			FlxG.switchState(new Challenge2());
		else if (FlxG.keys.justPressed.THREE)
			FlxG.switchState(new Challenge3());
		else if (FlxG.keys.justPressed.FOUR)
			FlxG.switchState(new Challenge4());
	}
}
