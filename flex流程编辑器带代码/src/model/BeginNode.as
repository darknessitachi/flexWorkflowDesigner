package model
{
	import flash.events.ContextMenuEvent;
	
	import mx.controls.Alert;
	
	public class BeginNode extends Node
	{
		public function BeginNode(nodeLabel:String)
		{
			super(nodeLabel);
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0xf76767);
			this.graphics.drawCircle(10,10,30);
			this.graphics.endFill();
			
		}
		
		override protected function selectDelete(event:ContextMenuEvent):void{
        	
        	Alert.show("起始节点,不能删除!","提示");
        	
        }
		
		
	}
}