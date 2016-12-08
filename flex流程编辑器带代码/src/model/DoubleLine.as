package model
{
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	
	public class DoubleLine extends Line
	{
		
			[Bindable]
			[Embed(source='/assets/singleArrow.swf')]
			public var doubleArrowskin:Class;
			
			[Bindable]
			[Embed(source='/assets/doubleArrow.swf')]
			public var doubleArrowBackSkin:Class;
			
			private var doubleArrow:Button = new Button();
			private var doubleArrowBack:Button = new Button();
		
		public function DoubleLine(lineLabel:String)
		{
			super(lineLabel);
		
		}
		override protected function createChildren():void{
			super.createChildren();
			 
			if(this.secondNode !=null){
				// 也就是 起至连线
				this.addChild(doubleArrow);
				this.addChild(doubleArrowBack);
			}else{
				this.addChild(doubleArrow);
				this.addChild(doubleArrowBack);
			}
			doubleArrow.setStyle("skin",doubleArrowskin);
			doubleArrowBack.setStyle("skin",doubleArrowBackSkin);
			
		}
 
		override public function beginToEndLine(fromNode:Node,toNode:Node):void{
		   super.beginToEndLine(fromNode,toNode);
			doubleArrow.rotation = lineAngle;
			doubleArrowBack.rotation = lineAngle;
		}
		override public function drawLine(fromNode:Node, toNode:Node):void{
			super.drawLine(fromNode,toNode);
			if(toNode != null){
				lineAngle = 360 +   Math.atan2(toNode.y - fromNode.y,toNode.x - fromNode.x)*180/Math.PI;
				
			}else{
				lineAngle = 360 +   Math.atan2(this.contanter.mouseY - fromNode.y,this.contanter.mouseX - fromNode.x)*180/Math.PI;
			}
			doubleArrow.x = (this.contanter.mouseX - fromNode.x)*0.4;
			doubleArrow.y = (this.contanter.mouseY - fromNode.y)*0.4;
			
			
			doubleArrowBack.x = -(this.contanter.mouseX - fromNode.x)*0.4;
			doubleArrowBack.y = -(this.contanter.mouseY - fromNode.y)*0.4;
 
			doubleArrowBack.rotation = lineAngle;
			doubleArrow.rotation = lineAngle;
		}
		override public function drawBeginLine(fromNode:Node, toNode:Node):void{
			super.drawBeginLine(fromNode,toNode);
		}
		override public function drawEndLine(fromNode:Node, toNode:Node):void{
			lineAngle = 360 + Math.atan2(toNode.y - fromNode.y,toNode.x - fromNode.x)*180/Math.PI;
			super.drawEndLine(fromNode,toNode);
			doubleArrow.rotation = lineAngle;
			doubleArrowBack.rotation = lineAngle;
			doubleArrow.x = (toNode.x - fromNode.x)*0.4;
			doubleArrow.y = (toNode.y - fromNode.y)*0.4;
			
			doubleArrowBack.x = -(toNode.x - fromNode.x)*0.4;
			doubleArrowBack.y = -(toNode.y - fromNode.y)*0.4;
		}
	}
}