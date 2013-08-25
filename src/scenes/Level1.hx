package scenes;

import entities.Spike;
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

    private var spikeAttack:Alarm;
    private var speed = 200;

    public function new()
    {

        super();

    }


    private function addSpike(d:Dynamic) {
        add(new Spike(Math.floor(Math.random()*HXP.width), -90, speed));
        speed += 20;
    }


    public override function begin()
    {


        spikeAttack = new Alarm(.3, addSpike, TweenType.Looping);
        addTween(spikeAttack);
        spikeAttack.start();

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