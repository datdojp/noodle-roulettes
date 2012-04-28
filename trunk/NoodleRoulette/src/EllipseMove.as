package
{
	import flash.events.Event;
	import flash.geom.Point;
	
	import mx.effects.Move;
	import mx.events.EffectEvent;
	
	public class EllipseMove
	{
		public var move:Move;
		public var ellipse:Ellipse;
		public var a2:int;
		public var b2:int;
		public var fromX;
		public var toX;
		public var dX:int;
		public var dInterval:int;	
		public var isTargetFromFarDistance:Boolean;
		
		public var x:int;
		public var isRunning:Boolean = false;
		public var targetOriginalWidth:Number;
		public var targetOriginalHeight:Number;
		
		public function EllipseMove() {
			this.move = new Move();
			this.ellipse = new Ellipse();
		}
		
		public function setTarget(target:Object):void {
			this.move.target = target;
		}
								  
		
		public function init(target:Object, center:Point, a:int, b:int, fromX:int, toX:int, 
									dX:int = 5, dInterval:int = 50, isTargetFromFarDistance:Boolean = false):EllipseMove
		{
			setTarget(target);
			this.move.duration = dInterval;
			this.ellipse.center = center;
			this.ellipse.a = a;
			this.a2 = a * a;
			this.ellipse.b = b;
			this.b2 = b * b;
			this.fromX = fromX;
			this.toX = toX;
			this.dX = dX;
			if (fromX > toX)
			{
				this.dX = -dX;
			}
			this.dInterval = dInterval;
			this.isTargetFromFarDistance = isTargetFromFarDistance;
			
			return this;
		}
		
		public function start()
		{
			this.x = this.fromX;
			var y = getY(this.x);
			if (this.isTargetFromFarDistance) {
				this.move.target.width = this.targetOriginalWidth * 0.6;
				this.move.target.height = this.targetOriginalHeight * 0.6;
			} else {
				this.move.target.width = this.targetOriginalWidth;
				this.move.target.height = this.targetOriginalHeight;
			}
			this.move.target.x = getRealX(this.x);
			this.move.target.y = getRealY(y);
			this.move.target.visible = true;
			this.move.xFrom = getRealX(this.x);
			this.move.yFrom = getRealY(y);
			this.move.xTo = getRealX(this.x);
			this.move.yTo = getRealY(y);
			this.move.duration = 0;
			this.isRunning = true;
			this.move.addEventListener(EffectEvent.EFFECT_END, onRepeat);
			this.move.play();
		}
		
		public function onRepeat(event:Event) {
			if ( (this.dX > 0 && this.x > this.toX) ||
				(this.dX < 0 && this.x < this.toX) ||
				(this.x > this.ellipse.a || this.x < -this.ellipse.a) ) {
				
				this.move.target.visible = false;
				this.isRunning = false;
				if (this.onFinish != null) {
					this.onFinish(this);
				}
				return;
			}
			this.x += this.dX;
			this.move.xFrom = this.move.xTo;
			this.move.yFrom = this.move.yTo;
			this.move.xTo = getRealX(this.x);
			this.move.yTo = getRealY(getY(this.x));
			this.move.duration = this.dInterval;
			this.move.play();
		}
		
		public var onFinish:Function;
		
		public function getRealX(x:int) {
			return this.ellipse.center.x + x - this.move.target.width / 2;
		}
		
		public function getRealY(y:int) {
			return this.ellipse.center.y - y - this.move.target.height / 2;
		}
		
		public function getY(x:int) {
			var y;
			if (x == 0) {
				y = this.ellipse.b;
			} else {
				y = Math.sqrt((1 - x * x / a2) * b2);
			}
			if (this.dX > 0) {
				return -y;
			} else {
				return y;
			}
		}
		
		//		private function calculatePosition(alpha:int):Point
		//		{
		//			if (alpha == 90) 
		//			{
		//				return new Point(center.x, center.y - b); 
		//			}
		//			if (alpha == 270)
		//			{
		//				return new Point(center.x, center.y + b);
		//			}
		//			var tan:Number = Math.tan(alpha * Math.PI / 180);
		//			var tan2:int = tan * tan;
		//			
		//			var x:Number = a * b / Math.sqrt(b2 + a2 * tan2);
		//			if (90 < alpha && alpha < 270)
		//			{
		//				x = -x;
		//			}
		//			var y:Number = x * tan;
		//			return new Point(Math.round(this.center.x + x), Math.round(this.center.y - y));
		//		}
	}
}