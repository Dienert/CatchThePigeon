package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	
	public class Enemy extends Entity
	{
		
		
		[Embed(source = 'assets/crow.gif')] 
		private static const aliveSprite:Class;
		
		[Embed(source = 'assets/Explosion1.png')] 
		private static const deadSprite1:Class;
		
		[Embed(source = 'assets/Explosion2.png')] 
		private static const deadSprite2:Class;
		
		[Embed(source = 'assets/Explosion3.png')] 
		private static const deadSprite3:Class;
		
		private static var images:Array;
		
		{
			images=[];
			images[0]=new Image(deadSprite1);
			images[1]=new Image(deadSprite2);
			images[2]=new Image(deadSprite3);
			images[3]=new Image(deadSprite3);
						
		}
		
		private var dead:Boolean=false;
		
		private var deadCount:int;
		
		public function Enemy(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			super(x, y, graphic, mask);
			
			
			this.graphic=new Image(aliveSprite);
			var hitbox:Hitbox=new Hitbox();
			this.centerOrigin();
			this.width=32;
			this.height=32;
		}
		
		public function die():void{
			dead=true;
			deadCount=0;
			this.graphic=new Image(deadSprite1);
		}
		
		
		override public function update():void{
			super.update();
			if(dead){
				graphic=images[deadCount/3];
			}
			if(dead&&deadCount++>10){
				world.remove(this);
			}else{
				var directionX:int=0;
				var directionY:int=0;
				var direction:Number=Math.random()-0.5;
				if(direction>0){
					directionX=1;
				}else if (direction<0){
					directionX=-1;
				}
				direction=Math.random()-0.5;
				if(direction>0){
					directionY=1;
				}else if (direction<0){
					directionY=-1;
				}
				moveBy(directionX, directionY);
				
			}
			
		}
	}
}