package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Shot extends Entity
	{
		
		[Embed(source = 'assets/beam.png')] 
		private const sprite:Class;
		
		
		public var time:int=3;
		public function Shot()
		{
			graphic=new Image(sprite);
			this.width=16;
			this.height=16;
			
		}
		
		override public function update():void{
			time--;
			var enemies:Array=[];
			world.getClass(Enemy, enemies);
			enemies.forEach(checkCollistion);
		}
		
		private function checkCollistion(enemy:Enemy, index:int, array:Array):void{
			if(this.collideWith(enemy, x, y)!=null){
				enemy.die();
			}
		}
	}
}