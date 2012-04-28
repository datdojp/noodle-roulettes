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
		public var imgClass:Class;
		
		public function Item() {
		}
		
		public function init(score:int, width:int, height:int, imgClass:Class, isSpecial:Boolean = false):Item
		{
			this.score = score;
			this.isSpecial = isSpecial;
			this.imgClass = imgClass;
			this.image = new Image();
			this.image.width = width;
			this.image.height = height;
			this.image.source = new imgClass() as BitmapAsset;
			this.moveEffect = new EllipseMove();
			this.moveEffect.setTarget(this.image);
			this.moveEffect.targetOriginalWidth = width;
			this.moveEffect.targetOriginalHeight = height;
			
			return this;
		}
		
		public function clone():Item {
			return (new Item()).init(
				this.score, this.image.width, this.image.height, 
				this.imgClass, this.isSpecial);
		}
		
		public function isUsed():Boolean {
			return this.moveEffect.isRunning == true;
		}
	}
}