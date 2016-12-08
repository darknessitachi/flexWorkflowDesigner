package model
{
	public  class PenType
	{
		public static var singleLine:String = "singleLine";
		public static var doubleLine:String = "doubleLine";
		public static var pentype:String = null;
		public static var node:String = "node";
		public static var taskNodeType:String = "taskNodeType";
		public static var point:String = "point";
		
		public static var beginNodeType:String = "beginNodeType";
		public static var endNodeType:String = "endNodeType";
		
		public static var beginNode:Node;
		public static var currentLine:Line;
		
		public static var lines:Array = new Array();
	}
}