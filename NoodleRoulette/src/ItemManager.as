package
{
	import mx.collections.ArrayCollection;
	import mx.core.BitmapAsset;
	
	public class ItemManager
	{
		[Embed(source="assets/item01.png")]
		[Bindable]
		private var item01ImgCls:Class;
		
		[Embed(source="assets/item02.png")]
		[Bindable]
		private var item02ImgCls:Class;
		
		[Embed(source="assets/item03.png")]
		[Bindable]
		private var item03ImgCls:Class;
		
		[Embed(source="assets/item04.png")]
		[Bindable]
		private var item04ImgCls:Class;
		
		[Embed(source="assets/item05.png")]
		[Bindable]
		private var item05ImgCls:Class;
		
		[Embed(source="assets/item06.png")]
		[Bindable]
		private var item06ImgCls:Class;
		
		[Embed(source="assets/item07.png")]
		[Bindable]
		private var diskImgCls:Class;
		
		private var TEMPLATE_ITEMS:Array = new Array(
			(new Item()).init(40, 80, -1, item01ImgCls),
			(new Item()).init(30, 80, -1, item02ImgCls),
			(new Item()).init(20, 80, -1, item03ImgCls),
			(new Item()).init(15, 80, -1, item04ImgCls),
			(new Item()).init(10, 80, -1, item05ImgCls),
			(new Item()).init(500, 80, -1, item06ImgCls, true),
			(new Item()).init(0, 90, -1, diskImgCls, false, true)
		);
		
		public var items:ArrayCollection;
		
		public function ItemManager() {
			items = new ArrayCollection();
			for(var i:int = 0; i < TEMPLATE_ITEMS.length; i++) {
				var anArray:ArrayCollection = new ArrayCollection();
//				anArray.addItem(TEMPLATE_ITEMS[i]);
				items.addItem(anArray);	
			}
		}
		
		public function allocateItem(idx:int):Item {
			var itemsOfIdx:ArrayCollection = items.getItemAt(idx) as ArrayCollection;
			for (var i:int = 0; i < itemsOfIdx.length; i++) {
				var anItem:Item = itemsOfIdx.getItemAt(i) as Item;
				if (!anItem.isUsed()) {
					return anItem;
				}
			}
			
			//no item available --> create new item
			var newItem:Item = (TEMPLATE_ITEMS[idx] as Item).clone();
			itemsOfIdx.addItem(newItem);
			return newItem;
		}
		
		public function allocateDiskItem():Item {
			return allocateItem(items.length - 1);
		}
		public function allocateGiftItem():Item {
			return allocateItem(items.length - 2);
		}
		
		public function stopAll() {
			for (var i:int = 0; i < items.length; i++) {
				var anArray:ArrayCollection = items.getItemAt(i) as ArrayCollection;
				for (var j:int = 0; j < anArray.length; j++) {
					var anItem:Item = anArray.getItemAt(j) as Item;
					anItem.moveEffect.stop();
				}
			}
		}
		
		public function setSpeedRate(rate:Number) {
//			for (var i:int = 0; i < items.length; i++) {
//				var anArray:ArrayCollection = items.getItemAt(i) as ArrayCollection;
//				for(var j:int = 0; j < anArray.length; j++) {
//					var item:Item = anArray.getItemAt(j) as Item;
//					item.moveEffect.setSpeedRate(rate);
//				}
//			}
//			for (var i:int = 0; i < TEMPLATE_ITEMS.length; i++) {
//				var item:Item = TEMPLATE_ITEMS[i] as Item;
//				item.moveEffect.setSpeedRate(rate);
//			}
			EllipseMove.GLOBAL_SPEED_RATE = rate;
		}
	}
}