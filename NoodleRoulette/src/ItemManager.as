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
			(new Item()).init(10, 50, 50, new item01ImgCls()),
			(new Item()).init(10, 50, 50, new item02ImgCls()),
			(new Item()).init(10, 50, 50, new item03ImgCls()),
			(new Item()).init(10, 50, 50, new item04ImgCls()),
			(new Item()).init(10, 50, 50, new item05ImgCls()),
			(new Item()).init(0, 50, 50, new item06ImgCls(), true),
			(new Item()).init(10, 50, 50, new item07ImgCls()),
			(new Item()).init(10, 50, 50, new item08ImgCls()),
			(new Item()).init(10, 50, 50, new item09ImgCls()),
			(new Item()).init(10, 50, 50, new item10ImgCls()),
			(new Item()).init(10, 50, 50, new item11ImgCls())
		);
		
		private var items:ArrayCollection;
		
		public function ItemManager() {
			items = new ArrayCollection();
			for(var i:int = 0; i < TEMPLATE_ITEMS.length; i++) {
				items.addItem(new ArrayCollection());	
			}
		}
		
		public function allocateItem(oneBasedIdx:int):Item {
			var idx:int = oneBasedIdx - 1;
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
	}
}