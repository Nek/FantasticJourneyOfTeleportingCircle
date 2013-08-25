package scenes;

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
        add(new Skull(Math.round(HXP.halfWidth), Math.round(HXP.halfHeight)));
    }

    public function nextScene() {
    }

    public override function update() {
        super.update();
    }

}