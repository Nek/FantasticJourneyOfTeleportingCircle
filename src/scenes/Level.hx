package scenes;

import entities.generators.SmartSaws;
import entities.generators.AnnoSaws;
import entities.generators.CenterSaws;
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

        var curs =  new Cursor(Math.round(HXP.width/2), Math.round(HXP.height/2));
        var circle:Circle = new Circle(Math.round(HXP.width/2), Math.round(HXP.height/2), curs);

        for (h in hazards) {
            switch(h) {
                case Hazard.HeadSpikes(interv,spd,inc): add(new HeadSpikes(interv, spd, inc));
                case Hazard.CenterSaws(interv,spd,inc): add(new CenterSaws(interv, spd, inc, circle));
                case Hazard.SmartSaws(interv,spd,inc): add(new SmartSaws(interv, spd, inc, circle));
                case Hazard.AnnoSaws(interv,spd,inc): add(new AnnoSaws(interv, spd, inc, circle));
            }
        }

        add(curs);
        add(circle);
    }

    public override function update() {
        super.update();

    }

}