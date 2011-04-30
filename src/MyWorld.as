package
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;

	public class MyWorld extends World
	{
		
		public static var cursor:Cursor=new Cursor;
		
		public function MyWorld()
		{
			add(new Pigeon);
			add(cursor);
			var enemy:Enemy = new Enemy();
			enemy.x= 200;
			enemy.y=200;
			add(enemy);
			
			 enemy = new Enemy();
			enemy.x= 200;
			enemy.y=450;
			add(enemy);
			
			
			 enemy = new Enemy();
			enemy.x= 400;
			enemy.y=500;
			add(enemy);
			
			
			 enemy = new Enemy();
			enemy.x= 300;
			enemy.y=130;
			add(enemy);
			
		}
		
		private var shots:Array=[];
		
		
		
		override public function update():void{
			super.update();
			if(Input.mousePressed){
				var shot:Shot=new Shot();
				shot.x=cursor.x + cursor.width/2 - shot.width/2;
				shot.y=cursor.y + cursor.height/2 - shot.height/2;
				shots[shots.length]=shot;
				add(shot);
			}
			this.bringForward(cursor);
			updateShots();
			
		}
		
		
		private function findExpiredShots(item:Shot, index:int, array:Array):Boolean{
			return item.time<0;
		}
		
		private function findAliveShots(item:Shot, index:int, array:Array):Boolean{
			return !findExpiredShots(item, index, array);
		}
		
		
		private function removeShot(item:Shot, index:int, array:Array):void{
			remove(item);
			
		}
		
		private function updateShots():void{
			
			var temp:Array=shots.filter(findExpiredShots);
			temp.forEach(removeShot);
			shots=shots.filter(findAliveShots);
			

			
		}
	}
}