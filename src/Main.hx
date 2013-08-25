import scenes.GameOver;
import scenes.GameWon;
import scenes.Level;
import scenes.Hint;
import com.haxepunk.Engine;
import com.haxepunk.HXP;
import Types;

class Main extends Engine
{

    private var curr = 0;
    private var screens:Array<Screen>;

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
        screens = [
//            Hint("01mouse","aumloop"),
//            Level([])
//            Hint("02headspike","aumloop"),
//            Level([HeadSpikes(.2,150,10)]), // 1
//            Level([CenterSaws(.2,100,0)]), // 2
//            Level([SmartSaws(.2,100,0)]), // 3
//            Level([AnnoSaws(.4,200,0)]), // 4
//            Level([CenterSaws(.2,150,0), HeadSpikes(.4,50 ,10)]), // 5

//                GameOver,
            GameWon
        ];

		startScreen(screens[curr]);
	}

    public function dead() {
        HXP.scene = new GameOver();
    }

    public function nextScreen() {
        curr += 1;
        startScreen(screens[curr]);
    }


    public function cont() {
        startScreen(screens[curr]);
    }

    public function rest() {
        curr = 0;
        startScreen(screens[curr]);
    }

    public function startScreen(screen:Screen) {
        switch(screen) {
            case Hint(p,s): HXP.scene = new Hint(p,s);
            case Level(hazards): HXP.scene = new Level(hazards);
            case GameWon: HXP.scene = new GameWon();
            case GameOver: HXP.scene = new GameOver();
        }
    }

	public static function main() { new Main(); }

}