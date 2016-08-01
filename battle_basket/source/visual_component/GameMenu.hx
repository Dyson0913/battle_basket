package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flash.text.Font;
import flash.text.TextFormat;
import flixel.addons.transition.TransitionData;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import option.CharSelectState;
import option.CreditState;

import model.Model;
import flixel.addons.transition.Transition;

class GameMenu extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;
	
	private var _singleplayer:FlxButton;
	private var _multiplayer:FlxButton;
	private var _credit:FlxButton;
	
	private var _text:FlxText;
	
	public function new() 
	{
		super();
		
		_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.title_bg__jpg);
		add(_bg);
		
		
		_singleplayer = new FlxButton( 330  ,760, "singleplayer", singlplayer);
		_multiplayer = new FlxButton( 840  , 760, "multiplayer", multiplayer);
		_credit = new FlxButton( 1310 , 760, "credit", credit);
		
		_singleplayer.loadGraphic(AssetPaths.MenuButton__png);
		Model.font_format(_singleplayer.label, 35);
		_singleplayer.scale.set(1.5, 1.5);
		
		_multiplayer.loadGraphic(AssetPaths.MenuButton__png);
		_multiplayer.scale.set(1.5, 1.5);
		Model.font_format(_multiplayer.label, 35);
		
		_credit.loadGraphic(AssetPaths.MenuButton__png);
		_credit.scale.set(1.5, 1.5);
		Model.font_format(_credit.label, 35);
		
		add(_singleplayer);
		add(_multiplayer);
		add(_credit);

		//#if mobile
			//_text = new FlxText(20, 20,500, "1234567890AbCdEfGh 看看：中文显示是否正常！m(^_*)$", 8, true);
			//_text.setFormat("/system/fonts/DroidSansFallback.ttf", 50, 0xFF0000);
			//add(_text);
		//#end
		
		
		//event
		Main._model.Menu.add(appear);
		Main._model.SelectRole.add(disappear);
		Main._model.playing.add(disappear);
		Main._model.Settle.add(disappear);
		Main._model.credit.add(disappear);
		
		Main._model.adjust_item.dispatch(_credit);
	}
	
	private function appear(s:Dynamic):Void
	{		
		_bg.revive();
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_bg.kill();
	}
	
	private function singlplayer():Void
	{
		var fanin:TransitionData = new TransitionData(TransitionType.FADE, FlxColor.BLACK, 1.5,new FlxPoint(1,0));
		var fanout:TransitionData = new TransitionData(TransitionType.FADE, FlxColor.BLACK, 1.5,new FlxPoint(1,0));
		
		FlxG.switchState(new CharSelectState(fanin, fanout));
		//FlxG.switchState(new PlayState());
	}
	
	private function multiplayer():Void
	{
		
	}
	
	private function credit():Void
	{
		var fanin:TransitionData = new TransitionData(TransitionType.FADE, FlxColor.BLACK, 1.5,new FlxPoint(1,0));
		var fanout:TransitionData = new TransitionData(TransitionType.FADE, FlxColor.BLACK, 1.5,new FlxPoint(1,0));
		
		FlxG.switchState(new CreditState(fanin,fanout));
	}
	
}