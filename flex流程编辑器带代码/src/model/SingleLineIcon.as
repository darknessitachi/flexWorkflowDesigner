package model
{
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	import mx.core.Application;
	public class SingleLineIcon extends Button
	{
		[Bindable]
		[Embed(source='/assets/singleArrowSelect.png')]
		public var signleArrowSelectskin:Class;
		[Bindable]
		[Embed(source='/assets/singleArrow.png')]
		public var signleArrowskin:Class;
		
		
		private var _beginDraw:Boolean = false;
		
		
		public function set beginDraw(value:Boolean):void{
			this._beginDraw = value;
			setSkin();
		}
	 	public function get beginDraw():Boolean{
			return this._beginDraw;
		} 
		
		public function SingleLineIcon()
		{
			
			super();
			this.setStyle("skin",signleArrowskin);
			this.addEventListener(MouseEvent.CLICK,onClick);
			
		}
		private function setSkin():void{
			
			if(beginDraw){
				 
				this.setStyle("skin",signleArrowSelectskin);
				// 开始画
			 	
				PenType.pentype = PenType.singleLine;
			}else{
				this.setStyle("skin",signleArrowskin);
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