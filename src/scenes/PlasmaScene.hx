package scenes;

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

class PlasmaScene extends Scene
{

    private var octaves = 3;
    private var speedMod = 1/3;

 public function new(octaves, speedMod)
 {

    this.octaves = octaves;
     this.speedMod = speedMod;

    super();

 }



 public override function begin()
 {
     add(new Plasma(Math.floor(HXP.width/2), Math.floor(HXP.height/2), octaves, speedMod));

 }

 public override function update() {
    super.update();
 }

}