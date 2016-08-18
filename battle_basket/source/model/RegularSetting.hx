package model;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

import flixel.addons.display.FlxExtendedSprite;

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
	
	private static function destory_item(item:FlxObject, target:FlxObject):Void
	{
		item.destroy();
	}
	
	
	public static function set_mouse_up(sp:FlxExtendedSprite,callback:MouseCallback):Void
	{
		#if (flash || js || desktop)
		sp.enableMouseClicks(true);
		sp.mouseReleasedCallback = callback;
		#end
	}
	
	public static function set_debug(sp:FlxExtendedSprite):Void
	{
		#if (flash || js || desktop)
		sp.enableMouseDrag();
		sp.mouseStopDragCallback = RegularSetting.point_info;
		#end
	}
	
	public static function point_info(sp:FlxExtendedSprite,x:Int,y:Int):Void
	{
		FlxG.log.add("x = " + sp.x);
		FlxG.log.add("y = " + sp.y);
	}
	


}
