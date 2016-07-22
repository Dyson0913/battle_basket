package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import flixel.graphics.FlxGraphic;
import flixel.system.FlxAssets.FlxGraphicAsset;

import flixel.FlxG;

/**
 * ...
 * @author Dyson0913
 */
class Sprite extends FlxSprite
{
	
	public function new(X:Float=0, Y:Float=0,Graphic:FlxGraphicAsset,Width:Int = 0, Height:Int = 0) 
	{
		super(X, Y);
		//makeGraphic(16, 16, FlxColor.BLUE);
		var graph:FlxGraphic = FlxG.bitmap.add(Graphic);
		loadGraphic(Graphic, true, Width, Height);
		
		//loadGraphic(AssetPaths.Card__png, true, 194, 194);
		
		//tween to idx animation.frameIndex = 1;
		animation.frameIndex = 0;
		animation.add("idle", [11]);
		animation.add("jump", [2]);
		animation.add("walk", [9, 10, 11]);
		
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		
		//antialiasing = true;
		acceleration.y = 980;
	}
	
	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		#if cpp
		
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed) {}
			if (touch.pressed) {}
			if (touch.justReleased) {}
		}
		#end
		
	#if (flash || js)
		if (FlxG.keys.pressed.LEFT)
		{
			facing = FlxObject.LEFT;
			velocity.x -= 300;
		}
		
		if (FlxG.keys.pressed.RIGHT)
		{
			facing = FlxObject.RIGHT;
			velocity.x += 300;
		}
		
		if (isTouching(FlxObject.FLOOR) && FlxG.keys.pressed.UP)
		{
			velocity.y = -300;
		}
		
		if ( !isTouching(FlxObject.FLOOR))
		{
			animation.play("jump");
		}
		else
		{
			if (velocity.x == 0) animation.play("idle");
			else animation.play("walk");
		}
	#end
		
		super.update(elapsed);
	}
	
	override public function destroy():Void 
	{
		// Make sure that this object is removed from the MouseEventManager for GC
		super.destroy();
	}
}