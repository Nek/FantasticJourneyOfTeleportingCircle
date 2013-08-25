import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{

    private var level = 0;

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		HXP.scene = new scenes.Level1();
	}

    public function nextLevel() {
        HXP.scene = new scenes.Intro();
    }

	public static function main() { new Main(); }

}