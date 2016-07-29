package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

import model.Model;

class CreditList extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;
	
	private var _programer:FlxText;
	
	private var _singleplayer:FlxButton;
	private var _multiplayer:FlxButton;
	private var _credit:FlxButton;
	
	public function new() 
	{
		super();
		
		_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.credit_bg__jpg);
		add(_bg);
		
		_programer = new FlxText(670, 310, 700, "Director: Dyson0913\n art Director: TBA", 30, true);	
		Model.font_format(_programer,50, FlxColor.WHITE,"left");		
		add(_programer);
		
		
		_singleplayer = new FlxButton( 840  ,760, "Back to Menu", singlplayer);
		_singleplayer.loadGraphic(AssetPaths.MenuButton__png);
		Model.font_format(_singleplayer.label, 30);
		_singleplayer.scale.set(1.5, 1.5);
		add(_singleplayer);
		
		
		//event
		Main._model.Menu.add(disappear);
		Main._model.SelectRole.add(disappear);
		Main._model.playing.add(disappear);
		Main._model.Settle.add(disappear);
		Main._model.credit.add(appear);
		
		Main._model.adjust_item.dispatch(_programer);
	}
	
	private function appear(s:Dynamic):Void
	{		
		_programer.revive();
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_programer.kill();
	}
	
	private function singlplayer():Void
	{
		FlxG.switchState(new MenuState());
	}
	
	private function credit():Void
	{
		
	}
	
}