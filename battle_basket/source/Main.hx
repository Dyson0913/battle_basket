package ;

import flixel.FlxGame;
import openfl.display.Sprite;
import haxe.Log;
import flixel.FlxG;

import model.Model;
import flixel.input.touch.FlxTouchManager;
import flixel.addons.plugin.FlxMouseControl;

class Main extends Sprite
{
	public static var _model:Model;
	public function new()
	{
		super();
		
		
		_model = new Model();
		addChild(new FlxGame(1920, 1080, MenuState));
		
		#if (flash || js || desktop)
			FlxG.plugins.add(new FlxMouseControl());
		#end
		//FlxG.debugger.visible = true;
		FlxG.camera.antialiasing = true;
		//FlxG.log.add("width = "+FlxG.stage.width);
		//FlxG.log.add("high = "+FlxG.stage.height);
		
	}
}