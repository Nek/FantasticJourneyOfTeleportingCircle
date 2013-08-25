package scenes;

import entities.Restart;
import entities.Continue;
import Math;
import entities.Skull;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import entities.Circle;
import entities.Cursor;
import com.haxepunk.Tween;
import com.haxepunk.tweens.misc.Alarm;
import com.haxepunk.tweens.misc.NumTween;
import openfl.Assets;
import com.haxepunk.Sfx;
import entities.Plasma;
import entities.Tri;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.HXP;

class GameOver extends PlasmaScene
{

    public function new()
    {

        super(3,1/3);

    }

    public override function begin()
    {
        super.begin();
        add(new Skull(Math.round(HXP.halfWidth), Math.round(HXP.halfHeight) - 50));
        add(new Continue(100,340));
        add(new Restart(540,340));
        var curs =  new Cursor(Math.round(HXP.width/2), Math.round(HXP.height/2));
        var circle:Circle = new Circle(Math.round(HXP.width/2), Math.round(HXP.height/2), curs, false);
        add(curs);
        add(circle);
    }

    public function nextScene() {
    }

    public override function update() {
        super.update();
    }

}