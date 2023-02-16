package;

using StringTools;

/**
	Write a program which takes a sentence and determines if it is a pangram
	(contains each character in the alphabet at least once).
	Example, “A quick brown fox jumps over the lazy dog” results in “is a pangram.”
	If the sentence is not a pangram, the output should be the list of letters which are not present.
 */
class Challenge3 extends ChallengeBase
{
	override public function create()
	{
		super.create();

		title.text = 'Press ENTER to Test Pangram';
	}

	override function doTheThing()
	{
		var flag:Bool = false;
		var keys:String = 'abcdefghijklmnopqrstuvwxyz';

		var thingy = input.text.trim().toLowerCase();

		for (i in 0...keys.length)
		{
			if (thingy.contains(keys.charAt(i)) == false)
			{
				flag = true;
				trace('Did not have ' + keys.charAt(i));
				break;
			}
		}

		if (!flag)
			output.text = input.text + ' is a Pangram.';
		else
			output.text = input.text + ' is not a Pangram';
	}
}
