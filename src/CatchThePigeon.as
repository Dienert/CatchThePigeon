package
{
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class CatchThePigeon extends Engine
	{
		public function CatchThePigeon()
		{
			super(800,600);
			Mouse.hide();
			FP.world=new MyWorld;
			
		}
	}
}