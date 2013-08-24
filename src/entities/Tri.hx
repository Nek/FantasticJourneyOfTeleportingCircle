package entities;

import flash.display.BitmapData;
import flash.display.Bitmap;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class Tri extends Entity
{
    private var plasma: BitmapData;
    private var canv: Canvas;
    private var time: Float;

    public function new(x:Int, y:Int)
    {
        super(x, y);

        time = 0;

        plasma = new BitmapData(200,200,false,0x00FF00FF) ;

        canv = new Canvas(200,200);


        addGraphic(canv);
        canv.x = -canv.width/2;
        canv.y = -canv.height/2;



    }

    public override function update() {
        super.update();

        for ( x in 0...200) {
            for ( y in 0...200) {
                plasma.setPixel(x,y, calcPlasma(x,y,time));
            }
        }

        time += 1;

        canv.draw(0,0,plasma);
    }

    private function calcPlasma(x,y,time:Float):UInt {
        var dist = HXP.distance;
        var v = Math.sin(dist(x + time, y, 128.0, 128.0) / 8.0) + Math.sin(dist(x, y, 64.0, 64.0) / 8.0) + Math.sin(dist(x, y  , 192.0, 64) / 7.0) + Math.sin(dist(x, y+ time/ 7, 192.0, 100.0) / 8.0);
        return Std.int(4 + v) * 32;
    }

}
