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
	private var _go_right:Bool;
	private var _go_left:Bool;
	
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
		_go_right = false;
		_go_left = false;
	}
	
	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		
		#if mobile
			if (_go_right) turn_right();
			if (_go_left) turn_left();
		#end
		
		#if (flash || js)
			if (FlxG.keys.pressed.LEFT)
			{
				//facing = FlxObject.LEFT;
				//velocity.x -= 300;
				turn_left();
			}
			
			if (FlxG.keys.pressed.RIGHT)
			{
				//facing = FlxObject.RIGHT;
				//velocity.x += 300;
				turn_right();
			}
			
			if (isTouching(FlxObject.FLOOR) && FlxG.keys.pressed.UP)
			{
				velocity.y = -500;
			}
		#end
	
		if ( !isTouching(FlxObject.FLOOR))
		{
			animation.play("jump");
		}
		else
		{
			if (velocity.x == 0) animation.play("idle");
			else animation.play("walk");
		}
	
		
		super.update(elapsed);
	}
	
	public function go_right(val:Bool):Void
	{
		_go_right = val;
	}
	
	public function go_left(val:Bool):Void
	{
		_go_left = val;
	}
	
	public function turn_left():Void
	{
		facing = FlxObject.LEFT;
		this.velocity.x -= 300;
		//FlxG.log.add("turn_left  ============= " + velocity.x);
		
	}
	
	public function turn_right():Void
	{
		facing = FlxObject.RIGHT;
		this.velocity.x += 300;
		//FlxG.log.add("turn_right  ============= " + velocity.x);
		
	}
	
	public function jump():Void
	{
		if (isTouching(FlxObject.FLOOR))
		{
			velocity.y = -300;
		}
	}
	
	override public function destroy():Void 
	{
		// Make sure that this object is removed from the MouseEventManager for GC
		super.destroy();
	}
}