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
import flixel.FlxObject;

class Net extends FlxTypedGroup<FlxSprite>
{
	private var _hoop:FlxSprite;
	private var _net:FlxClothSprite;
	
	public function new() 
	{
		super();
		
		_hoop = new FlxSprite(730,40).loadGraphic(AssetPaths.hoop__png);
		add(_hoop);
		
		_net = new FlxClothSprite(853, 320,AssetPaths.net__png);
		_net.pinnedSide = FlxObject.NONE;
		_net.setMesh(1, 1, 0, 0, [0, 1]);
		_net.iterations = 10;
		_net.maxVelocity.set(50, 50);
		_net.meshVelocity.y = 10;
		add(_net);
		
		//event
		Main._model.NewRoundState.add(appear);
		
		//_net.meshVelocity.x = FlxG.random.float(0, _net.maxVelocity.x);
		//_net.meshVelocity.x = 0;
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
}