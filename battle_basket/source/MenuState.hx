package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.scaleModes.RelativeScaleMode;
import flixel.system.scaleModes.RatioScaleMode;
import flixel.system.scaleModes.FillScaleMode;

import flixel.FlxObject;

class MenuState extends FlxState
{
	private var _credit_bg:FlxSprite;
	private var _player:Sprite;
	private var _ground:FlxSprite;
	
	private var _ballgroup:FlxGroup;
	private var _groundgroup:FlxGroup;
	
	override public function create():Void
	{
		super.create();
		
		
		_credit_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.title_bg__jpg);
		add(_credit_bg);
		
		_player = new Sprite(0, 0, AssetPaths.sakula__png, 64, 108);
		add(_player);
		
		//add(new FlxButton(100, 50, "test", pack_test));
		
		_ballgroup = new FlxGroup();
		for (i in 0...(6))
		{
			_ballgroup.add(new FlxSprite(i * 50 +100, 1000, AssetPaths.basketball_48__png));
		}
		add(_ballgroup);
		
		_groundgroup = new FlxGroup();
		for (i in 0...(8))
		{
			var ground:FlxSprite = new FlxSprite(i * 247, 1024, AssetPaths.ground__png);
			ground.immovable = true;
			_groundgroup.add(ground);
		}
		add(_groundgroup);
		
	}
	
	private function pack_test():Void
	{
		//FlxG.scaleMode = new RelativeScaleMode(0.75, 0.75);
		//FlxG.scaleMode =new RatioScaleMode(true);
		
		//FlxG.scaleMode = new FillScaleMode();(true);
		//FlxG.resizeGame(1920, 1080);
		
		//FlxG.log.add("width = "+FlxG.stage.width);
		//FlxG.log.add("high = "+FlxG.stage.height);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		
		//FlxG.overlap(_groundgroup, _player,ball_collect);
		FlxG.overlap(_ballgroup, _player,ball_collect);
		FlxG.collide(_groundgroup, _player);
		super.update(elapsed);
	}
	
	private function ball_collect(item:FlxObject, player:FlxObject):Void
	{
		item.destroy();
	}
	
}