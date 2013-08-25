package entities;

import flash.geom.Point;
import com.haxepunk.masks.Polygon;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Spike extends Entity
{
    private var speed = 250.0;

    public function new(x:Int, y:Int, speed)
    {
        super(x, y);

        type = "hazard";

        this.speed = speed;

        var img = new Image("gfx/spike.png");
        graphic = img;
        //graphic.x = -img.width/2;
        //graphic.y = -img.height/2;

        mask = new Polygon([new Point(0, 0), new Point(15,0), new Point(15/2,60)]);
    }

    public override function moveCollideY(e:Entity)
    {
        cast(HXP.engine, Main).dead();
        return true;
    }

    public override function moveCollideX(e:Entity) {
        cast(HXP.engine, Main).dead();
        return true;
    }

    public override function update() {
        super.update();
        moveBy(0, speed*HXP.elapsed, "circle");
    }
}