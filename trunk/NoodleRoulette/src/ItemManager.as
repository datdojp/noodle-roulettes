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
		private var item07ImgCls:Class;
		
		[Embed(source="assets/item08.png")]
		[Bindable]
		private var item08ImgCls:Class;
		
		[Embed(source="assets/item09.png")]
		[Bindable]
		private var item09ImgCls:Class;
		
		[Embed(source="assets/item10.png")]
		[Bindable]
		private var item10ImgCls:Class;
		
		[Embed(source="assets/item11.png")]
		[Bindable]
		private var item11ImgCls:Class;
		
		private var TEMPLATE_ITEMS:Array = new Array(
			(new Item()).init(10, 50, 50,item01ImgCls),
			(new Item()).init(20, 50, 50,item02ImgCls),
			(new Item()).init(30, 50, 50,item03ImgCls),
			(new Item()).init(40, 50, 50,item04ImgCls),
			(new Item()).init(50, 50, 50,item05ImgCls),
			(new Item()).init(0, 50, 50,item06ImgCls, true),
			(new Item()).init(60, 50, 50,item07ImgCls),
			(new Item()).init(70, 50, 50,item08ImgCls),
			(new Item()).init(80, 50, 50,item09ImgCls),
			(new Item()).init(90, 50, 50,item10ImgCls),
			(new Item()).init(100, 50, 50,item11ImgCls)
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
		
		var itemCount = 0;
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
			itemCount++;
			if (NoodleRoulette.instance != null) {
				NoodleRoulette.instance.outDebug(itemCount.toString());
			}
			return newItem;
		}
	}
}