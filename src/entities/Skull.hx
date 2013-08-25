package entities;

import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.motion.CircularMotion;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Skull extends Entity
{

    private var motion:CircularMotion;

    public function new(x:Int, y:Int)
    {
        super(x, y);

        var img = new Image("gfx/skull.png");
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;

        motion = new CircularMotion(null, TweenType.Looping);
        motion.setMotion(HXP.width/2, HXP.height/2,30,Math.PI*2,false,10);


        this.addTween(motion);


    }

    public override function update() {
        //this.x = Input.mouseX;
        //this.y = Input.mouseY;
        this.x = motion.x;
        this.y = motion.y;
    }
}