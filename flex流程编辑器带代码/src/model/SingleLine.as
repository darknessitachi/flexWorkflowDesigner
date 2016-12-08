package model
{
	import mx.controls.Button;
	
	public class SingleLine extends Line
	{
		
			[Bindable]
			[Embed(source='/assets/singleArrow.swf')]
			public var signleArrowskin:Class;
			
			private var singleArrow:Button = new Button();
		
		public function SingleLine(lineLabel:String)
		{
			super(lineLabel); 
	//		this.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
		//	this.addEventListener(MouseEvent.MOUSE_OVER,sdsdsd);
		// this.allowHMove = true;
		//	this.allowHResize = true;
		//	this.allowRotate = true;
			
		//	this.allowVMove = true; 
		}
	   
	  	
		override protected function createChildren():void{
			super.createChildren();
			
			if(this.secondNode !=null){
				// 也就是起止连线
			 
				this.addChild(singleArrow);
			}else{
				this.addChild(singleArrow);
			}
			singleArrow.setStyle("skin",signleArrowskin);
			
		}
		 
 
		override public function beginToEndLine(fromNode:Node,toNode:Node):void{
		  super.beginToEndLine(fromNode,toNode);
			singleArrow.rotation = lineAngle;
		}
		override public function drawLine(fromNode:Node, toNode:Node):void{
			super.drawLine(fromNode,toNode);
			if(toNode != null){
				lineAngle =  360 +  Math.atan2(toNode.y - fromNode.y,toNode.x - fromNode.x)*180/Math.PI;
				
			}else{
				lineAngle = 360 +  Math.atan2(this.contanter.mouseY - fromNode.y,this.contanter.mouseX - fromNode.x)*180/Math.PI;
			}
			trace("lineAngle:"+lineAngle);
			singleArrow.x = (this.contanter.mouseX - fromNode.x)*0.4;
			singleArrow.y = (this.contanter.mouseY - fromNode.y)*0.4;
			singleArrow.rotation = lineAngle;
		}
		override public function drawBeginLine(fromNode:Node, toNode:Node):void{
			super.drawBeginLine(fromNode,toNode);
		}
		override public function drawEndLine(fromNode:Node, toNode:Node):void{
			super.drawEndLine(fromNode,toNode);
			lineAngle =  360 + Math.atan2(toNode.y - fromNode.y,toNode.x - fromNode.x)*180/Math.PI ;
		    singleArrow.rotation = lineAngle;
	 		singleArrow.x = (toNode.x - fromNode.x)*0.4;
			singleArrow.y = (toNode.y - fromNode.y)*0.4;
		}
	}
}