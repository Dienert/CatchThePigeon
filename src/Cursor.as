package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Cursor extends Entity
	{
		
		[Embed(source = 'assets/cursor.png')] 
		private const sprite:Class;
		
		
		public function Cursor(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			super(x, y, graphic, mask);
			this.graphic=new Image(sprite);
			width=32;
			height=32;
			
		}
		
		public override function update():void{
			x=Input.mouseX;
			y=Input.mouseY;
		}
		
	}
}