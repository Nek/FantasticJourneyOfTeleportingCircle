package entities;

import com.haxepunk.masks.Hitbox;
import flash.geom.Point;
import com.haxepunk.masks.Polygon;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class AnnoSaw extends Entity
{
    private var speed = 250.0;
    private var target:Circle;
    private var speedX:Float;
    private var speedY:Float;

    public function new(x:Int, y:Int, speed,circle:Circle)
    {
        super(x, y);

        type = "hazard";

        this.target = circle;

        this.speed = speed;



        var img = new Image("gfx/asaw.png");
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;

        mask = new Hitbox(36, 36, -18, -18);

        var a = Math.atan2(240-y, 320-x);

        speedX = speed*Math.cos(a);
        speedY = speed*Math.sin(a);

    }

    public override function update() {
        super.update();
        if (x > width/2 && x < HXP.width-width/2 && y > height/2 && y < HXP.height - height/2) {
            if (x + speedX*HXP.elapsed > HXP.width - width/2 || x + speedX*HXP.elapsed < width/2) speedX = -speedX;
            if (y + speedY*HXP.elapsed > HXP.height - height/2 || y + speedY*HXP.elapsed < height/2) speedY = -speedY;
        }
        moveBy(speedX*HXP.elapsed, speedY*HXP.elapsed);


//        moveTowards(target.x, target.y, speed*HXP.elapsed);
    }
}