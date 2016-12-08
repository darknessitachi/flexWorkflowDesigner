package model
{
	import flash.events.ContextMenuEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.System;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.events.CloseEvent;
	 

	public class Line extends BaseComponent
	{
		public function Line(lineLabel:String)
		{
			super(lineLabel);
			this.width= 0;
			this.height = 0 ;
			this.setStyle("backgroundColor",0x343434);
			
		}
	
		public var firstNode:Node;
		public var secondNode:Node;
		
		protected var dragNode:Node;
		protected var nodragNode:Node;
		private var isFirstNode:Boolean = false;
		 override protected function   onMouseMove(event:MouseEvent):void{
	
			if(dragNode!=null){
				drawLine(dragNode,null);
			}
		} 
		override protected function onMouseUp(event:MouseEvent):void{
				if(dragNode!=null && (event.target is Node)){
					drawEndLine(dragNode,Node(event.target));
					Node(event.target).addOutLines(this);
					dragNode = null; 
					secondNode = Node(event.target);
				}
				
		} 
		 override protected function bringUp():void{
		 	if(firstNode == null || secondNode == null){
		 		return;
		 	}
		 	if(mouseX < this.x && mouseY <this.y){
				if(firstNode.x < secondNode.x){
					isFirstNode = true;
					dragNode = firstNode;
					nodragNode = secondNode;
				} /* else{
					isFirstNode = false;
					nodragNode = firstNode;
					dragNode = secondNode;
				} */
			}else if(mouseX > this.x && mouseY <this.y){
				if(firstNode.x > secondNode.x){
					isFirstNode = true;
					dragNode = firstNode;
					nodragNode = secondNode;
				} /* else{
					isFirstNode = false;
					nodragNode = firstNode;
					dragNode = secondNode;
				} */
			}else if(mouseX > this.x && mouseY >this.y){
				if(firstNode.x > secondNode.x){
					isFirstNode = true;
					dragNode = firstNode;
					nodragNode = secondNode;
				} /* else{
					isFirstNode = false;
					nodragNode = firstNode;
					dragNode = secondNode;
				}  */
			}else if(mouseX < this.x && mouseY >this.y){
				if(firstNode.x < secondNode.x){
					isFirstNode = true;
					dragNode = firstNode;
					nodragNode = secondNode;
				} /* else{
					isFirstNode = false;
					nodragNode = firstNode;
					dragNode = secondNode;
				}  */
			}
		 }
		 
		 
		public function drawBeginLine(fromNode:Node,toNode:Node):void{
			
			drawLine(fromNode,toNode);
			firstNode = fromNode;
			Application.application.singleLineIcon.beginDraw = false;
			Application.application.doubleLineIcon.beginDraw = false;
		}
		public function drawLine(fromNode:Node,toNode:Node):void{
			sycCenterPoint(new Point(fromNode.x,fromNode.y),new Point(this.contanter.mouseX,this.contanter.mouseY));
			this.graphics.clear();
			this.graphics.lineStyle(2);
			this.graphics.moveTo((fromNode.x -this.contanter.mouseX)/2,(fromNode.y - this.contanter.mouseY)/2);
			this.graphics.lineTo((this.contanter.mouseX - fromNode.x)/2,(this.contanter.mouseY - fromNode.y)/2);
			
		}
		 protected var lineAngle:uint;
		public function beginToEndLine(fromNode:Node,toNode:Node):void{
		 
			this.firstNode = fromNode;
			this.secondNode = toNode;
			this.graphics.clear();
			this.graphics.lineStyle(2);
			this.x = (fromNode.x +toNode.x)/2;
			this.y = (fromNode.y + toNode.y)/2;
			lineAngle = Math.atan2(toNode.y - fromNode.y,toNode.x - fromNode.x)*180/Math.PI;
			this.graphics.moveTo((fromNode.x - toNode.x)/2,(fromNode.y - toNode.y)/2);
			this.graphics.lineTo((toNode.x - fromNode.x)/2,(toNode.y - fromNode.y)/2);
			
		}
		public function drawEndLine(fromNode:Node,toNode:Node):void{
			sycCenterPoint(new Point(fromNode.x,fromNode.y),new Point(toNode.x,toNode.y));
			this.graphics.clear();
			this.graphics.lineStyle(2);
			this.graphics.moveTo((fromNode.x - toNode.x)/2,(fromNode.y - toNode.y)/2);
			this.graphics.lineTo((toNode.x - fromNode.x)/2,(toNode.y - fromNode.y)/2);
			secondNode = toNode;
		  
		}
		private function sycCenterPoint(fromPoint:Point,toPoint:Point):void{
			this.x = (fromPoint.x +toPoint.x)/2;
			this.y = (fromPoint.y + toPoint.y)/2;
		}
		override public function destory():Boolean{
			
			return true;
		}
		override protected function selectDelete(event:ContextMenuEvent):void{
        	
        	Alert.show("该d除","你真的删除吗",Alert.YES|Alert.NO,null,deleteSure);
        	
        }
        private function deleteSure(event:CloseEvent):void{
        	 if(event.detail == Alert.YES){
        	 	Application.application.drawCanvas.removeChild(this);
        		Application.application.drawCanvas.deleteLines(this);
        	 }
        	
        	 
        }
	}
}