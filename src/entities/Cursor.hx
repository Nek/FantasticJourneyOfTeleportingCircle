package entities;

import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Cursor extends Entity
{
    public function new(x:Int, y:Int)
    {
        super(x, y);

        var img = new Image("gfx/cursor.png");
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;

    }

    public override function update() {
        this.x = Input.mouseX;
        this.y = Input.mouseY;
    }
}