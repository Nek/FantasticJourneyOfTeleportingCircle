package scenes;

import entities.Box;
import com.haxepunk.Tween;
import com.haxepunk.tweens.misc.Alarm;
import com.haxepunk.tweens.misc.NumTween;
import openfl.Assets;
import com.haxepunk.Sfx;
import entities.Plasma;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.HXP;

class GameWon extends PlasmaScene
{

    private var hint: String;
    private var sound: String;

 public function new()
 {

    this.hint = "heart";
    this.sound = "aumloop";

    super(2,1/5,false);

 }

    private var box:Box;
    private var sfx:Sfx;

 public override function begin()
 {
    super.begin();
     box = new Box(Math.floor(HXP.width/2), Math.floor(HXP.height/2));
     add(box);
     sfx = new Sfx(Assets.getSound("sfx/" + sound + ".mp3"));
     sfx.play(1,0,true);
     box.showHint(hint);

 }



 public function nextScene() {
     sfx.stop();
     cast(HXP.engine, Main).nextScreen();
 }

 public override function update() {
    super.update();
 }

}