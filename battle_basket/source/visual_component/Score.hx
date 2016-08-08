package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import model.Model;

import flixel.util.FlxColor;
import flixel.util.FlxTimer;



class Score extends FlxTypedGroup<FlxSprite>
{
	private var _digit:Array<FlxSprite>;
	
	private var _ten:FlxSprite;
	private var _one:FlxSprite;
	
	public function new(X:Float=0, Y:Float=0,digit:Int) 
	{
		super();
		//_digit = new FlxSpriteGroup(X, Y, digit);
		
		_digit = new Array<FlxSprite>();
		
		var dis:Float = (160 - (160 * 0.45)) / 2;
		for (i in 0...(digit))
		{
			var number:FlxSprite = new FlxSprite(X - (i*56), Y);
			number.loadGraphic(AssetPaths.time_numer__png, true, 160, 224);
			number.scale.set(0.45, 0.45);
			number.animation.frameIndex = 0;
			add(number);
			_digit.push(number);
		}
		//
		
		//event
		Main._model.Menu.add(appear);
		Main._model.playing.add(appear);
		Main._model.Settle.add(disappear);
		Main._model.credit.add(disappear);
		
		
		disappear(1);
		//Main._model.adjust_item.dispatch(_digit[0]);
		
	}
	
	private function appear(s:Dynamic):Void
	{
		//Std.parseInt
		//Main._model._remain_time = 60;
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
}