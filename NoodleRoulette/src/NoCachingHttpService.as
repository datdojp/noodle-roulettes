package
{
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;

	public class NoCachingHttpService extends HTTPService
	{
		public function NoCachingHttpService(rootURL:String=null, destination:String=null)
		{
			super(rootURL, destination);
		}
		
		public override function send(parameters:Object = null):AsyncToken
		{
			//add a random parameter to prevent caching
			this.url = getRandomParam(this.url);
			return super.send(parameters);
		}
		
		private function getRandomParam(url:String):String
		{
			if(url.indexOf("?") < 0) {
				return url + "?randparam=" + Math.random();
			} else {
				return url + "&randparam=" + Math.random();
			}
		}
	}
}