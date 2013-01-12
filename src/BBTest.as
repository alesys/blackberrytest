package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	[SWF(frameRate="60", backgroundColor="0x000000")]
	public class BBTest extends Sprite
	{
		public function BBTest()
		{
			super();
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			var ball:Sprite = new Sprite();
			ball.graphics.beginFill(0xFF0000);
			ball.graphics.drawCircle(50,50,100);
			ball.graphics.endFill();
			addChild(ball);
			ball.addEventListener(Event.ENTER_FRAME, handle_enterframe);
			ball.addEventListener(MouseEvent.MOUSE_DOWN, handle_mousedown);
			ball.x = stage.stageWidth-ball.width>>1;
			var speed:Number = -10;
			var gravity:Number = 3;
			function handle_enterframe(e:Event):void
			{
				speed+=gravity;
				speed*=.98;
				ball.y+=speed;
				if ( ball.y + ball.height > stage.stageHeight )
				{
					speed*=-1;
					ball.y = stage.stageHeight - ball.height;
				}
			}
			function handle_mousedown(e:MouseEvent):void
			{
				speed=-100;
			}
			
		}
	}
}