package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Pigeon extends Entity
	{
		
		
		[Embed(source = 'assets/pigeon.png')] 
		private const sprite:Class;
		
		public function Pigeon()
		{
			graphic=new Image(sprite);
			y=300;
		}
		
		override public function update():void{
			x=x+1;
			
		}
	}
}