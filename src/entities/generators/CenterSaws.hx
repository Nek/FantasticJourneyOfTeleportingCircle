package entities.generators;

import entities.CenterSaw;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.Alarm;
import flash.geom.Point;
import com.haxepunk.masks.Polygon;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class CenterSaws extends Entity
{


    private var spikeAttack:Alarm;
    private var speed = 200.0;
    private var increase = 20.0;
    private var circle:Circle;

    public function new(interval, speed, increase, circle)
    {
        super(x, y);


        this.speed = speed;
        this.increase = increase;
        this.circle = circle;

        spikeAttack = new Alarm(interval, addSaw, TweenType.Looping);
        addTween(spikeAttack);
        spikeAttack.start();
    }

    private function addSaw(d:Dynamic) {
        var a = Math.random()*Math.PI*2;
        var x = Math.floor(360 * Math.cos(a))+320;
        var y = Math.floor(360 * Math.sin(a))+240;
        scene.add(new CenterSaw(x,y,speed,circle));
        speed += increase;
    }

    public override function update() {
        super.update();
    }
}