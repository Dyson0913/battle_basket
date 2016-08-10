package ;

import flixel.addons.display.FlxExtendedSprite;
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
import visual_component.AvalibleItem;
import visual_component.CharSelect;
import visual_component.GameInput;
import visual_component.Score;
import visual_component.Timer;

import visual_component.Ground;
import visual_component.Net;
import visual_component.Character;

import flixel.util.helpers.FlxBounds.FlxBounds;
import flixel.addons.weapon.FlxWeapon;
import flixel.addons.weapon.FlxBullet;
import flixel.FlxObject;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

import model.RegularSetting;

class LevelState extends FlxState
{
	private var _player:Character;
	private var _opp_player:Character;
	private var _ground:Ground;
	private var _net:Net;
	private var _timer:Timer;
	private var _player_ball:AvalibleItem;
	private var _player_score:Score;
	private var _opp_score:Score;
	
	private var _shot_icon:FlxExtendedSprite;
	
	private var _adjust:Adjust_tool;
	
	
	//TODO pack
	private var _ball_:FlxSprite;
	
	private var _gameinput:GameInput;

	private var _self_charact:FlxSprite;
	private var _vs:FlxSprite;
	private var _op_charact:FlxSprite;
	
	private var _score_board:FlxSprite;
	
	private var _mario:FlxSprite;
	
	public var _traGroup:FlxGroup;
	
	public var _ready:FlxGroup;
	
	public var _test_ground:FlxSprite;
	public var _test_ground2:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		_adjust = new Adjust_tool();
		
		_ground = new Ground();
		add(_ground);
		
		//控制要先create,不然會有奇怪的bug(放到最後建,isTouching(FlxObject.FLOOR) 會為false)
		_gameinput = new GameInput();
		add(_gameinput);
		
		_gameinput.mouse_pressed.add(mouse_preseed_event);
		_gameinput.A.add(mouse_preseed_event);
		_gameinput.A_release.add(player_shut);
		
		_gameinput.left.add(left);
		_gameinput.right.add(right);
		_gameinput.up.add(up);
		
		_gameinput.left_release.add(player_reset);
		_gameinput.right_release.add(player_reset);
		_gameinput.up_release.add(player_reset);
		
		_shot_icon = new FlxExtendedSprite(1713, 888, AssetPaths.basketball_72__png);
		_shot_icon.scale.set(3.0, 3.0);
		RegularSetting.set_debug(_shot_icon);
		RegularSetting.set_mouse_up(_shot_icon, this.click);
		add(_shot_icon);
		
		_gameinput._shot = _shot_icon;
		
		_net = new Net();
		add(_net);
		
		_timer = new Timer();
		
		_player_ball = new AvalibleItem();
		
		
		_player = new Character(100, 400, AssetPaths.sakula__png, 64, 108);
		
		_opp_player = new Character(1750, 400, AssetPaths.sakula__png, 64, 108);
		_opp_player.turn_left();
		
		
		_ball_ = new FlxSprite(500, 500, AssetPaths.basketball_48__png);
		add(_ball_);
		_ball_.kill();
		
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
		_player_score = new Score(750, -60, 2);
		_opp_score = new Score(1070, -60, 2);
		
		_test_ground = new FlxSprite(-250, 670, AssetPaths.ground__png);
		_test_ground.immovable = true;
		_test_ground.allowCollisions = FlxObject.UP;
		add(_test_ground);
		
		_test_ground2 = new FlxSprite(1920, 670, AssetPaths.ground__png);
		_test_ground2.immovable = true;
		_test_ground2.allowCollisions = FlxObject.UP;
		add(_test_ground2);
		
		_ready = new FlxGroup();
		for (i in 0...(5))
		{//560
			var item:FlxSprite = new FlxSprite(i * 151 +580, 1110);
			item.loadGraphic(AssetPaths.alpha__png,true, 137, 151);
			if( i ==0) item.animation.frameIndex = 18;
			if( i ==1) item.animation.frameIndex = 19;
			if( i ==2) item.animation.frameIndex = 0;
			if( i ==3) item.animation.frameIndex = 6;
			if( i ==4) item.animation.frameIndex = 4;
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
		//Main._model.adjust_item.dispatch(_test_ground2);
		
	}
	
	public  function click(sp:FlxExtendedSprite,x:Int,y:Int):Void
	{
		FlxG.log.add("x = ");
		player_shut(1);
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
			
		
			
			FlxTween.tween(_score_board, { y: _score_board.y +140 }, 1,{ onComplete: score_show }  );
			add(_score_board);
			
			
			
			add(_timer);
			_traGroup.forEach(item_show);
			add(_mario);
			
			
			
			add(_player_ball);
			_player_ball.Start_CD();
			
			//_net.move_type(MoveStyle.VerticalMove,0);
			//_net.move_type(MoveStyle.Horizontal,1);
			
			Main._model.playing.dispatch(1);
			
			
			
		}
		else FlxTween.tween(myitem, { alpha: 0 }, 0.1);
	}
	
	private function score_show(Tween:FlxTween):Void
	{
		//FlxTween.tween(_player_score, { y: _player_score.y +140 }, 1 );
		add(_player_score);
		add(_opp_score);
		
		add(_player);
		add(_opp_player);
		
		FlxTween.tween(_test_ground, { x: _test_ground.x +200 }, 0.5 ); 
		FlxTween.tween(_test_ground2, { x: _test_ground2.x -200 }, 0.5 ); 
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
		
		FlxG.collide(_test_ground, _player);
		FlxG.collide(_test_ground2, _opp_player);
		
		FlxG.collide(_ground.group, _opp_player);
		
		FlxG.collide(_traGroup, _mario,tra_collect);
		
		FlxG.collide(_net.hoopleftPoint, _ball_);
		FlxG.collide(_net.hooprightPoint, _ball_);
		
		//FlxG.collide(_net.hoopleftPoint2, _ball_);
		//FlxG.collide(_net.hooprightPoint2, _ball_);
		
		FlxG.overlap(_net.checkPoint, _ball_, check_point);
		//FlxG.overlap(_net.checkPoint2, _ball_, check_point);
		
		//FlxG.overlap(_testBall.group, _player,ball_collect);
		
		super.update(elapsed);
	}
	
	private function check_point(item:FlxObject, _ball_:FlxObject):Void
	{
		_ball_.kill();
		
		var target:FlxSprite = cast(item, FlxSprite);
		//FlxG.log.add("item id" + target.ID);
		
		if( target.ID ==0) _player_score.score_in(target.ID);
		else _opp_score.score_in(target.ID);
		
		//
		//Main._model.scoreNotify.dispatch(target.ID);
		
		
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
	
	private function mouse_preseed_event(s:Dynamic):Void
	{
		//check mouse and target
		var po:FlxPoint = _shot_icon.scale;
		po.x += 0.03;
		po.y += 0.03;
		if ( po.x >= 5) 
		{
			po.x = 3;
			po.y = 3;
		}
		_shot_icon.scale.set( po.x , po.y );
	}
	
	private function player_shut(s:Dynamic):Void
	{
		_ball_.revive();
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
	
}