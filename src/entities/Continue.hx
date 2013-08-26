package entities;

import com.haxepunk.masks.Hitbox;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.motion.CircularMotion;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Continue extends Entity
{

    //private var motion:CircularMotion;

    public function new(x:Int, y:Int)
    {
        super(x, y);

        type = "continue";

        var img = new Image("gfx/continue.png");
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;
        mask = new Hitbox(100, 200, Math.round(-img.width/2) + 120, Math.round(-img.height/2 - 80));

    }

    public override function update() {
        super.update();
    }
}