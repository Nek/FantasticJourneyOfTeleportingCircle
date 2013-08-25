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

    public function new(x:Int, y:Int, cursor:Cursor)
    {
        super(x, y);

        type = "circle";

        timer = new Alarm(1, secondPassed, TweenType.Looping);
        addTween(timer);
        timer.start();

        this.cursor = cursor;

        var img = Image.createCircle(15);
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;

        mask = new com.haxepunk.masks.Circle(15, Math.round(graphic.x), Math.round(graphic.y));

        text = new Text("10");
        text.size = 24;
        text.color = 0x000000;

        addGraphic(text);

    }

    public override function moveCollideY(e:Entity)
    {
        HXP.scene = new scenes.GameOver();
        return true;
    }

    public override function moveCollideX(e:Entity) {
        HXP.scene = new scenes.GameOver();
        return true;
    }


    public override function update() {

        text.x = -text.textWidth/2+2;
        text.y = -text.textHeight/2+3;

        moveBy((cursor.x - this.x) / 15, (cursor.y - this.y) / 15, "hazard", true);

    }
}