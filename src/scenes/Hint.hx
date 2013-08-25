package scenes;

import entities.Cursor;
import entities.Circle;
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

class Hint extends PlasmaScene
{

    private var hint: String;
    private var sound: String;

 public function new(hint:String, sound: String)
 {

    this.hint = hint;
    this.sound = sound;

    super(3,1/5);

 }


    private var tri:Tri;
    private var sfx:Sfx;

 public override function begin()
 {
    super.begin();
     tri = new Tri(Math.floor(HXP.width/2), Math.floor(HXP.height/2));
     add(tri);
     sfx = new Sfx(Assets.getSound("sfx/" + sound + ".mp3"));
     sfx.play(1,0,true);
     tri.showHint(hint, nextScene.bind());

     var curs =  new Cursor(Math.round(HXP.width/2), Math.round(HXP.height/2));
     var circle:Circle = new Circle(Math.round(HXP.width/2), Math.round(HXP.height/2), curs, false);
     add(curs);
     add(circle);

 }



 public function nextScene() {
     sfx.stop();
     cast(HXP.engine, Main).nextScreen();
 }

 public override function update() {
    super.update();
 }

}