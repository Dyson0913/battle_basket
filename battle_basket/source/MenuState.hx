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


import visual_component.GameInput;
import visual_component.GameMenu;


import flixel.addons.weapon.FlxWeapon;


import flixel.FlxObject;
import visual_component.Adjust_tool;

class MenuState extends FlxState
{
	private var _gameMenu:GameMenu;
	private var _gameinput:GameInput;
	
	
	private var _adjust:Adjust_tool;
	
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
		//add(new FlxButton(100, 50, "test", pack_test));
		
		
		add(_adjust);
		//Main._model.adjust_item.dispatch(_groundgroup.getFirstAlive());
		//Main._model.adjust_item.dispatch(_right);
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
		
	}
	
	private function cancel(s:Dynamic):Void
	{
		
	}
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	
	
}