package control
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	 
	
	public class AnalyzeXml
	{
		
		private static var xmlReuqest:URLRequest = new URLRequest("demo.xml");
		private static var xmlUrlloader:URLLoader = new URLLoader();
		public static function loadXml():void
		{ 
			xmlUrlloader.addEventListener(Event.COMPLETE,loadxmlComplete);
			try{
				xmlUrlloader.load(xmlReuqest);
			}catch(e:Error){
				trace("11111111111111");
			}
			 
		}
		
		private static function loadxmlComplete(event:Event):void{
		 	var flowXml:XML = XML(event.target.data);
			
			
			
			
			
			
			 Alert.show(flowXml.toString());
		}
	 
		
		
	}
}