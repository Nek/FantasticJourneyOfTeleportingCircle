package scenes;

import openfl.Assets;
import com.haxepunk.Sfx;
import entities.Plasma;
import entities.Tri;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.HXP;

class Intro extends Scene
{

 public function new()
 {

    super();

 }
  
 public override function begin()
 {
    add(new Plasma(Math.floor(HXP.width/2), Math.floor(HXP.height/2)));
    add(new Tri(Math.floor(HXP.width/2), Math.floor(HXP.height/2)));
    new Sfx(Assets.getSound("sfx/aumloop.mp3")).play(1,0,true);

 }

 public override function update() {
    super.update();
 }

}