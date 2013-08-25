package entities.generators;

import entities.AnnoSaw;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.Alarm;
import flash.geom.Point;
import com.haxepunk.masks.Polygon;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Friends extends Entity
{

    private var addInterval:Alarm;
    private var speed = 200.0;
    private var circle:Circle;
    private var count:Int;

    public function new(interval, speed, count, circle)
    {
        super(x, y);

        this.speed = speed;
        this.circle = circle;
        this.count = count;

        addInterval = new Alarm(interval, addFriend, TweenType.Looping);
        addTween(addInterval);
        addInterval.start();
    }

    private function addFriend(d:Dynamic) {

        var a = Math.random()*Math.PI*2;
        var x = Math.floor(360 * Math.cos(a))+320;
        var y = Math.floor(360 * Math.sin(a))+240;
        scene.add(new Friend(x,y,speed,circle));
        count -= 1;
        if (count == 0) removeTween(addInterval);
    }

    public override function update() {
        super.update();
    }
}