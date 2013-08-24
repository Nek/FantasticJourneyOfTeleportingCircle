package entities;

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

class Tri extends Entity
{
    private var bitmapData:BitmapData;
    private var canv: Canvas;

    private var w:Int = 200 ;
    private var h:Int = 200;

    private var t:Int = 0;

    private var motion:CircularMotion;

    private function restartMotion(event:Dynamic) {
        motion.start();
    }

    public function new(x:Int, y:Int)
    {
        super(x, y);


        bitmapData = new BitmapData(w, h, true, 0x00ffffff);

        canv = new Canvas(200,200);

        addGraphic(canv);
        canv.x = -canv.width/2;
        canv.y = -canv.height/2;
        canv.fill(new Rectangle(0,0,w,h), 0, 0);



        motion = new CircularMotion(restartMotion);
        motion.setMotion(HXP.width/2, HXP.height/2,30,Math.PI*2,true,10);

        this.addTween(motion);


    }

    public override function update() {
        super.update();


        var triangle:Sprite = new Sprite();
        var noiseBitmapData = new BitmapData(200,200);
        noiseBitmapData.noise(t,0,45,7,true);
        var side = 200;
        triangle.graphics.beginBitmapFill(noiseBitmapData);
        triangle.graphics.moveTo(.5*side,0);
        triangle.graphics.lineTo(1*side,0.8660254037844387*side);
        triangle.graphics.lineTo(0,0.8660254037844387*side);
        triangle.graphics.moveTo(0,0);
        triangle.graphics.endFill();
        triangle.graphics.endFill();

        bitmapData.draw(triangle);

        t += 1;

        canv.draw(0,0,bitmapData);

        motion.update();

        this.x = motion.x;
        this.y = motion.y;
    }

}
