package ;

import flixel.addons.weapon.FlxBullet;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.scaleModes.RelativeScaleMode;
import flixel.system.scaleModes.RatioScaleMode;
import flixel.system.scaleModes.FillScaleMode;
import flixel.util.helpers.FlxBounds.FlxBounds;

import flixel.addons.effects.FlxClothSprite;
import flixel.addons.weapon.FlxWeapon;


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
	
	private var _hoop:FlxSprite;
	private var _net:FlxClothSprite;
	
	private var _ball:FlxWeapon;
	private var _bullet_facotry:flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet> -> flixel.addons.weapon.FlxBullet;
	private var _offset:FlxBounds<FlxPoint>;
	private var _speed:FlxBounds<Float>;
	private var _max_speend:FlxBounds<Float>;
	
	private var _ball_:FlxSprite;
	
	private var _shot:FlxSprite;
	
	private var _up:FlxSprite;
	//private var _down:FlxSprite;
	private var _left:FlxSprite;
	private var _right:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		
		_credit_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.title_bg__jpg);
		add(_credit_bg);
		
		_hoop = new FlxSprite(730,40).loadGraphic(AssetPaths.hoop__png);
		add(_hoop);
		
		_shot = new FlxSprite(1700, 910).loadGraphic(AssetPaths.basketball_72__png);
		_shot.scale.set(2, 2);
		add(_shot);
		
		_net = new FlxClothSprite(853, 320,AssetPaths.net__png);
		_net.pinnedSide = FlxObject.NONE;
		_net.setMesh(1, 1, 0, 0, [0, 1]);
		_net.iterations = 10;
		_net.maxVelocity.set(50, 50);
		_net.meshVelocity.y = 10;
		add(_net);
		
		_ball_ = new FlxSprite(500, 500, AssetPaths.basketball_48__png);
		
		
		add(_ball_);
		
		
		_player = new Sprite(0, 0, AssetPaths.sakula__png, 64, 108);
		_player.drag.set(200, 100);
		add(_player);
	
		var p:FlxPoint = new FlxPoint();
			p.x = 10;
			p.y = 10;
			var q:FlxPoint = new FlxPoint();
			q.x = 10;
			q.y = 10;
		_offset = new FlxBounds<FlxPoint>(p,q);
		
		
		_speed = new FlxBounds<Float>(1.0, 2.0);
		_max_speend = new FlxBounds<Float>(1.0, 2.0);
		//_bullet_facotry = new flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet>;
		
	    //for (i in 0...(1))
		//{
			//var _bullet:flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet> = new flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet>();
			//_bullet.l(AssetPaths.basketball_32__png);
			//_bullet_facotry.bind(_bullet);
		//}
		//add(_bullet_facotry);
		
		
		_ball = new FlxWeapon("name",_bullet_facotry,FlxWeaponFireFrom.PARENT(_player,_offset),FlxWeaponSpeedMode.ACCELERATION(_speed,_max_speend));
		
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
		
		_up = new FlxSprite(200, 854);
		_up.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		_up.animation.frameIndex = 0;
		_up.scale.set(2, 2);
		add(_up);
		
		//_down = new FlxSprite(120, 994);
		//_down.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		//_down.animation.frameIndex = 2;
		//add(_down);
		
		_left = new FlxSprite(44, 964);
		_left.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		_left.animation.frameIndex = 3;
		_left.scale.set(2, 2);
		add(_left);
		
		_right = new FlxSprite(350, 964);
		_right.loadGraphic(AssetPaths.direction_arrow__png, true, 88, 88);
		_right.animation.frameIndex = 1;
		_right.scale.set(2, 2);
		add(_right);
		
		//_adjust = new Adjust_tool();
		//add(_adjust);
		
		//Main._model.adjust_item.dispatch(_groundgroup.getFirstAlive());
		Main._model.adjust_item.dispatch(_right);
	}
	
	private function bullet_fac():FlxBullet
    {
        //so you create the bullet, do something to it, then return it
        var b = new FlxBullet();
        b.makeGraphic(2, 2); 
        return b;
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
		FlxG.collide(_groundgroup, _ball_);
		
		#if flash
		if (FlxG.mouse.pressed) 
		{
			_net.meshVelocity.x = FlxG.random.float(0, _net.maxVelocity.x);
			//_ball.fireFromAngle(_speed);
			shot();
		}
		
		if (FlxG.mouse.justPressed) {}
		if (FlxG.mouse.justReleased) 
		{
			//_net.meshVelocity.x = 0;
			
		}
		#end
		
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
					_player.go_left(true);
				}
				else if (touch.overlaps(_right))
				{
					_player.go_right(true);
				}
				else if (touch.overlaps(_shot))
				{
					shot();
				}
				else if (touch.overlaps(_up))
				{
					_player.jump();
				}
			}
			if (touch.justReleased) 
			{
				//FlxG.log.add("pressed relase ============= ");
				_player.go_right(false);
				_player.go_left(false);
			}
		}
		#end
		
		super.update(elapsed);
	}
	
	private function shot():Void
	{
		var dir:Int = 500;
		if (_player.facing == FlxObject.RIGHT) dir = 500;
		else dir = -500;
		_ball_.x = _player.x +10;
		_ball_.y = _player.y +10;
		_ball_.acceleration.y = 980;
		_ball_.velocity.x = dir;
		_ball_.velocity.y = -500;	
		_ball_.elasticity = 0.8;
	}
	
	private function ball_collect(item:FlxObject, player:FlxObject):Void
	{
		item.destroy();
	}
	
}