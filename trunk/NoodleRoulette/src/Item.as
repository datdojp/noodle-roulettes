package
{
	public class Item
	{
		public var score:int;
		public var time:int;
		public var width:int;
		public var height:int;
		public var styleName:String;
		
		public function Item(score:int, time:int, width:int, height:int, styleName:String):void {
			this.score = score;
			this.time = time;
			this.width = width;
			this.height = height;
			this.styleName = styleName;
		}
		
		private static const LIST:Array = [
			new Item(10, 0, 40, 30, "item01"),
			new Item(20, 0, 40, 30, "item02"),
			new Item(30, 0, 40, 30, "item03"),
			new Item(40, 0, 40, 30, "item04"),
			new Item(0, 20000, 40, 30, "item05"),
			new Item(60, 0, 40, 30, "item06"),
			new Item(70, 0, 40, 30, "item07"),
			new Item(80, 0, 40, 30, "item08"),
			new Item(90, 0, 40, 30, "item09"),
			new Item(100, 0, 40, 30, "item10"),
			new Item(110, 0, 40, 30, "item11")
		];
		
		public static function generateItem(id:int):Item {
			var item:Item = LIST[id-1];
			return new Item(item.score, item.time, item.width, item.height, item.styleName);
		}
	}
}