package
{
	import mx.controls.Image;
	import mx.core.BitmapAsset;

	public class Item
	{
		public var image:Image;
		public var moveEffect:EllipseMove;
		
		public var score:int;
		public var isGift:Boolean;
		public var isDisk:Boolean;
		public var imgClass:Class;
		
		public function Item() {
		}
		
		public function init(score:int, width:int, height:int, imgClass:Class, isGift:Boolean = false, isDisk:Boolean = false):Item
		{
			this.score = score;
			this.isGift = isGift;
			this.isDisk = isDisk;
			this.imgClass = imgClass;
			this.image = new Image();
			var imageSource:BitmapAsset = new imgClass() as BitmapAsset;
			this.image.source = imageSource;
			this.image.width = width;
			this.image.height = imageSource.height * width / imageSource.width;
			this.moveEffect = new EllipseMove();
			this.moveEffect.setTarget(this.image);
			this.moveEffect.targetOriginalWidth = this.image.width;
			this.moveEffect.targetOriginalHeight = this.image.height;
			if (isDisk) {
				this.moveEffect.marginTop = 10;
			}
			
			return this;
		}
		
		public function clone():Item {
			var result:Item = (new Item()).init(
				this.score, this.image.width, this.image.height, 
				this.imgClass, this.isGift, this.isDisk);
			result.moveEffect.dInterval = this.moveEffect.dInterval;
			return result;
		}
		
		public function isUsed():Boolean {
			return this.moveEffect.isRunning == true;
		}
	}
}