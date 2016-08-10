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

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import model.Model;

import flixel.input.touch.FlxTouchManager;
import flixel.input.touch.FlxTouch;

class CharSelect extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;
	
	public var group( default, null ):FlxGroup;
	private var char:Array<BtnSprite>;
	private var _pre_select:Int;
	
	private var _comfirm:FlxButton;
	private var _backMenu:FlxButton;
	
	public function new() 
	{
		super();
		
		_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.chatSelect_bg__jpg);
		add(_bg);
		
		char = new Array<BtnSprite>();
		group = new FlxGroup();
		for (i in 0...(5))
		{
			var item:BtnSprite = new BtnSprite(i * (330 + 30) + 60, 80, i, "assets/images/char_" + (i + 1) + ".png", onDown, onUp);
			item.scale.set(0.8, 0.8);
			add(item);
			group.add(item);
			char.push(item);
		}
		_pre_select = -1;
		
		//1610,940
		_backMenu = new FlxButton( 100  ,940, "Back to Menu", backMenu);
		_backMenu.loadGraphic(AssetPaths.MenuButton__png);
		Model.font_format(_backMenu.label, 30);
		_backMenu.scale.set(1.5, 1.5);
		add(_backMenu);
		
		_comfirm = new FlxButton( 1610  ,940, "play", play);
		_comfirm.loadGraphic(AssetPaths.MenuButton__png);
		Model.font_format(_comfirm.label, 30);
		_comfirm.scale.set(1.5, 1.5);
		add(_comfirm);
		
		//event
		Main._model.Menu.add(disappear);
		Main._model.SelectRole.add(appear);
		Main._model.playing.add(disappear);
		Main._model.Settle.add(disappear);
		Main._model.credit.add(disappear);
		
		
		//Main._model.adjust_item.dispatch(group.getFirstAlive());
		//Main._model.adjust_item.dispatch(_singleplayer);
	}
	
	private function appear(s:Dynamic):Void
	{		
		
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		
	}
	
	private function backMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
	
	private function play():Void
	{
		//FlxG.switchState(new PlayState());
		FlxG.switchState(new LevelState());
	}
	
	private function onDown(Sprite:BtnSprite)
	{
		//var st:String = Sprite._name;
		//var r = ~/_1/;		
		//st = r.replace(st, "_2");
		check_select(Sprite._id );
	}
	
	private function check_select(select_idx:Int):Void
	{
		if ( select_idx != _pre_select)
		{
			var click_one:BtnSprite = char[select_idx];
			FlxTween.tween(click_one.scale, { x: 1.05, y:1.05 }, 0.5, { ease: FlxEase.bounceOut } );
			
			if ( _pre_select != -1)
			{
				var pre_select:BtnSprite = char[_pre_select];
				FlxTween.tween(pre_select.scale, { x: 0.8, y:0.8 }, 0.5, { ease: FlxEase.bounceOut } );
			}
			
			_pre_select = select_idx;
			Main._model._char_id = select_idx +1;
		}
	}
	
	private function onUp(Sprite:BtnSprite)
	{
		
	}
	
	override public function update(elapsed:Float):Void
	{
		#if mobile
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed) 
				{ 
					//FlxG.log.add("justPressed ============= ");
				}
				if (touch.pressed) 
				{
					if (touch.overlaps(char[0])) check_select(0);
					else if (touch.overlaps(char[1])) check_select(1);
					else if (touch.overlaps(char[2])) check_select(2);
					else if (touch.overlaps(char[3])) check_select(3);
					else if (touch.overlaps(char[4])) check_select(4);
				}
				if (touch.justReleased) 
				{
					
				}
			}
		#end
		
		super.update(elapsed);
	}
	
	
	
}