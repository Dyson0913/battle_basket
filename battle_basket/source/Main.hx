package ;

import flixel.FlxGame;
import openfl.display.Sprite;
import haxe.Log;
import flixel.FlxG;

class Main extends Sprite
{
	public function new()
	{
		super();
		
		addChild(new FlxGame(1920, 1080, MenuState));
		//FlxG.debugger.visible = true;
		//FlxG.log.add("width = "+FlxG.stage.width);
		//FlxG.log.add("high = "+FlxG.stage.height);
		
	}
}