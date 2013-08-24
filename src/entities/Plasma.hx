package entities;

import flash.geom.Rectangle;
import flash.geom.Vector3D;
import flash.display.BitmapData;
import flash.display.Bitmap;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class Plasma extends Entity
{
    private var bitmapData:BitmapData;

    private var canv: Canvas;
    private var time: Float;


    private var w:Int = 640;
    private var h:Int = 480;
    private var m:Int = 10; // maze size
    private var waveSize:Float = 2.5;

    private var tt:Float = 0;
    private var lt:Array<Float>; // lookup table
    private var colorList:Array<Int>;
    private var colorLength:Int;
    private var lookupDens:Int = 800;

    private function rgb(r,g,b):UInt {
        return ( ( r << 16 ) | ( g << 8 ) | b );
    }

    private function createLookup()
    {
        lt = [];
        colorList = [];
        for (i in 0...64) {
            colorList[i] = rgb(255, i*4, 255 - (i * 4));
            colorList[i + 64] = rgb(255 - (i * 4), 255, i*4);
            colorList[i + 128] = rgb(0, 255 - (i * 4), 255);
            colorList[i + 192] = rgb(i*4, 0, 255);
        }

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

        canv = new Canvas(w,h);

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
