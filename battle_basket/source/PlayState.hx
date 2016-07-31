package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import visual_component.CharSelect;
import visual_component.GameInput;

import visual_component.Ball;
import visual_component.Ground;
import visual_component.Net;
import visual_component.Character;

import flixel.util.helpers.FlxBounds.FlxBounds;
import flixel.addons.weapon.FlxWeapon;
import flixel.addons.weapon.FlxBullet;
import flixel.FlxObject;

class PlayState extends FlxState
{
	private var _player:Character;
	private var _ground:Ground;
	private var _net:Net;
	
	//TODO pack
	private var _ball_:FlxSprite;
	
	private var _testBall:Ball;
	
	private var _ballgroup:FlxGroup;
	
	private var _ball:FlxWeapon;
	private var _bullet_facotry:flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet> -> flixel.addons.weapon.FlxBullet;
	private var _offset:FlxBounds<FlxPoint>;
	private var _speed:FlxBounds<Float>;
	private var _max_speend:FlxBounds<Float>;
	
	private var _gameinput:GameInput;
	public var group:FlxGroup;
	
	override public function create():Void
	{
		super.create();
		
		_ground = new Ground();
		add(_ground);
		
		//控制要先create,不然會有奇怪的bug(放到最後建,isTouching(FlxObject.FLOOR) 會為false)
		_gameinput = new GameInput();
		add(_gameinput);
		
		_gameinput.mouse_pressed.add(player_shut);
		_gameinput.A.add(player_shut);
		
		_gameinput.left.add(left);
		_gameinput.right.add(right);
		_gameinput.up.add(up);
		
		_gameinput.left_release.add(player_reset);
		_gameinput.right_release.add(player_reset);
		_gameinput.up_release.add(player_reset);
		
		_testBall = new Ball();
		add(_testBall);
		
		_net = new Net();
		add(_net);
		
		_player = new Character(0, 0, AssetPaths.sakula__png, 64, 108);
		_player.drag.set(200, 100);
		add(_player);
		
		_ball_ = new FlxSprite(500, 500, AssetPaths.basketball_48__png);

		add(_ball_);
		_ball_.kill();
		
		//var p:FlxPoint = new FlxPoint();
			//p.x = 10;
			//p.y = 10;
			//var q:FlxPoint = new FlxPoint();
			//q.x = 10;
			//q.y = 10;
		//_offset = new FlxBounds<FlxPoint>(p,q);
		
		
		//_speed = new FlxBounds<Float>(1.0, 2.0);
		//_max_speend = new FlxBounds<Float>(1.0, 2.0);
		//_bullet_facotry = new flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet>;
		
	    //for (i in 0...(1))
		//{
			//var _bullet:flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet> = new flixel.addons.weapon.FlxTypedWeapon<flixel.addons.weapon.FlxBullet>();
			//_bullet.l(AssetPaths.basketball_32__png);
			//_bullet_facotry.bind(_bullet);
		//}
		//add(_bullet_facotry);
		
		
		//_ball = new FlxWeapon("name",_bullet_facotry,FlxWeaponFireFrom.PARENT(_player,_offset),FlxWeaponSpeedMode.ACCELERATION(_speed,_max_speend));
		
		
		
		Main._model.playing.dispatch(1);
	}

	private function bullet_fac():FlxBullet
    {
        //so you create the bullet, do something to it, then return it
        var b = new FlxBullet();
        b.makeGraphic(2, 2); 
        return b;
    }
	
	override public function update(elapsed:Float):Void
	{
		//TODO 主要遊戲訊息溝通
		FlxG.collide(_ground.group, _ball_);
		FlxG.collide(_ground.group, _player);
		
		FlxG.overlap(_testBall.group, _player,ball_collect);
		
		super.update(elapsed);
	}
	
	private function left(s:Dynamic):Void
	{
		_player.state = SpriteState.left;
	}
	
	private function right(s:Dynamic):Void
	{
		_player.state = SpriteState.right;
	}
	
	private function up(s:Dynamic):Void
	{
		_player.jump();
	}
	
	private function player_shut(s:Dynamic):Void
	{
		shot();
	}
	
	private function player_reset(s:Dynamic):Void
	{	
		_player.state = SpriteState.idel;
	}
	
	private function shot():Void
	{
		_ball_.revive();
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