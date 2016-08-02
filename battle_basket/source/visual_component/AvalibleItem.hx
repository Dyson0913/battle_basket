package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

import model.RegularSetting;

import flixel.addons.display.FlxPieDial;
import flixel.addons.display.FlxPieDial.FlxPieDialShape;
import flixel.tweens.FlxTween;

class AvalibleItem extends FlxTypedGroup<FlxSprite>
{
	public var group( default, null ):FlxGroup;
	
	public var cd_group:FlxGroup;
	
	public function new() 
	{
		super();
		
		group = new FlxGroup();
		for (i in 0...(3))
		{
			var item:FlxSprite = new FlxSprite(i * 80 +10, 10, AssetPaths.basketball_72__png);
			item.antialiasing = true;
			add(item);
			group.add(item);
		}
		
		cd_group = new FlxGroup();
		for (i in 0...(3))
		{
			var dial:FlxPieDial = new FlxPieDial(i * 80 +10, 10, 30, 0x55000000, 36, FlxPieDialShape.CIRCLE, false, 0);
			//dial.loadGraphic(AssetPaths.basketball_72__png);
			dial.amount = 1.0;
			add(dial);
			cd_group.add(dial);
		}
		
		disappear(1);
		//_dial = new FlxPieDial(100, 200, 90, 0x55FF0000, 36, FlxPieDialShape.CIRCLE, true, 0);
		//_dial.amount = 0.0;
		//add(_dial);
		//FlxTween.tween(_dial, { amount: 1.0 }, 2.0);
		//event
		Main._model.adjust_item.dispatch(cd_group.getFirstAvailable() );
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		//group.kill();
		//cd_group.kill();
		group.forEach(RegularSetting.group_hide);
		cd_group.forEach(RegularSetting.group_hide);
	}
	
	public function Start_CD():Void
	{
		//all item is alive
		if ( group.countLiving() == group.length) return;
		
		var item:FlxSprite = cast(group.getFirstDead(), FlxSprite);
		item.revive();
		
		var cd:FlxPieDial = cast(cd_group.getFirstDead(), FlxPieDial);
		cd.revive();
		cd.amount = 1.0;
		FlxTween.tween(cd, { amount: 0.0 }, 2.0,{ onComplete: one_item_avalible });
	}
	
	public function Shotting():Void
	{		
		var item:FlxSprite = cast(group.getFirstAlive(), FlxSprite);
		item.kill();
		
		var cd:FlxPieDial = cast(cd_group.getFirstAlive(), FlxPieDial);
		cd.kill();
	}
	
	public function one_item_avalible(Tween:FlxTween):Void
	{
		Start_CD();
	}
	
}