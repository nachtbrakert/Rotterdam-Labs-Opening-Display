﻿package {	import flash.display.Sprite;	import flash.events.KeyboardEvent;	import flash.events.Event;	import flash.geom.Point;	import org.flintparticles.common.counters.*;	import org.flintparticles.common.displayObjects.RadialDot;	import org.flintparticles.common.initializers.*;	import org.flintparticles.twoD.actions.*;	import org.flintparticles.twoD.emitters.Emitter2D;	import org.flintparticles.twoD.initializers.*;	import org.flintparticles.twoD.renderers.*;	import org.flintparticles.twoD.zones.*;	import org.flintparticles.common.emitters.Emitter;	import lib.CustomEmitters.Emotion;	import flash.display.StageDisplayState;	import flash.display.StageScaleMode;	import flash.display.StageAlign;	/**	 * Shows particles that represent emotions. Uses	 * output from a shore emotion abstractor.	 *	 * Emotions:	 * 0: Sad	 * 1: Angry	 * 2: Supprised	 * 3: Happy	 * 	 * Sex:	 * 0: Female	 * 1: Male	 *	 * @author Frank Bos and Jasper Kennis	 */	public class Main extends Sprite	{		var emitter:Emotion;		var renderer:DisplayObjectRenderer;		public function Main():void		{			stage.scaleMode = StageScaleMode.NO_SCALE;			stage.align = StageAlign.TOP_LEFT;						// Create a Snowfall emitter.			emitter = new Emotion();			// Create a renderer (which renders the created			// particles), and add the emitter to the renderer.			renderer = new DisplayObjectRenderer();			renderer.addEmitter( emitter );			addChild( renderer );			// Set listeners if the stage is ready.			if (stage)			{				stage.addEventListener( KeyboardEvent.KEY_UP, keyUpListener);				stage.addEventListener(Event.RESIZE, resizeListener); 			}		}		/**		* Respond to key input.		*/		private function keyUpListener(e:KeyboardEvent):void		{			if (e.keyCode == 65)			{				// Key "a" can be used to fullscreen the movie.				if (stage.displayState == "normal")				{					stage.displayState = StageDisplayState.FULL_SCREEN;				}			}			else			{				// All other keys are registered to emit random images.				emitter.extendedStart(				  randomNumber(18,70),				  randomNumber(0,1),				  randomNumber(0,3)				 );			}		}		/**		 * Update the stage dependend sizes of the emitter.		 */		function resizeListener(e:Event):void		{			emitter.updateSizes( stage.stageWidth , stage.stageHeight );		}		/** 		* Generates a truly "random" number		* @return Number		*/		function randomNumber(low:Number=0, high:Number=1):Number		{			return Math.floor(Math.random() * (1+high-low)) + low;		}	}}