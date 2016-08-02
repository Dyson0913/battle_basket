package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

import model.Model;

class Ball extends FlxTypedGroup<FlxSprite>
{
	public var group( default, null ):FlxGroup;
	
	public function new() 
	{
		super();
		
		group = new FlxGroup();
		for (i in 0...(8))
		{
			var item:FlxSprite = new FlxSprite(i * 50 +100, 750, AssetPaths.basketball_48__png);
			add(item);
			group.add(item);
		}
		
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
}