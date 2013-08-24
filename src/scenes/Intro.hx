package scenes;

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
    add(new Tri(Math.floor(HXP.width/2), Math.floor(HXP.height/2)));
 }

 public override function update() {
    super.update();
 }

}