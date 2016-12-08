package model
{
	import com.roguedevelopment.objecthandles.ObjectHandles;
	
	import flash.events.ContextMenuEvent;
	import flash.events.MouseEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import mx.controls.Alert;
	import mx.controls.Label;
	import mx.core.Application;

	public class BaseComponent extends ObjectHandles
	{
		
		private var propertyContextmenuitem:ContextMenuItem;
		private var deleteContextmenuitem:ContextMenuItem;
		protected var allContextMenu:ContextMenu;
		protected var labelText:Label = new Label();
		protected var contanter:DrawCanvas;
		public function BaseComponent(labelString:String)
		{
			super();
			contanter = Application.application.drawCanvas;
			this.labelText.text = labelString;
			this.labelText.x = 0;
			this.labelText.y = 0;
			this.addChild(labelText);
			
			
			this.allowHResize = false;
			this.allowRotate = false;
			this.allowVResize = false; 
			allContextMenu = new ContextMenu();
			propertyContextmenuitem = new ContextMenuItem("基本属性");
			propertyContextmenuitem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,selectProperty);
			allContextMenu.customItems.push(propertyContextmenuitem);
			deleteContextmenuitem = new ContextMenuItem("删除");
			deleteContextmenuitem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,selectDelete);
			allContextMenu.customItems.push(deleteContextmenuitem);
			this.contextMenu = allContextMenu;
			this.contextMenu.hideBuiltInItems();
			
		}
		 
		protected function selectProperty(event:ContextMenuEvent):void{
			
		}
		public function destory():Boolean{
			return true;
		}
		protected function selectDelete(event:ContextMenuEvent):void{
        	Alert.show("基本的删除点","你真的要删除吗",Alert.YES|Alert.NO);
        }
	}
}