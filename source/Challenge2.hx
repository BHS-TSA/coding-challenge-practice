package;

using StringTools;

/**
	Write a program which takes an integer input and determines if it is a prime number.
	Example, “97” results in “is a prime number.”
 */
class Challenge2 extends ChallengeBase
{
	override public function create()
	{
		super.create();

		title.text = 'Press ENTER To Test Number';
	}

	override function doTheThing()
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
