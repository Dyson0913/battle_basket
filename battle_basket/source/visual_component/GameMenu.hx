package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

import model.Model;

class GameMenu extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;
	
	public function new() 
	{
		super();
		
		_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.title_bg__jpg);
		add(_bg);
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(appear);
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
}