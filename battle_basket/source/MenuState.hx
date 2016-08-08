package ;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;

import visual_component.GameInput;
import visual_component.GameMenu;
import visual_component.Adjust_tool;

import flixel.util.FlxSpriteUtil;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class MenuState extends FlxState
{
	private var _gameMenu:GameMenu;
	private var _gameinput:GameInput;
	
	private var _adjust:Adjust_tool;
	
	private var scr:FlxSprite;
	private var scr2:FlxSprite;
	private var mark:FlxSprite;
	private var after:FlxSprite;
	
	private var slotframe:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		_adjust = new Adjust_tool();
		
		_gameMenu = new GameMenu();
		add(_gameMenu);
		
		_gameinput = new GameInput();
		add(_gameinput);
		
		_gameinput.mouse_pressed.add(comfirm);
		_gameinput.A.add(comfirm);
		
		_gameinput.left.add(left);
		_gameinput.right.add(right);
		_gameinput.up.add(up);
		
		_gameinput.left_release.add(cancel);
		_gameinput.right_release.add(cancel);
		_gameinput.up_release.add(cancel);
		
		
		Main._model.Menu.dispatch(1);
		
		//scr = new FlxSprite(350, 370);
		//scr.loadGraphic(AssetPaths.spritesheet__png, true, 141, 140);
		//scr.animation.frameIndex = 5;
		//add(scr);
		//
		//scr2 = new FlxSprite(350, 510);
		//scr2.loadGraphic(AssetPaths.spritesheet__png, true, 141, 140);
		//scr2.animation.frameIndex = 6;
		//add(scr2);
		
		//slotframe = new FlxSprite(100, 240,AssetPaths.slotFrame__png);
		//add(slotframe);
		
		//mark = new FlxSprite(0, 0, AssetPaths.mask2__png);
		//after = new FlxSprite(0, 0);
		//FlxSpriteUtil.alphaMaskFlxSprite(scr, mark ,after);
		//add(after);
		
		//add(_adjust);
		//Main._model.adjust_item.dispatch(scr);
	}
	
	private function left(s:Dynamic):Void
	{
		
	}
	
	private function right(s:Dynamic):Void
	{
		
	}
	
	private function up(s:Dynamic):Void
	{
		
	}
	
	private function comfirm(s:Dynamic):Void
	{
		//FlxG.log.add("comfir");
		
		
		//FlxTween.tween(scr, { y: scr.y +140 }, 1, { ease: FlxEase.backInOut } );
		//FlxTween.tween(scr2, { y: scr2.y +140 }, 1, { ease: FlxEase.backInOut } );
	}
	
	private function cancel(s:Dynamic):Void
	{
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}