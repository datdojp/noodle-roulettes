package
{
	import mx.controls.Image;
	import mx.core.BitmapAsset;

	public class Item
	{
		public var image:Image;
		public var moveEffect:EllipseMove;
		
		public var score:int;
		public var isSpecial:Boolean;
		public var isUsed:Boolean = false;
		
		public function Item() {
		}
		
		public function init(score:int, width:int, height:int, bitmap:BitmapAsset, isSpecial:Boolean = false):Item
		{
			this.score = score;
			this.isSpecial = isSpecial;
			this.image = new Image();
			this.image.width = width;
			this.image.height = height;
			this.image.source = bitmap;
			this.moveEffect = new EllipseMove();
			this.moveEffect.setTarget(this.image); 
			
			return this;
		}
		
		public function clone():Item {
			return (new Item()).init(
				this.score, this.image.width, this.image.height, 
				this.image.source as BitmapAsset, this.isSpecial);
		}
	}
}