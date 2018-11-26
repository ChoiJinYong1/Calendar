package com.lib{
	import com.lib.ExtDateChooser;
	
	import flash.events.Event;
	import flash.external.ExternalInterface;
	
	import mx.controls.Button;
	import mx.controls.DateChooser;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	
	
	
	public class ExtAsDatechooser extends ExtDateChooser4{
		
		private var _upBtn:Button;
		private var downBtn:Button;
		
		public var highlightColor : Number = 0xff0000;
		public var highlightDate : Array = ["10","20"];
		
		protected override function updateDisplayList(w:Number, h:Number):void{
			super.updateDisplayList(w,h);
			var dateGrid : UIComponent = mx_internal::dateGrid;
			
			ExternalInterface.call("console.log", "dateGrid.numChildren" + dateGrid.numChildren);
			for( var i:int = 0 ; i < dateGrid.numChildren; i++) {
				if(dateGrid.getChildAt(i) is IUITextField){
					var textField:UITextField = dateGrid.getChildAt(i) as UITextField;
					
					ExternalInterface.call("console.log", i + ":" + textField.text);
					/*
					for(var j:int = 0; j< highlightDate.length; j++){
						if(textField.text == highlightDate[j]) {
							ExternalInterface.call("console.log", textField.text);
							textField.text = "99";
							
						}
					}
					*/
				}
			}
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