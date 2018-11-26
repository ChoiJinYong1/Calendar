package com.lib
{
	
	import flash.external.ExternalInterface;
	import flash.text.TextLineMetrics;
	
	import mx.controls.CalendarLayout;
	import mx.core.mx_internal;
	
		
	public class ExtCalendarLayout extends CalendarLayout
	{
		private var CalLevel:int = -1;
		
		public function ExtCalendarLayout()
		{
			super();
		}
		
		override protected function childrenCreated():void{
			super.createChildren();
			
			
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void{
			super.updateDisplayList(w,h);
			
			CalLevel = 1;
			Extmeasure(CalLevel);
			ExternalInterface.call("console.log","updateDisplayList");
			//dayBlocksArray = mx_internal::dayBlocksArray;
			//positionWeekSelectors();
		}
		
		private function Extmeasure(Cal:int):void
		{
			super.measure();
			ExternalInterface.call("console.log","Extmeasure Start");
			var verticalGap:Number = getStyle("verticalGap");
			var horizontalGap:Number = getStyle("horizontalGap");
			
			var paddingLeft:Number = getStyle("paddingLeft");
			var paddingRight:Number = getStyle("paddingRight");
			var paddingBottom:Number = getStyle("paddingBottom");
			var paddingTop:Number = getStyle("paddingTop");
			
			var lineMetrics:TextLineMetrics;
			
			var cellWidth:Number;var cellHeight:Number;
			
			
			
			cellWidth = 0;
			cellHeight = 0;
			
			if(Cal == 1){
				
				for (var dayOfWeek:int = 0; dayOfWeek < 7; dayOfWeek++)
				{
					// dayNames will be null if there are no resources.
					var dayName:String = dayNames ? dayNames[dayOfWeek] : "";
					lineMetrics = measureText(dayName);
					if (lineMetrics.width > cellWidth)
						cellWidth = lineMetrics.width;
					if (lineMetrics.height > cellHeight)
						cellHeight = lineMetrics.height;
				}
				
				lineMetrics = measureText("30");
				
				if (lineMetrics.width > cellWidth)
					cellWidth = lineMetrics.width;
				
				if (lineMetrics.height > cellHeight)
					cellHeight = lineMetrics.height;
				
				measuredWidth = paddingLeft + horizontalGap * 6 +
					cellWidth * 7 + paddingRight;
				measuredHeight = verticalGap * 6 + cellHeight * 7 +
					paddingBottom + paddingTop;
				measuredMinWidth = cellWidth * 7;
				measuredMinHeight = cellHeight * 7;
			} else if(Cal == 2){
				
				/*
				for (var dayOfWeek:int = 0; dayOfWeek < 7; dayOfWeek++)
				{
					// dayNames will be null if there are no resources.
					var dayName:String = dayNames ? dayNames[dayOfWeek] : "";
					lineMetrics = measureText(dayName);
					if (lineMetrics.width > cellWidth)
						cellWidth = lineMetrics.width;
					if (lineMetrics.height > cellHeight)
						cellHeight = lineMetrics.height;
				}
				
				lineMetrics = measureText("30");
				
				if (lineMetrics.width > cellWidth)
					cellWidth = lineMetrics.width;
				
				if (lineMetrics.height > cellHeight)
					cellHeight = lineMetrics.height;
				
				measuredWidth = paddingLeft + horizontalGap * 6 +
					cellWidth * 7 + paddingRight;
				measuredHeight = verticalGap * 6 + cellHeight * 7 +
					paddingBottom + paddingTop;
				measuredMinWidth = cellWidth * 7;
				measuredMinHeight = cellHeight * 7;
				*/
			}
			ExternalInterface.call("console.log","Extmeasure End");
		}

	}
}