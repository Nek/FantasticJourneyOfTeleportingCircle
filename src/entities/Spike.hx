package entities;

import flash.geom.Point;
import com.haxepunk.masks.Polygon;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Spike extends Entity
{
    private var speed = 250;

    public function new(x:Int, y:Int, speed)
    {
        super(x, y);

        type = "hazard";

        this.speed = speed;

        var img = new Image("gfx/spike.png");
        graphic = img;
        //graphic.x = -img.width/2;
        //graphic.y = -img.height/2;

        mask = new Polygon([new Point(0, 0), new Point(30,0), new Point(15,86)]);
    }

    public override function update() {
        super.update();
        moveBy(0, speed*HXP.elapsed);
    }
}