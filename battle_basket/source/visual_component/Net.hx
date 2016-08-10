package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.addons.display.FlxExtendedSprite;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

import model.Model;
import model.RegularSetting;

import flixel.addons.effects.FlxClothSprite;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Net extends FlxTypedGroup<FlxSprite>
{
	private var _hoop:FlxExtendedSprite;
	//private var _net:FlxClothSprite;
	public var hoopleftPoint:FlxSprite;
	public var hooprightPoint:FlxSprite;
	public var checkPoint:FlxSprite;
	
	private var _hoop2:FlxSprite;
	public var hoopleftPoint2:FlxSprite;
	public var hooprightPoint2:FlxSprite;
	public var checkPoint2:FlxSprite;
	
	private var _hooparr:Array<FlxExtendedSprite>;
	private var _hoopLeftarr:Array<FlxSprite>;
	private var _hoopRighttarr:Array<FlxSprite>;
	private var _check_point_arr:Array<FlxSprite>;
	
	public function new() 
	{
		super();
		
		_hooparr = new Array<FlxExtendedSprite>();
		_hoopLeftarr = new Array<FlxSprite>();
		_hoopRighttarr = new Array<FlxSprite>();
		_check_point_arr = new Array<FlxSprite>();
		
		_hoop = new FlxExtendedSprite(745, 206);
		_hoop.loadGraphic(AssetPaths.hoop__png);
		_hoop.scale.set(0.5, 0.5);
		add(_hoop);
		_hooparr.push(_hoop);
		//RegularSetting.set_debug(_hoop);
		
		
		hoopleftPoint = new FlxSprite(_hoop.x +160, _hoop.y + 215).loadGraphic(AssetPaths.hoopPoint__png);
		hoopleftPoint.scale.set(0.5, 0.5);
		hoopleftPoint.immovable = true;
		add(hoopleftPoint);
		_hoopLeftarr.push(hoopleftPoint);
		
		hooprightPoint = new FlxSprite(_hoop.x +255, _hoop.y + 215).loadGraphic(AssetPaths.hoopPoint__png);
		hooprightPoint.scale.set(0.5, 0.5);
		hooprightPoint.immovable = true;
		add(hooprightPoint);
		_hoopRighttarr.push(hooprightPoint);
		
		checkPoint = new FlxSprite(_hoop.x +215, _hoop.y + 260);
		checkPoint.scale.set(0.5, 0.5);
		add(checkPoint);
		checkPoint.ID = 0;
		_check_point_arr.push(checkPoint);
		//--------------------------------------------
		
		//_hoop2 = new FlxSprite(40, 220).loadGraphic(AssetPaths.hoop__png);
		//_hoop2.scale.set(0.5, 0.5);
		//add(_hoop2);
		//_hooparr.push(_hoop2);
		//
		//hoopleftPoint2 = new FlxSprite(_hoop2.x +160, _hoop2.y + 215).loadGraphic(AssetPaths.hoopPoint__png);
		//hoopleftPoint2.scale.set(0.5, 0.5);
		//hoopleftPoint2.immovable = true;
		//add(hoopleftPoint2);
		//_hoopLeftarr.push(hoopleftPoint2);
		//
		//hooprightPoint2 = new FlxSprite(_hoop2.x +255, _hoop2.y + 215).loadGraphic(AssetPaths.hoopPoint__png);
		//hooprightPoint2.scale.set(0.5, 0.5);
		//hooprightPoint2.immovable = true;
		//add(hooprightPoint2);
		//_hoopRighttarr.push(hooprightPoint2);
		//
		//checkPoint2 = new FlxSprite(_hoop2.x +215, _hoop2.y + 260);
		//checkPoint2.scale.set(0.5, 0.5);
		//add(checkPoint2);
		//checkPoint2.ID = 1;
		//_check_point_arr.push(checkPoint2);
		
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
		
		Main._model.adjust_item.dispatch(_hoop);
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
	public function move_type(type:MoveStyle,idx:Int):Void
	{
		switch (type) {
			
			case MoveStyle.VerticalMove:
				_hooparr[idx].y = 220;
				_hoopLeftarr[idx].y = _hooparr[idx].y + 215;
				_hoopRighttarr[idx].y = _hooparr[idx].y + 215;
				_check_point_arr[idx].y = _hooparr[idx].y + 260;
				vertical_move(idx);
			case MoveStyle.Horizontal:
				_hooparr[idx].y = 290;
				_hoopLeftarr[idx].y = _hooparr[idx].y + 215;
				_hoopRighttarr[idx].y = _hooparr[idx].y + 215;
				_check_point_arr[idx].y = _hooparr[idx].y + 260;
				horizontal_move(idx);
			case MoveStyle.Circle:
				circle_move();
		}
	}
	
	
	public function vertical_move(idx:Int):Void
	{
		FlxTween.tween(_hooparr[idx], { y:_hooparr[idx].y+200  },1, { ease: FlxEase.sineIn ,type: FlxTween.PINGPONG} );
		FlxTween.tween(_hoopLeftarr[idx], { y:_hoopLeftarr[idx].y+200  },1, { ease: FlxEase.sineIn ,type: FlxTween.PINGPONG} );
		FlxTween.tween(_hoopRighttarr[idx], { y:_hoopRighttarr[idx].y+200  },1, { ease: FlxEase.sineIn ,type: FlxTween.PINGPONG} );
		FlxTween.tween(_check_point_arr[idx], { y:_check_point_arr[idx].y + 200  }, 1, { ease: FlxEase.sineIn , type: FlxTween.PINGPONG } );
	}
	
	public function horizontal_move(idx:Int):Void
	{
		FlxTween.tween(_hooparr[idx], { x:_hooparr[idx].x+200  },1, { ease: FlxEase.sineIn ,type: FlxTween.PINGPONG} );
		FlxTween.tween(_hoopLeftarr[idx], { x:_hoopLeftarr[idx].x+200  },1, { ease: FlxEase.sineIn ,type: FlxTween.PINGPONG} );
		FlxTween.tween(_hoopRighttarr[idx], { x:_hoopRighttarr[idx].x + 200  }, 1, { ease: FlxEase.sineIn , type: FlxTween.PINGPONG } );
		FlxTween.tween(_check_point_arr[idx], { x:_check_point_arr[idx].x + 200  }, 1, { ease: FlxEase.sineIn , type: FlxTween.PINGPONG } );
	}
	
	public function circle_move():Void
	{
		
	}
	
	
	
}

enum MoveStyle
{
	VerticalMove; 
	Horizontal; 
	Circle;
}