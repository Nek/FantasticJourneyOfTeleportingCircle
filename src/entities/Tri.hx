package entities;

import flash.geom.Rectangle;
import flash.geom.Vector3D;
import flash.display.BitmapData;
import flash.display.Bitmap;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class Tri extends Entity
{
    private var bitmapData:BitmapData;

    private var canv: Canvas;
    private var time: Float;


    private var w:Int = 200 ;
    private var h:Int = 200;
    private var m:Int = 8; // maze size
    private var waveSize:Float = 2.5;

    private var tt:Float = 0;
    private var lt:Array<Float>; // lookup table
    private var colorList:Array<Int>;
    private var colorLength:Int;
    private var lookupDens:Int = 1000;

    private function createLookup()
    {
        lt = [];
        colorList =  [0x0000FF,0x0000EE,0x0000DD,0x0000CC,0x0000BB,0x0000AA,0x000099,0x000088,0x000077,0x000066,0x000055,0x000044,0x000033,0x000022,0x000011,0x000000,0x110000,0x220000,0x330000, 0x440000, 0x550000,0x660000, 0x770000,0x880000,0x990000, 0xAA0000,0xBB0000, 0xCC0000,0xDD0000,0xEE0000, 0xFF0000];
        colorLength = colorList.length;
        ms2 = Std.int(lookupDens*.5);
        v1 = new Vector3D(0, 0);
        v2 = new Vector3D(0, 0);

        var chunk:Float = (Math.PI) / lookupDens;

        for (i in 0...lookupDens )
        {
            // make sinus move between 0 and 1;
            var s = Math.sin(Math.PI) + Math.sin(chunk * i);
            if (s > 1) { s = 1; }
            if (s < 0) { s = 0; }

            lt.push(s);
        }

    }

    private var ty:Int;
    private function animate()
    {

        var ty = 0;
        do {
            drawLine(ty);
            ty+=m;
        } while( ty < h );
    }

    private var ms1:Float = 0;
    private var ms2:Float;
    private var v1:Vector3D;
    private var v2:Vector3D;
    private var dist:Vector3D;
    private var xpr:Float;
    private var ypr:Float;
    private var s:Float;
    private var s2:Float;
    private var tx:Int;
    private var sGem:Float;
    private var colNum:Int;

    private function drawLine(ypos:Float)
    {
        ms1 += .015;
        ms2 += .008;

        tt += .06;

        var tx = 0;
        do
        {

            xpr = getSinus(ms1);
            ypr = getSinus(ms2);

            v1.x = (w*xpr)+(10*getSinus(ms1));
            v1.y = (h*ypr)+(10*getSinus(ms2));

            v2.x = tx;
            v2.y = ypos;

            dist = v2.subtract(v1);

            s = getSinus(Std.int((dist.length) * waveSize));
            s2 = 1.0-(getSinus(Std.int((tx+tt) * waveSize)));

            sGem = (s - s2);
            if (sGem < 0) { sGem = 0; }

            colNum = Std.int(colorLength * sGem);

            bitmapData.fillRect(new Rectangle(tx, ypos, m, m), colorList[colNum]);

            tx+=m;
        } while (tx < w);
    }

    private function getSinus(angle:Float):Float
    {
        var modAngle = Std.int(angle) % lookupDens;

        return lt[modAngle];
    }

    public function new(x:Int, y:Int)
    {
        super(x, y);

        createLookup();

        bitmapData = new BitmapData(w, h, false, 0x0);

        canv = new Canvas(200,200);

        addGraphic(canv);
        canv.x = -canv.width/2;
        canv.y = -canv.height/2;



    }

    public override function update() {
        super.update();

        animate();

        canv.draw(0,0,bitmapData);
    }

}
