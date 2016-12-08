	// ActionScript file
		import control.AnalyzeXml;
		
		import model.Line;
		import model.Node;
		import model.PenType;
		
		import mx.core.Application;
		import mx.core.DragSource;
		import mx.managers.DragManager;
			
			[Bindable]
			[Embed(source='assets/taskitem.jpg')]
			private var taskitemskin:Class; 
			
			[Bindable]
			[Embed(source='assets/doubleArrow.png')]
			private var doubleArrowskin:Class;
			
		/* 	[Bindable]
			[Embed(source='assets/doubleAzrrowSelect.png')]
			private var doubleArrowSelectskin:Class; */
			[Bindable]
			[Embed(source='assets/singleArrowSelect.png')]
			public var signleArrowSelectskin:Class;
			[Bindable]
			[Embed(source='assets/singleArrow.png')]
			public var signleArrowskin:Class;
			
			[Embed(source='assets/littlesingleArrow.png')]
			private var littlesingleArrowskin:Class;
			[Embed(source='assets/littledoubleArrow.png')]
			private var littledoubleArrowskin:Class;
			 [Bindable]
			[Embed(source='assets/arrow.png')]
			private var arrowskin:Class;
			[Bindable]
			[Embed(source='assets/beginPoint.png')]
			private var beginPointskin:Class;
			[Bindable]
			[Embed(source='assets/endPoint.png')]
			private var endPointskin:Class;
			public var _beginLink:Boolean;
			
			private var currentLine:Line;
			private var currentNode:Node;
	 
private function normalArrowClick():void{ 
	cursorManager.removeAllCursors();
	if(currentLine){
		currentLine.graphics.clear();
	}
}
private function init():void{
	// AnalyzeXml.loadXml();
	 
	
}
private function showw():void{
	trace("showw");
}
private function updateOk():void{
	this.stage.focus = this.dragCanvas;
}
		

private function taskitemMouseMoveHandler(event:MouseEvent):void 
{                
    var dragInitiator:Button=Button(event.currentTarget);
    var dragSource:DragSource = new DragSource();
    dragSource.addData(dragInitiator, "taskNode");
    setToolState(PenType.taskNodeType);
    DragManager.doDrag(dragInitiator, dragSource, event);
   
}
public function setToolState(pentype:String):void{
	clearState();
	PenType.pentype = pentype;
	
}
public function clearState():void{
	Application.application.singleLineIcon.beginDraw = false;
	Application.application.doubleLineIcon.beginDraw = false;
}
private function clearStage():void{
	Application.application.dragCanvas.removeAllChildren();
	Application.application.drawCanvas.removeAllChildren();
}
