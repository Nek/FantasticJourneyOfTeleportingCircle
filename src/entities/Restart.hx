package entities;

import com.haxepunk.masks.Hitbox;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.motion.CircularMotion;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Restart extends Entity
{

//private var motion:CircularMotion;

    public function new(x:Int, y:Int)
    {
        super(x, y);

        type = "restart";

        var img = new Image("gfx/restart.png");
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;
        mask = new Hitbox(100, 200, Math.round(-img.width/2) - 30, Math.round(-img.height/2 - 80));

    }


    public override function update() {
        super.update();
        moveBy(0,0,"circle");
    }
}