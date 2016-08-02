package model;

import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author hhg4092
 */

class RegularSetting extends FlxObject
{	
	public function new() 
	{
		super();		
	}
	
	public static function group_show(item:FlxBasic):Void
	{
		var target:FlxSprite = cast(item, FlxSprite);
		target.revive();
	}
	
	public static function group_hide(item:FlxBasic):Void
	{
		var target:FlxSprite = cast(item, FlxSprite);
		target.kill();
	}
	
}
