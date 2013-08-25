package entities;

import com.haxepunk.utils.Input;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Circle extends Entity
{

    private var cursor:Cursor;

    public function new(x:Int, y:Int, cursor:Cursor)
    {
        super(x, y);

        this.cursor = cursor;

        var img = new Image("gfx/circle.png");
        graphic = img;
        graphic.x = -img.width/2;
        graphic.y = -img.height/2;

    }

    public override function update() {

        this.x += (cursor.x - this.x) / 15;
        this.y += (cursor.y - this.y) / 15;
    }
}