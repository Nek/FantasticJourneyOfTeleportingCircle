package entities;

import flash.utils.Function;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.Alarm;
import com.haxepunk.tweens.misc.NumTween;
import openfl.Assets;
import com.haxepunk.graphics.Image;
import flash.geom.ColorTransform;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.display.Graphics;
import flash.geom.Rectangle;
import flash.geom.Vector3D;
import flash.display.BitmapData;
import flash.display.Bitmap;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.tweens.motion.CircularMotion;
import entities.Tri.State;

class Box extends Entity
{



    private var motion:CircularMotion;

    private var fadeIn:NumTween;
    private var wait:Alarm;
    private var fadeOut:NumTween;

    private var hintCB:Dynamic;

    private var hint:Image;

    private var state:State;


    public function showHint(name) {
        state = State.FadeIn;
        hint = new Image(Assets.getBitmapData("gfx/hints/"+name+".png"));
        this.addGraphic(hint);
        hint.alpha = 0;
        hint.y -= 200;
        hint.x += 50;
        fadeIn = new NumTween();
        this.addTween(fadeIn);
        fadeIn.tween(0,1,2);

    }

    public function new(x:Int, y:Int)
    {
        super(x, y);


        var img = new Image("gfx/box.png");
        graphic = img;
        graphic.x -= img.width/2;
        graphic.y -= img.height/2;

        motion = new CircularMotion();
        motion.setMotion(HXP.width/2, HXP.height/2,30,Math.PI*2,false,10);


        this.addTween(motion);

    }

    private var side = 200;

    public override function update() {
        super.update();


        if (state == State.FadeIn) {
            hint.alpha = fadeIn.value;
        }
        if (state == State.FadeOut) {
            hint.alpha = fadeOut.value;
        }

        this.x = motion.x;
        this.y = motion.y;
    }

}
