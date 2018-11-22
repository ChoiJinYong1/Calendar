package com.lib{
	import flash.events.MouseEvent;
	
	import mx.controls.Label;
	
	public class ExtLabel extends Label
	{
		public function ExtLabel()
		{
			super();
			this.setStyle("textAlign","center"); 
			this.setStyle("fontSize","10"); 	
			this.setStyle("fontWeight","bold");
			this.addEventListener(MouseEvent.MOUSE_OVER,Mouse_Over);
			this.addEventListener(MouseEvent.MOUSE_OUT,Mouse_Out);
		}
		
		
		protected function Mouse_Over(event:MouseEvent):void
		{	
			event.currentTarget..getTxt().background = true;
			event.currentTarget..getTxt().backgroundColor = "0xB2E1FF";	
		}
		
		protected function Mouse_Out(event:MouseEvent):void
		{
			event.currentTarget..getTxt().background = false;
		}
		
		public function getTxt() : *
		{
			return textField;
		} 
		
		
	}
}

