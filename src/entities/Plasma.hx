package entities;

import flash.geom.ColorTransform;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.geom.Vector3D;
import flash.display.BitmapData;
import flash.display.Bitmap;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class Plasma extends Entity
{

    private var canv: Canvas;
    private var w = 640;
    private var h = 480;
    private var t = 0;

    public function new(x:Int, y:Int)
    {
        super(x, y);

        canv = new Canvas(w,h);

        addGraphic(canv);
        canv.x = -canv.width/2;
        canv.y = -canv.height/2;

        initPlasma();

    }

    public override function update() {
        super.update();


        if (t == 0) {
            updatePlasma();
            canv.draw(0,0,canvas);
        }

        t += 1;
        t = t % 4;
    }

    private var canvas:BitmapData;
    private var random:Int = 0;
    private var palette_r:Array<Int>;
    private var palette_g:Array<Int>;
    private var palette_b:Array<Int>;
    private var PointArrayA:Array<Point>;
    private var PointArrayB:Array<Point>;
    private function initPlasma() {
        ct = new ColorTransform (1.7, 1.7, 1.7, 1, -100, -100, -100);
        palette_r = [];
        palette_g = [];
        palette_b = [];
        var x:Int, y:Int;
        for( x in 0...256) {
            palette_r [x] = 0x100000 * Std.int(128.0 + 128 * Math.sin(3.1415 * x / 32.0));
            palette_g [x] =   0x100 * Std.int(128.0 + 128 * Math.sin(3.1415 * x / 128.0));
            palette_b [x] =     0x1 * Std.int(128.0 + 128 * Math.sin(3.1415 * x / 1.0));
        }


//        for (i in 0...64) {
//            palette_r [i] = 255;
//            palette_g [i] = i * 4;
//            palette_b [i] = 255 - (i * 4);
//
//            palette_r [i + 64] = 255 - (i * 4);
//            palette_g [i + 64] = 255;
//            palette_b [i + 64] = i * 4;
//
//            palette_r [i + 128] = 0;
//            palette_g [i + 128] = 255 - (i * 4);
//            palette_b [i + 128] = 255;
//
//            palette_r [i + 192] = i * 4;
//            palette_g [i + 192] = 0;
//            palette_b [i + 192] = 255;
//        }


        PointArrayA = [];
        PointArrayB = [];
        for (i in 0...3) {
            PointArrayA[i] = new Point(Math.random() * w,Math.random() * h);
            PointArrayB[i] = new Point(Math.random() * 10 - 5, Math.random() * 10 - 5);
        }
        canvas = new BitmapData(w, h, false, 0x00FF0000);
    }
    private var ct:ColorTransform;
    private function updatePlasma() {
//random = Math.random() * 10000
        var i:Int = 0;
        while (i < 3) {
            PointArrayA[i].x = PointArrayA[i].x + PointArrayB[i].x;
            PointArrayA[i].y = PointArrayA[i].y + PointArrayB[i].y;
            ++i;
        }
        canvas.perlinNoise(w, h, 3  /* +Std.int (mouseX / 100)*/, random, false, true, 1, false, PointArrayA);
        canvas.copyChannel (canvas, canvas.rect, canvas.rect.topLeft, 1, 2);
        canvas.copyChannel (canvas, canvas.rect, canvas.rect.topLeft, 1, 4);
        canvas.colorTransform (canvas.rect, ct);

        canvas.paletteMap(canvas, canvas.rect, canvas.rect.topLeft, palette_r, palette_g, palette_b);
        var shift : Int = 0;
        while (shift -- > 0) {
            palette_r.push (palette_r.shift ());
            palette_g.push (palette_g.shift ());
            palette_b.push (palette_b.shift ());
        }
    }

}
