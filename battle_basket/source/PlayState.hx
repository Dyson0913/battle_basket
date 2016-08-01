package ;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import visual_component.Adjust_tool;
import visual_component.CharSelect;
import visual_component.GameInput;
import visual_component.Timer;

import visual_component.Ball;
import visual_component.Ground;
import visual_component.Net;
import visual_component.Character;

import flixel.util.helpers.FlxBounds.FlxBounds;
import flixel.addons.weapon.FlxWeapon;
import flixel.addons.weapon.FlxBullet;
import flixel.FlxObject;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class PlayState extends FlxState
{
	private var _player:Character;
	private var _opp_player:Character;
	private var _ground:Ground;
	private var _net:Net;
	private var _timer:Timer;
	
	private var _adjust:Adjust_tool;
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

	private var _self_charact:FlxSprite;
	private var _vs:FlxSprite;
	private var _op_charact:FlxSprite;
	
	private var _score_board:FlxSprite;
	
	private var _mario:FlxSprite;
	
	public var _traGroup:FlxGroup;
	
	public var _ready:FlxGroup;
	
	override public function create():Void
	{
		super.create();
		
		_adjust = new Adjust_tool();
		
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
		
		_timer = new Timer();
		
		
		_player = new Character(150, -120, AssetPaths.sakula__png, 64, 108);
		//_player.drag.set(150, -120);
		//add(_player);
		
		_opp_player = new Character(1700, -120, AssetPaths.sakula__png, 64, 108);
		_opp_player.turn_left();
		
		
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
		
		_self_charact = new FlxSprite(200, 190,"assets/images/char_" + Main._model._char_id + ".png");
		add(_self_charact);
		FlxTween.tween(_self_charact.scale, { x: 1.5, y:1.5 }, 1, { ease: FlxEase.bounceOut } );
		
		_vs = new FlxSprite(620, 270, AssetPaths.VS__png);
		_vs.scale.set(5.0, 5.0);
		add(_vs);
		FlxTween.tween(_vs.scale, { x: 1.5, y:1.5 }, 1, { ease: FlxEase.bounceOut ,onComplete: put_ready} );
		
		_op_charact = new FlxSprite(1370, 190,"assets/images/char_" + Main._model._char_id + ".png");
		add(_op_charact);
		FlxTween.tween(_op_charact.scale, { x: 1.5, y:1.5 }, 1, { ease: FlxEase.bounceOut } );
		
		_score_board = new FlxSprite(660, -150, AssetPaths.scroe_board__png);
		
		
		
		
		_ready = new FlxGroup();
		for (i in 0...(5))
		{//560
			var item:FlxSprite = new FlxSprite(i * 151 +580, 1110);
			item.loadGraphic(AssetPaths.alpha__png,true, 137, 151);
			if( i ==0) item.animation.frameIndex = 17;
			if( i ==1) item.animation.frameIndex = 4;
			if( i ==2) item.animation.frameIndex = 0;
			if( i ==3) item.animation.frameIndex = 3;
			if( i ==4) item.animation.frameIndex = 24;
			item.ID = i;
			item.kill();
			add(item);
			_ready.add(item);
		}
		add(_ready);
		
		_traGroup = new FlxGroup();
		for (i in 0...(5))
		{
			var item:FlxSprite = new FlxSprite(i * 140 +1300, 0,AssetPaths.trature__png);
			item.kill();
			add(item);
			_traGroup.add(item);
		}
		add(_traGroup);

		_mario =  new FlxSprite(1100, 0, AssetPaths.mario__png);
		
		
		Main._model.time_tick.add(timetick);
		
		//add(_adjust);
		//Main._model.adjust_item.dispatch(_mario);
		
		//Main._model.playing.dispatch(1);
	}
	
	private function timetick(s:Dynamic):Void
	{
		_mario.x += 10;
	}
	
	private function item_show(item:FlxBasic):Void
	{
		var myitem:FlxSprite = cast(item, FlxSprite);
		myitem.revive();
	}
	
	private function put_ready(Tween:FlxTween):Void
	{
		_ready.forEach(effect);
	}

	private function effect(item:FlxBasic):Void
	{
		
		var myitem:FlxSprite = cast(item, FlxSprite);
		myitem.revive();
		if ( myitem.ID == 4) FlxTween.tween(myitem, { y: myitem.y -530 }, 1, { ease: FlxEase.bounceOut,startDelay:0.1*myitem.ID,onComplete: ready_go } );
		else FlxTween.tween(myitem, { y: myitem.y -530 }, 1, { ease: FlxEase.bounceOut,startDelay:0.1*myitem.ID } );
	}
	
	private function ready_go(Tween:FlxTween):Void
	{
		FlxTween.tween(this, { }, 1, { onComplete: put_go } );
		
	}
	
	private function put_go(Tween:FlxTween):Void
	{
		_ready.forEach(effect_go);
	}
	
	private function effect_go(item:FlxBasic):Void
	{
		var myitem:FlxSprite = cast(item, FlxSprite);
		if (myitem.ID == 1) 
		{
			myitem.animation.frameIndex = 6;
			FlxTween.tween(myitem.scale, { x: 3.0 ,y:3.0 }, 1, { ease: FlxEase.cubeOut } );
			FlxTween.tween(myitem,{ alpha: 0 }, 1, { ease: FlxEase.cubeOut } );
		}
		else if (myitem.ID == 3) 
		{
			myitem.animation.frameIndex = 14;
			FlxTween.tween(myitem.scale, { x: 3.0 , y:3.0}, 1, { ease: FlxEase.cubeOut } );
			FlxTween.tween(myitem, { alpha: 0 }, 1, { ease: FlxEase.cubeOut } );
			
			FlxTween.tween(_self_charact, { alpha: 0 }, 1, { ease: FlxEase.cubeOut } );
			FlxTween.tween(_vs, { alpha: 0 }, 1, { ease: FlxEase.cubeOut } );
			FlxTween.tween(_op_charact, { alpha: 0 }, 1, { ease: FlxEase.cubeOut } );
			
			add(_player);
			add(_opp_player);
			
			FlxTween.tween(_score_board, { y: _score_board.y +140 }, 1 );
			add(_score_board);
			
			add(_timer);
			_traGroup.forEach(item_show);
			add(_mario);
			
			Main._model.playing.dispatch(1);
			
			
			
		}
		else FlxTween.tween(myitem, { alpha: 0 }, 0.1);
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
		FlxG.collide(_ground.group, _opp_player);
		
		FlxG.collide(_traGroup, _mario,tra_collect);
		
		FlxG.overlap(_testBall.group, _player,ball_collect);
		
		super.update(elapsed);
	}
	
	private function tra_collect(item:FlxObject, player:FlxObject):Void
	{
		item.destroy();
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