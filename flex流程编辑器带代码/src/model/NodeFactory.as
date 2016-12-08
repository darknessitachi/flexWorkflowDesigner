package model
{
	import model.Node;
	
	public class NodeFactory
	{
		private static var nodenum:int= 1;
		public static function createNode(pentype:String):Node{
			var node:Node;
			
			switch(pentype){
				case PenType.taskNodeType : 
					node = new TaskNode("任务"+nodenum);
					addNodenum();
				break;
				case PenType.beginNodeType :
					node = new BeginNode("开始");
				break;
				case PenType.endNodeType : node = new EndNode("结束"); break;
			}
			 
			
			return node;
		}
		public static function addNodenum():void{
			nodenum += 1;
		}
		public static function clearNodenum():void{
			nodenum = 1;
			 
		}
	}
}