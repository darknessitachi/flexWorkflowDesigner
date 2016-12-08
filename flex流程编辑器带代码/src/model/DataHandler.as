package model
{
	public class DataHandler
	{
		[Bindable]
		public static var flowData:XML = 
<flow>
	<taskNode id="taskNode1" singleLine="taskNode2" isCurrent="false"></taskNode>
	<taskNode id="taskNode2" singleLine="taskNode3" isCurrent="false" doubleLine="taskNode4"></taskNode>	
	<taskNode id="taskNode3" singleLine="taskNode4" isCurrent="false" doubleLine="taskNode5"></taskNode>	
	<taskNode id="taskNode4" singleLine="taskNode7" isCurrent="false" ></taskNode>	
	<taskNode id="taskNode5" singleLine="taskNode8" isCurrent="false"></taskNode>	
	<taskNode id="taskNode6" doubleLine="taskNode9" isCurrent="false"></taskNode>	
	<taskNode id="taskNode7" singleLine="taskNode9,taskNode10" isCurrent="false" ></taskNode>	
	<taskNode id="taskNode8" doubleLine="taskNode11" isCurrent="false" ></taskNode>	
	<taskNode id="taskNode9" singleLine="taskNode11"  isCurrent="true"></taskNode>
	<taskNode id="taskNode10" singleLine="taskNode12" isCurrent="false" ></taskNode>
	<taskNode id="taskNode11" singleLine="taskNode13"  isCurrent="false"></taskNode>
	<taskNode id="taskNode12" singleLine="taskNode13" isCurrent="false" ></taskNode>
	<taskNode id="taskNode13"  isCurrent="false" ></taskNode>
</flow>
;

		public static function dddddd():void
		{
			flowData = 
			<flow> 
				 <taskNode id="taskNode8" doubleLine="taskNode11" isCurrent="false" ></taskNode>	
	<taskNode id="taskNode9" singleLine="taskNode11"  isCurrent="true"></taskNode>
			</flow>
			;
		 

		} 
		
		public static function getFlowData():XML
		{
			 
			return flowData;

		} 
		

	}
}