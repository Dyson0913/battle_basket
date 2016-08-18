package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

import model.Model;

import flixel.addons.effects.FlxClothSprite;

class Ground extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;
	
	public var group( default, null ):FlxGroup;
	
	public function new() 
	{
		super();
		
		_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.playing_bg__jpg);
		add(_bg);
		
		//group = new FlxGroup();
		//for (i in 0...(8))
		//{
			//var ground:FlxSprite = new FlxSprite(i * 247, 800, AssetPaths.ground__png);
			//ground.immovable = true;
			//
			//add(ground);
			//
			//group.add(ground);
		//}
		
		//event
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
}