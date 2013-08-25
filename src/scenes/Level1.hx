package scenes;

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

class Level1 extends Scene
{

    public function new()
    {

        super();

    }



    public override function begin()
    {

    var curs =  new Cursor(Math.round(HXP.width/2), Math.round(HXP.height/2));
        add(curs);
        add(new Circle(Math.round(HXP.width/2), Math.round(HXP.height/2), curs));
    }



    public function nextScene() {
    }

    public override function update() {
        super.update();
    }

}