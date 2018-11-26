package com.lib{
	import com.lib.ExtCalendarLayout;
	import com.lib.ExtDateChooser;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	
	import mx.controls.Button;
	import mx.controls.CalendarLayout;
	import mx.controls.DataGrid;
	import mx.controls.DateChooser;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.FlexEvent;
	import mx.styles.StyleProxy;
	
	
	
	public class ExtAsDatechooser extends ExtDateChooser4{
		
		private var _upBtn:Button;
		private var downBtn:Button;
		private var dateGrid:CalendarLayout;
		
		
		//public var highlightColor : Number = 0xff0000;
		//public var highlightDate : Array = ["10","20"];
		
		override protected function createChildren():void{
			overrideAddDateGrid_in_createChildren();
			super.createChildren();
		}
		
		protected override function updateDisplayList(w:Number, h:Number):void{
			super.updateDisplayList(w,h);
			//createDayLabels(-1);
			for(var i:uint = 0; i < this.numChildren; i++)
			{
				var calendarObj:Object = this.getChildAt(i);
				
				if(calendarObj.hasOwnProperty("className")){
					if(calendarObj.className == "CalendarLayout"){
						//var cal:CalendarLayout = new CalendarLayout;
						//cal = ExtCalendarLayout(calendarObj);
						var cal:CalendarLayout = CalendarLayout(calendarObj);
						
						var result:String = "";
						/*
						for each(var a:Array in cal.mx_internal::dayBlocksArray){
						result += a.join() + "\n";
						}
						*/
						/*
						for(var ii:int = 0; cal.mx_internal::dayBlocksArray.length < ii; ii++){
						ExternalInterface.call("console.log",cal.mx_internal::dayBlocksArray[o][i]);
						}
						*/
						for(var hh:int = 0 ; hh < 7; hh ++){
							for (var ww:int = 0; ww < 7; ww ++){
								if(hh == 0 && ww == 2 )
									cal.mx_internal::dayBlocksArray[hh][ww].text = "aa";
								ExternalInterface.call("console.log","[" + hh + "," + ww + "]" + cal.mx_internal::dayBlocksArray[hh][ww].text);
							}
						}
						
						ExternalInterface.call("console.log",result);
						
						//cal.mx_internal::dayBlocksArray = new Array();
						
						ExternalInterface.call("console.log",result);
						//cal.includeInLayout = false;
						//cal.visible = false;
						
						for (var j:uint = 0 ; j < cal.numChildren; j++)
						{
							var dateLabel:Object = cal.getChildAt(j);
							//ExternalInterface.call("console.log",cal.mx_internal::);
							//ExternalInterface.call("console.log",cal.mx_internal::dayBlocksArray[i,int(j)]);
							//ExternalInterface.call("console.log","[" + i + "," + j + "]" + dateLabel);
							
							//this.removeChild(cal);
							if(dateLabel.hasOwnProperty("text")){
								var day:UITextField = UITextField(dateLabel);
								
								//ExternalInterface.call("console.log",cal.getChildAt(j));
								//var dayHTML:String = day.text;
								if(i == 3 && j == 4){
									//var tmpUIT:UITextField = new UITextField;
									day.text = "a";
									cal.setChildIndex(day,j);
								}
								
								ExternalInterface.call("console.log","[" + i + "," + j + "]" + cal.getChildAt(j));
								ExternalInterface.call("console.log",day.text);
								ExternalInterface.call("console.log","[x]" + day.x + "[y]" + day.y + "[width]" + day.width + "[height]" + day.height);
							}
							
						}
					}
					
				}
			}
			
			/*
			var dateGrid : UIComponent = mx_internal::dateGrid;
			
			
			//ExternalInterface.call("console.log", i + ":" + dateGrid.toString());
			
			//ExternalInterface.call("console.log", "dateGrid.numChildren" + dateGrid.numChildren.toString());
			
			for( var i:int = 0 ; i < dateGrid.numChildren; i++) {
			ExternalInterface.call("console.log", i + ":" + dateGrid.getChildAt(i));
			ExternalInterface.call("console.log", i + ":" + dateGrid.getRect(dateGrid.getChildAt(i)));
			//ExternalInterface.call("console.log", i + ":" + );
			
			
			//mx_internal::dateGrid = new DataGrid();
			//if(i == 3)
			//mx_internal::dateGrid.mx_internal::drawDayNames();
			//if(i == 5)
			//mx_internal::removingChild(dateGrid.getChildAt(i));
			
			
			//dateGrid.
			if(dateGrid.getChildAt(i) is IUITextField){
			//dateGrid.removeChildAt(i);
			//var textField:UITextField = dateGrid.getChildAt(i) as UITextField;
			//dateGrid.getChildAt(i) as UITextField = new UITextField;
			
			//ExternalInterface.call("console.log", i + ":" + textField.text);
			/*
			for(var j:int = 0; j< highlightDate.length; j++){
			if(textField.text == highlightDate[j]) {
			ExternalInterface.call("console.log", textField.text);
			textField.text = "99";
			
			}
			}
			
			}
			}*/
		}
		
		
		private function overrideAddDateGrid_in_createChildren():void{
			
			mx_internal::dateGrid = new ExtCalendarLayout();
			mx_internal::dateGrid.styleName = new StyleProxy(this, calendarLayoutStyleFilters);
			//dateGrid.addEventListener(CalendarLayoutChangeEvent.CHANGE, copyOf_DateGrid_changeHandler_from_superclass);
			//dateGrid.addEventListener(DateChooserEvent.SCROLL, copyOfDateGrid_scrollHandler_from_superclass);
			mx_internal::dateGrid = dateGrid;
		}
		
		private function createDayLabels(childIndex:int):void
		{
			var weekDayStyleName:Object = getStyle("weekDayStyleName");
			
			// Remember the height of the cells if not set by user.
			// Create the 7 labels within each DayBlock.
			// The first row in each column displays a day name string,
			// such as "Sun".
			// The other six rows displays day numbers in the range 1-31.
			
			// Calendar days
			
			ExternalInterface.call("console.log","createDayLabels Start");
			
			for(var i:uint = 0; i < this.numChildren; i++)
			{
				var calendarObj:Object = this.getChildAt(i);
				
				if(calendarObj.hasOwnProperty("className")){
					if(calendarObj.className == "CalendarLayout"){
						var cal:CalendarLayout = CalendarLayout(calendarObj);
						for (var columnIndex:int = 0; columnIndex < 7; columnIndex++)
						{
							cal.mx_internal::dayBlocksArray[columnIndex] = [];
							//cal.mx_internal::setSelectedIndicators()[columnIndex] = [];
							
							
							for (var rowIndex:int = 0; rowIndex < 7; rowIndex++)
							{
								var label:IUITextField =
									cal.mx_internal::dayBlocksArray[columnIndex][rowIndex] =
									IUITextField(createInFontContext(UITextField));
								
								label.selectable = false;
								label.ignorePadding = true;
								if (childIndex == -1)
									addChild(DisplayObject(label));			
								else
									addChildAt(DisplayObject(label), childIndex++);
								
								if (rowIndex == 0)
								{
									label.styleName = weekDayStyleName ?
										weekDayStyleName :
										this;
								}
								else
								{
									label.styleName = this;
								}
								
							}
							
							
							cal.mx_internal::disabledArrays[columnIndex] = new Array(7);
							
							
						}
						
						
					}
				}
			}
			
			ExternalInterface.call("console.log","createDayLabels End");
		}
		
		public function ExtAsDatechooser(){
			super();
			ExternalInterface.call("console.log", "displayObject Start");
			_upBtn = new Button;
			ExternalInterface.call("console.log", " new Button");
			_upBtn.useHandCursor = true;
			_upBtn.buttonMode = true;
			this.addChild(_upBtn);
			
			ExternalInterface.call("console.log", " addChild");
			//ExternalInterface.call("console.log", "useHandCursor Start");
			/*
			_upBtn.visible = true;
			_upBtn.label = "aaa";
			_upBtn.x = 10;
			_upBtn.y = 4;
			_upBtn.width = 150;
			_upBtn.height = 150;
			_upBtn.id = "calbtn";
			*/
			this.addEventListener(FlexEvent.CREATION_COMPLETE, displayObject);
			ExternalInterface.call("console.log", "ExtAs Start");
		}
		
		public function get upBtn():Button
		{
			return _upBtn;
		}
		
		private function displayObject():void{
			
		}
		
		
		
	}
}

