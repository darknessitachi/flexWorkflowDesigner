package model
{
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	import mx.core.Application;
	public class DoubleLineIcon extends Button
	{
		[Bindable]
		[Embed(source='/assets/doubleArrowSelect.png')]
		public var doubleArrowSelectskin:Class;
		[Bindable]
		[Embed(source='/assets/doubleArrow.png')]
		public var doubleArrowskin:Class;
		
		
		private var _beginDraw:Boolean = false;
		
		
		public function set beginDraw(value:Boolean):void{
			this._beginDraw = value;
			setSkin();
		}
		public function get beginDraw():Boolean{
			return this._beginDraw;
		}
		
		public function DoubleLineIcon()
		{
			
			super();
			this.setStyle("skin",doubleArrowskin);
			this.addEventListener(MouseEvent.CLICK,onClick);
			
		}
		private function setSkin():void{
			if(beginDraw){
				this.setStyle("skin",doubleArrowSelectskin);
				// 开始画线
				
				PenType.pentype = PenType.doubleLine;
			}else{
				this.setStyle("skin",doubleArrowskin);
				// 画线结束
			 
			//	PenType.pentype = null;
				
			}
		}
		private function onClick(event:MouseEvent):void{
			Application.application.clearState();
			beginDraw = true;
			setSkin();
		}
	}
}