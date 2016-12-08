package model
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.core.Application;
	import mx.effects.Zoom;
	import mx.events.DragEvent;
	import mx.events.FlexEvent;
	import mx.managers.DragManager;
	import mx.managers.IFocusManagerComponent;

	public class DragCanvas extends Canvas implements IFocusManagerComponent
	
	{
	 
		public var nodes:ArrayCollection = new ArrayCollection();
		private var isMouseDown:Boolean = false;
		private var isKeyDown:Boolean = false;
		private var isSpaceKeyDown:Boolean = false;
		
		[Embed(source="/assets/hander.png")] private const  hander:Class;
		public function addNodes(node:Node):void{
			nodes.addItem(node);
			this.addChild(node);
		}
		public function deleteNode(node:Node):void{
			nodes.removeItemAt(nodes.getItemIndex(node));
		}
		 
		public function DragCanvas()
		{
			super();
		 	this.setFocus();
			this.percentHeight = 100;
			this.percentWidth = 100;
			this.verticalScrollPolicy = "on";
			this.horizontalScrollPolicy = "on";
			
			this.setStyle("backgroundColor",0xffffff);
			this.addEventListener(DragEvent.DRAG_ENTER,dragEnterHandler);
			this.addEventListener(DragEvent.DRAG_DROP,dragDropHandler);
			this.addEventListener(FlexEvent.CREATION_COMPLETE,addBeginEndNode);
		    this.addEventListener(MouseEvent.MOUSE_MOVE,mouseMove);
		 	this.addEventListener(KeyboardEvent.KEY_DOWN,KeyboardKeyDown);
		 	this.addEventListener(KeyboardEvent.KEY_UP,KeyboardKeyUp);
		 	this.addEventListener(MouseEvent.MOUSE_DOWN,mouseDown);
		 	this.addEventListener(MouseEvent.MOUSE_UP,mouseUp);
			 
		}
		private function mouseMove(event:MouseEvent):void{
		 
			
			
			if(event.localX <0 || event.localY <0){
				this.cursorManager.removeAllCursors();
			}
		} 
		private function mouseDown(event:MouseEvent):void{
		  isMouseDown = true;
		}
		private function mouseUp(event:MouseEvent):void{
		  isMouseDown = false;
		} 
		
		private function KeyboardKeyDown(event:KeyboardEvent):void{
			   
			 switch(event.keyCode){
			 	case 32:
			  	 if(isMouseDown && mouseX >0 && mouseY >0  ){
			  	 	 this.cursorManager.setCursor(hander);
			  	 	 
			  	 	  
			  	// 	 this.move(this.x+100,this.y+200);
			 	 }else{
			 	 	this.cursorManager.removeAllCursors();
			 	 }
			 	 
			 	 
			 	
			 	
			 	
			 	 break;
			 	default: break;
			 	
			 }
			 
		}
		private function KeyboardKeyUp(event:KeyboardEvent):void{
			
			 switch(event.keyCode){
			 	case 32:  this.cursorManager.removeAllCursors(); break;
			 	default: break;
			 	
			 }
			  
		}
		private function dragEnterHandler(event:DragEvent):void{
			DragManager.acceptDragDrop(Canvas(event.currentTarget));
		}
		private function dragDropHandler(event:DragEvent):void{
			var node:Node = NodeFactory.createNode(PenType.pentype);
			var nodewidth:int = 70;
			var nodeheiht:int = 30;
			
			
		 	node.x = Canvas(event.currentTarget).mouseX - nodewidth/2;
		 	node.y = Canvas(event.currentTarget).mouseY - nodeheiht/2;
		 	
		 	addNodes(node);
		 	var alllines:Array = Application.application.drawCanvas.Lines.toArray(); 
		 
		 	var addLine:Line; // 
		 	var oldLine:Line; // 
		 	for each(var line:Line in alllines){
		 		if(line.hitTestObject(node)){ //这个碰撞检测  需要更换为更为精确的检测方法
		 		
		 		
		 		
		 		var points:Array = new Array();
   		 var point:Point;
   		  for(var topline:Number=0;topline<nodewidth;topline++){
   		 	point = localToGlobal(new Point(node.x+topline,node.y));
   		 	
   		 	points.push(point);
   		 	
   		 } 
   		 for(var rightline:Number=0;rightline<(nodeheiht);rightline++){
   		 	point = localToGlobal(new Point(node.x+nodewidth,node.y+rightline));
   		 	points.push(point);
   		 	
   		 }
   		  for(var buttomline:Number=0;buttomline<(nodewidth);buttomline++){
   		 	point = localToGlobal(new Point(node.x+buttomline,node.y+nodeheiht));
   		 	points.push(point);
   		 	
   		 }
   		 for(var leftline:Number=0;leftline<(nodeheiht);leftline++){
   		 	point = localToGlobal(new Point(node.x,node.y+leftline));
   		 	points.push(point);
   		 	
   		 } 
   		
	for(var i:int = 0; i<points.length;i++){
		if(line.hitTestPoint(Point(points[i]).x,Point(points[i]).y,true)){
   				var newline:Line;
		 			if(line.className == "SingleLine"){
		 				var singleline:SingleLine = new SingleLine("");
		 				
		 				singleline.beginToEndLine(line.firstNode,node);
		 				newline = singleline;
		 				
		 			}
		 			if(line.className == "DoubleLine"){
		 				var doubleline:DoubleLine = new DoubleLine("");
		 				doubleline.beginToEndLine(line.firstNode,node);
		 				
		 				newline = doubleline;
		 			}
		 			Application.application.drawCanvas.addChild(newline);
		 			line.firstNode.addOutLines(newline);
		 			 
		 			newline.firstNode = line.firstNode;
		 			newline.secondNode = node;
		 	//		
		 			oldLine = line;
		 			
		 			addLine  = newline;
   				break;
   			} 
	}
		 		
		 		
		 		
		 		
		 		
		 		
		 		
		 		
		 		
		 			
		 			//现在要判断到底 原来的这个 连线到底是什么类型，如果原来的是 双向，则加入新节点后 随之加入的节点就是双向，反之依然
		 			
		 		}
		 		
		 	}
		 		if(addLine != null){
		 			Application.application.drawCanvas.addLines(addLine);
		 			node.addInLines(newline);
		 			node.addOutLines(oldLine);
		 		//	this.contanter.addLines(outLine);
		 			oldLine.beginToEndLine(node,oldLine.secondNode);
		 			trace("targetLine");
		 		}
		}
		private function addBeginEndNode(event:FlexEvent):void{
			var beginnode:Node = NodeFactory.createNode(PenType.beginNodeType);
		 	beginnode.x =  40;
		 	beginnode.y =  50;
		// 	this.addChild(beginnode);
		 	addNodes(beginnode);
		 	var endnode:Node = NodeFactory.createNode(PenType.endNodeType);
		 	endnode.x =  this.width - 100;
		 	endnode.y =  50;
	//	 	this.addChild(endnode);
		 	addNodes(endnode);
		 	var beginToEndLine:SingleLine = new SingleLine("");
		 	beginToEndLine.beginToEndLine(beginnode,endnode);
		 	
		 	PenType.currentLine = beginToEndLine;
			
		 	beginnode.addOutLines(beginToEndLine);
		 	var alllines:Array = Application.application.drawCanvas.Lines.toArray(); 
		 	Application.application.drawCanvas.addLines(beginToEndLine);
		 	
		 	Application.application.drawCanvas.addChild(beginToEndLine);
		 	endnode.addInLines(beginToEndLine);
		 	
		}
	private var canvasZoom:Zoom = new Zoom();
	public function zoomInThis():int{
		 
		return 100;
	}
	}
	
	
	
}