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
	
	public var hoopleftPoint:FlxSprite;
	public var hooprightPoint:FlxSprite;
	
	public function new() 
	{
		super();
		
		_hoop = new FlxSprite(730, 380).loadGraphic(AssetPaths.hoop__png);
		_hoop.scale.set(0.5, 0.5);
		add(_hoop);
		
		hoopleftPoint = new FlxSprite(_hoop.x +160, _hoop.y + 215).loadGraphic(AssetPaths.hoopPoint__png);
		hoopleftPoint.scale.set(0.5, 0.5);
		hoopleftPoint.immovable = true;
		add(hoopleftPoint);
		
		hooprightPoint = new FlxSprite(_hoop.x +255, _hoop.y + 215).loadGraphic(AssetPaths.hoopPoint__png);
		hooprightPoint.scale.set(0.5, 0.5);
		hooprightPoint.immovable = true;
		add(hooprightPoint);
		
		//_net = new FlxClothSprite(853, 320, AssetPaths.net__png);
		//_net.scale.set(0.2, 0.2);
		//_net.pinnedSide = FlxObject.NONE;
		//_net.setMesh(1, 1, 0, 0, [0, 1]);
		//_net.iterations = 10;
		//_net.maxVelocity.set(50, 50);
		//_net.meshVelocity.y = 10;
		//add(_net);
		
		//event
		
		//_net.meshVelocity.x = FlxG.random.float(0, _net.maxVelocity.x);
		//_net.meshVelocity.x = 0;
		
		//Main._model.adjust_item.dispatch(hoopleftPoint);
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
}