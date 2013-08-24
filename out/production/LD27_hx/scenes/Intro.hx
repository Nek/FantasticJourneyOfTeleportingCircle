package scenes;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Canvas;
import com.haxepunk.HXP;

class Intro extends Scene
{

    private var tri:Canvas;

 public function new()
 {
    tri = new Canvas(200,200);
    tri.fill(new flash.geom.Rectangle(0,0,200,200),0xff0000);
    tri.x = (HXP.width - tri.width)/2;
    tri.y = (HXP.height - tri.height)/2;
    super();

 }
  
 public override function begin()
 {
    addGraphic(tri);
 }

 public override function update() {
    super.update();
 }

}