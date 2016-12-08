package model
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.utils.ArrayUtil;

	public class Node extends BaseComponent
	{
		
		
		protected var inLines:ArrayCollection = new ArrayCollection();
		protected var outLines:ArrayCollection = new ArrayCollection();
		
		
		public function Node(nodeLabel:String)
		{
			super(nodeLabel);
			
			 
		}
		public function addInLines(inLine:Line):Boolean{
			
			inLines.addItem(inLine);
			return true;
		}
		public function addOutLines(outLine:Line):Boolean{
			
			
			outLines.addItem(outLine);
			return true;
		}
		public function deleteInLines(inLine:Line):void{
			this.contanter.deleteLines(inLine);
			inLines.removeItemAt(inLines.getItemIndex(inLine));
		}
		public function deleteOutLines(outLine:Line):void{
			outLines.removeItemAt(outLines.getItemIndex(outLine));
		}
		
		override protected function onMouseDown(event:MouseEvent):void{
			super.onMouseDown(event);
			if(Application.application.singleLineIcon.beginDraw || Application.application.doubleLineIcon.beginDraw){ // 连线的起点
				var currentline:Line;
				
				switch(PenType.pentype){
					case PenType.singleLine: currentline = new SingleLine("") ;break;
					case PenType.doubleLine: currentline = new DoubleLine("") ;break;
					
				}	
				 
				PenType.currentLine = currentline;
				currentline.x = -100;
				currentline.y = -100;
				this.addOutLines(PenType.currentLine);
				this.contanter.addChild(PenType.currentLine);
				
				PenType.beginNode = this;
				
			}else if(PenType.beginNode !=null &&  PenType.currentLine != null){
				PenType.currentLine.drawEndLine(PenType.beginNode,this); //连线的终点
				this.outLines.addItem(PenType.currentLine);
				
				if(ArrayUtil.getItemIndex(PenType.currentLine,this.contanter.Lines.toArray()) == -1){
					//这个line以前没被加入过
					this.contanter.addLines(PenType.currentLine);
				}
				PenType.beginNode.addInLines(PenType.currentLine);
				PenType.beginNode = null;
				PenType.currentLine = null;
			}
		}
		
		
		
		override protected function  onMouseMove(event:MouseEvent):void{
			super.onMouseMove(event);
			for each(var moveInLine:Line in inLines){
				if(moveInLine.firstNode != null && moveInLine.secondNode!= null){
					moveInLine.drawEndLine(moveInLine.firstNode,moveInLine.secondNode);
				}
			}
			for each(var moveOutLine:Line in outLines){
				if(moveOutLine.firstNode != null && moveOutLine.secondNode!= null){
					moveOutLine.drawEndLine(moveOutLine.firstNode,moveOutLine.secondNode);
				}
			}
			
			
			
		}
		
		
	}
}