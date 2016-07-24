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
import visual_component.Adjust_tool;

class MenuState extends FlxState
{
	private var _credit_bg:FlxSprite;
	private var _player:Sprite;
	private var _ground:FlxSprite;
	
	private var _adjust:Adjust_tool;
	private var _ballgroup:FlxGroup;
	private var _groundgroup:FlxGroup;
	
	private var _up:FlxSprite;
	private var _down:FlxSprite;
	private var _left:FlxSprite;
	private var _right:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		
		_credit_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.title_bg__jpg);
		add(_credit_bg);
		
		_player = new Sprite(0, 0, AssetPaths.sakula__png, 64, 108);
		_player.drag.set(200, 100);
		add(_player);
		
		//add(new FlxButton(100, 50, "test", pack_test));
		
		_ballgroup = new FlxGroup();
		for (i in 0...(6))
		{
			_ballgroup.add(new FlxSprite(i * 50 +100, 750, AssetPaths.basketball_48__png));
		}
		add(_ballgroup);
		
		_groundgroup = new FlxGroup();
		for (i in 0...(8))
		{
			var ground:FlxSprite = new FlxSprite(i * 247, 800, AssetPaths.ground__png);
			ground.immovable = true;
			_groundgroup.add(ground);
		}
		add(_groundgroup);
		
		_up = new FlxSprite(120, 824);
		_up.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		_up.animation.frameIndex = 0;
		add(_up);
		
		_down = new FlxSprite(120, 994);
		_down.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		_down.animation.frameIndex = 2;
		add(_down);
		
		_left = new FlxSprite(24, 914);
		_left.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		_left.animation.frameIndex = 3;
		add(_left);
		
		_right = new FlxSprite(210, 914);
		_right.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		_right.animation.frameIndex = 1;
		add(_right);
		
		_adjust = new Adjust_tool();
		add(_adjust);
		
		//Main._model.adjust_item.dispatch(_groundgroup.getFirstAlive());
		Main._model.adjust_item.dispatch(_left);
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
		
		#if mobile
		
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed) 
			{ 
				//FlxG.log.add("justPressed ============= ");
			}
			if (touch.pressed) 
			{
				if (touch.overlaps(_left))
				{
					//FlxG.log.add("pressed left ============= ");
					_player.turn_left();
				}
				else if (touch.overlaps(_right))
				{
					//FlxG.log.add("pressed right ============= ");
					_player.turn_right();
				}
				else 
				{
					//FlxG.log.add("pressed jump ============= ");
					_player.jump();
				}
			}
			if (touch.justReleased) 
			{
				//FlxG.log.add("pressed relase ============= ");
			}
		}
		#end
		
		super.update(elapsed);
	}
	
	private function ball_collect(item:FlxObject, player:FlxObject):Void
	{
		item.destroy();
	}
	
}