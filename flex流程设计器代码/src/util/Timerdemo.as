// ActionScript file
package util
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import mx.controls.Alert;
	public class Timerdemo extends Sprite
	{
		private var sp1:Sprite;
		private var sp2:Sprite;
		public function Timerdemo():void
		{
			
			sp1=new Sprite();
			sp1.graphics.beginFill(0Xff0000);
			sp1.graphics.drawRect(0,0,100,120);
			sp1.graphics.endFill();
			addChild(sp1);
			sp1.x=100;
			sp1.y=50;
			sp2=new Sprite();
			sp2.graphics.beginFill(0x0000ff);
			sp2.graphics.drawCircle(50,50,50);
			sp2.graphics.endFill();
			addChild(sp2);
			sp2.x=100;
			sp2.y=200;
			//创建第一个定时执行的类
			var sp1timer:Timer=new Timer(1000,3);
			sp1timer.addEventListener(TimerEvent.TIMER,sp1start);
			sp1timer.start();
			//创建第二个执行类
			var sp2timer:Timer=new Timer(100,0);
			sp2timer.addEventListener(TimerEvent.TIMER,sp2start);
			sp2timer.start();
		}
		
		public function sp1start(er:TimerEvent):void
		{
			sp1.x++;
			//Alert.show("第一个出来了");
		}
		public function sp2start(er:TimerEvent):void
		{
			sp2.x++;
		//	Alert.show("第二个出来了");
		}

	}
}