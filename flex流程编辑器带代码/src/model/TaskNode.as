package model
{
	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenuItem;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import view.basepropertyView;
	import view.editenableItemView;
	import view.roleView;
 
	
	public class TaskNode extends Node
	{
		
		 
		private var editenableContextmenuitem:ContextMenuItem;
		private var roleContextmenuitem:ContextMenuItem;
		public function TaskNode(labelStr:String)
		{
			super(labelStr);
			var tasknodeskin:tasknodeSkin = new tasknodeSkin();
			tasknodeskin.x = -15;
			tasknodeskin.y = -5;
			
			this.addChildAt(tasknodeskin,0);
		/* 	
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0xf76767);
			this.graphics.drawRect(-15,-5,70,30);
			this.graphics.endFill(); */
			
			editenableContextmenuitem = new ContextMenuItem("可写字段");
            editenableContextmenuitem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,editenableClick);
            this.allContextMenu.customItems.push(editenableContextmenuitem);
            roleContextmenuitem = new ContextMenuItem("经办权限");
            roleContextmenuitem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,roleClick);
            this.allContextMenu.customItems.push(roleContextmenuitem);
		}
		private function editenableClick(event:ContextMenuEvent):void{
        	var editenableItemview:editenableItemView = new editenableItemView();
        	PopUpManager.addPopUp(editenableItemview,Application.application.document);
        	PopUpManager.centerPopUp(editenableItemview);
        }
        private function roleClick(event:ContextMenuEvent):void{
         	var roleview:roleView = new roleView();
        	PopUpManager.addPopUp(roleview,Application.application.document);
        	PopUpManager.centerPopUp(roleview);
        }
        override protected function selectProperty(event:ContextMenuEvent):void{
			var basepropertyview:basepropertyView = new basepropertyView();
        	PopUpManager.addPopUp(basepropertyview,Application.application.document);
        	PopUpManager.centerPopUp(basepropertyview);
		}
        override protected function selectDelete(event:ContextMenuEvent):void{
        	Alert.show("你真的删除吗 ","请确定",Alert.YES|Alert.NO,null,deleteSure);
        }
        private function deleteSure(event:CloseEvent):void{
        	 if(event.detail == Alert.YES){
        	 	Application.application.dragCanvas.removeChild(this);
        	 	for each(var moveInLine:Line in inLines){
        	 		try{
        	 			this.contanter.removeChild(moveInLine);
        	 	 		this.contanter.deleteLines(moveInLine);
        	 		}catch(e:Error){
        	 			trace("已经被删过一次了inLines"+e.toString());
        	 		}
				}
				for each(var moveOutLine:Line in outLines){
					try{
        	 			this.contanter.removeChild(moveOutLine);
        	 			this.contanter.deleteLines(moveOutLine);
        	 		}catch(e:Error){
        	 			trace("已经被删过一次了outLines"+e.toString());
        	 		}
				}
        	 }
        }
	}
}