package entities.generators;

import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.Alarm;
import flash.geom.Point;
import com.haxepunk.masks.Polygon;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class SpikeAttack extends Entity
{


    private var spikeAttack:Alarm;
    private var speed = 200;
    private var increase = 20;

    public function new(interval, speed, increase)
    {
        super(x, y);


        this.speed = speed;
        this.increase = increase;

        spikeAttack = new Alarm(interval, addSpike, TweenType.Looping);
        addTween(spikeAttack);
        spikeAttack.start();
    }

    private function addSpike(d:Dynamic) {
        scene.add(new Spike(Math.floor(Math.random()*HXP.width), -90, speed));
        speed += increase;
    }

    public override function update() {
        super.update();
    }
}