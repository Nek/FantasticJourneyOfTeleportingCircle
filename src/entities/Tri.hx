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

enum State {
    Init;
    FadeIn;
    FadeOut;
    Wait;
}

class Tri extends Entity
{
    private var bitmapData:BitmapData;
    private var canv: Canvas;

    private var w:Int = 200 ;
    private var h:Int = 200;

    private var t:Int = 0;

    private var motion:CircularMotion;

    private var fadeIn:NumTween;
    private var wait:Alarm;
    private var fadeOut:NumTween;

    private var hintCB:Dynamic;

    private var hint:Image;

    private var state:State;

    private function restartMotion(event:Dynamic) {
        motion.start();
    }

    private var triangle:Sprite;
    private var noiseBitmapData:BitmapData;


    public function showHint(name, ?complete:Dynamic) {
        state = State.FadeIn;
        if (complete) hintCB = complete;
        else hintCB = null;
        hint = new Image(Assets.getBitmapData("gfx/hints/"+name+".png"));
        this.addGraphic(hint);
        hint.alpha = 0;
        hint.y -= 200;
        fadeIn = new NumTween(waitABit);
        this.addTween(fadeIn);
        fadeIn.tween(0,1,2);

    }

    private function waitABit(d:Dynamic) {
        state = State.Wait;
        wait = new Alarm(3.0,hideHint,TweenType.OneShot);
        this.addTween(wait);
        wait.start();
    }

    private function hideHint(d:Dynamic) {
        state = State.FadeOut;
        fadeOut = new NumTween(hintEnd);
        fadeOut.tween(1,0,2);
        this.addTween(fadeOut);
    }

    private function hintEnd(d:Dynamic) {
        state = State.Init;
        if (hintCB != null) {
            hintCB();
        }
    }

    public function new(x:Int, y:Int)
    {
        super(x, y);

        triangle = new Sprite();

        noiseBitmapData = new BitmapData(200,200);

        bitmapData = new BitmapData(w, h, true, 0x00ffffff);

        canv = new Canvas(200,200);

        addGraphic(canv);
        canv.x = -canv.width/2;
        canv.y = -canv.height/2;
        canv.fill(new Rectangle(0,0,w,h), 0, 0);


        motion = new CircularMotion(restartMotion);
        motion.setMotion(HXP.width/2, HXP.height/2,30,Math.PI*2,false,10);


        this.addTween(motion);

    }

    private var side = 200;

    public override function update() {
        super.update();

        noiseBitmapData.noise(t,0,45,7,true);
        triangle.graphics.clear();
        triangle.graphics.beginBitmapFill(noiseBitmapData);
        triangle.graphics.moveTo(.5*side,0);
        triangle.graphics.lineTo(1*side,0.8660254037844387*side);
        triangle.graphics.lineTo(0,0.8660254037844387*side);
        triangle.graphics.moveTo(0,0);
        triangle.graphics.endFill();

        bitmapData.draw(triangle);

        t += 1;

        canv.draw(0,0,bitmapData);

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
