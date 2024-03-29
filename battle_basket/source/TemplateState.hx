package ;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;

import visual_component.GameInput;
import visual_component.GameMenu;
import visual_component.Adjust_tool;

class TemplateState extends FlxState
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
		
		
		add(_adjust);
		//Main._model.adjust_item.dispatch(_right);
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