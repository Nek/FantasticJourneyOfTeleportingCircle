package scenes;

import Types.Hazards;
import Types.Hazard;
import entities.generators.HeadSpikes;
import entities.Spike;
import entities.Circle;
import entities.Cursor;
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

class Level extends Scene
{


    private var hazards: Hazards;

    public function new(hazards:Hazards)
    {

        super();

        this.hazards = hazards;

    }





    public override function begin()
    {

        for (h in hazards) {
            switch(h) {
                case Hazard.HeadSpikes(interv,spd,inc): add(new HeadSpikes(interv, spd, inc));
            }
        }

        var curs =  new Cursor(Math.round(HXP.width/2), Math.round(HXP.height/2));
        add(curs);
        add(new Circle(Math.round(HXP.width/2), Math.round(HXP.height/2), curs));
    }

    public override function update() {
        super.update();

    }

}