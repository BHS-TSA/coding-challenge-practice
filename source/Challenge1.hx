package;

using StringTools;

/**
	Write a program which takes an integer input and outputs the corresponding text.
	Example, “123” results in “one two three.”
 */
class Challenge1 extends ChallengeBase
{
	override public function create()
	{
		super.create();

		title.text = 'Press ENTER To Stringify';
	}

	override function doTheThing()
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
