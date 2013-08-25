package entities;

import com.haxepunk.graphics.Text;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.Alarm;
import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Circle extends Entity
{

    private var cursor:Cursor;
    private var timer:Alarm;
    private var time = 0;

    private function secondPassed(d:Dynamic) {
        time += 1;
        if (time <= 10) text.text = "0"+Std.string(10 - time);
        if (time == 10) {
            cast(HXP.engine, Main).nextScreen();
        }
    }

    private var text:Text;
    private var teleport:Bool;

    public var speed = 10.0;

    public function new(x:Int, y:Int, cursor:Cursor, ?teleport = true)
    {
        super(x, y);
        this.teleport = teleport;

        type = "circle";

        timer = new Alarm(1, secondPassed, TweenType.Looping);
        addTween(timer);
        if (teleport) timer.start();

        this.cursor = cursor;

        var img = Image.createCircle(15);
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;

        mask = new com.haxepunk.masks.Circle(15, Math.round(graphic.x), Math.round(graphic.y));

        if (teleport) {
        text = new Text("10");
        text.size = 18;
        text.color = 0x000000;

        addGraphic(text);
        }
    }

    public override function moveCollideY(e:Entity)
    {
        switch(e.type) {
            case "hazard": cast(HXP.engine, Main).dead();
            case "continue": cast(HXP.engine, Main).cont();
            case "restart": cast(HXP.engine, Main).rest();
        }

        return true;
    }

    public override function moveCollideX(e:Entity) {
        switch(e.type) {
            case "hazard": cast(HXP.engine, Main).dead();
            case "continue": cast(HXP.engine, Main).cont();
            case "restart": cast(HXP.engine, Main).rest();
        }
        return true;
    }


    public override function update() {

    if (teleport) {
        text.x = -text.textWidth/2+2;
        text.y = -text.textHeight/2+3;
    }
        moveBy((cursor.x - this.x) / speed, (cursor.y - this.y) / speed, ["hazard","continue","restart"], true);

    }
}