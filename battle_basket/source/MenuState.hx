package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.scaleModes.RelativeScaleMode;
import flixel.system.scaleModes.RatioScaleMode;
import flixel.system.scaleModes.FillScaleMode;

class MenuState extends FlxState
{
	private var _credit_bg:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		
		_credit_bg = new FlxSprite(0,0).loadGraphic(AssetPaths.title_bg__jpg);
		add(_credit_bg);
		
		
		add(new FlxButton(100, 50, "test", pack_test));
		
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
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}