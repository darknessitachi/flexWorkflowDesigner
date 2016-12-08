package model
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Button;
	import mx.core.Application;

	public class DrawCanvas extends Canvas
	{
		
		public var Lines:ArrayCollection = new ArrayCollection();
		 
	 	public function addLines(line:Line):Boolean{
	//		this.addChild(line);
			Lines.addItem(line);
		 
			return true;
		}
		public function deleteLines(line:Line):Boolean{
			
			Lines.removeItemAt(Lines.getItemIndex(line));
			return true;
		}
		 
		public function DrawCanvas()
		{
			super();
			 
			this.percentHeight = 100;
			this.percentWidth = 100;
			this.addEventListener(MouseEvent.CLICK,clickInCanvas);
			this.addEventListener(MouseEvent.MOUSE_MOVE,drawInCanvas);
		}
		private function drawInCanvas(event:MouseEvent):void{ //鼠标在画布上的移动
			
		 	switch(PenType.pentype){
				case PenType.doubleLine :
				this.removeEventListener(MouseEvent.MOUSE_MOVE,drawInCanvas);
				this.addEventListener(MouseEvent.MOUSE_MOVE,beginDrawLine); // 监听画线
				
				 ; break;
				case PenType.node: ; break;
				case PenType.point : ; break;
				case PenType.singleLine : 	
				this.removeEventListener(MouseEvent.MOUSE_MOVE,drawInCanvas);
				this.addEventListener(MouseEvent.MOUSE_MOVE,beginDrawLine); // 监听画线
				break;
	 		}
		}
		private function beginDrawLine(event:MouseEvent):void{
			if(PenType.beginNode != null &&  PenType.currentLine != null){
			PenType.currentLine.drawBeginLine(PenType.beginNode,null);
		 	}
		}
		  
	 
		private function clickInCanvas(event:MouseEvent):void{
		
			if(PenType.beginNode != null && PenType.currentLine != null){
				try{
					this.removeChild(PenType.currentLine);
					PenType.currentLine = null;
				}catch(e:Error){
					trace("drawcanvas clickInCanvas"+e.toString());
				}
				
			}
		}
		
		
		public function lineWillDraw():void{
			var singleArrowBt:Button = Application.application.singlearrow;
			if(Application.application.singlearrow.getStyle("skin") == Application.application.signleArrowskin){
				Application.application.singlearrow.setStyle("skin",Application.application.signleArrowSelectskin);
			}else{
				Application.application.singlearrow.setStyle("skin",Application.application.signleArrowskin);
			}
			
		}
	}
}