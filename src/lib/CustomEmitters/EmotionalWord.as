﻿package lib.CustomEmitters{	import org.flintparticles.common.particles.Particle;	import org.flintparticles.twoD.particles.Particle2D;	import flash.display.Stage;	import org.flintparticles.common.actions.Age;	import fl.motion.easing.Cubic;	import org.flintparticles.threeD.actions.TweenToZone;	import flash.display.BitmapData;	import org.flintparticles.threeD.zones.BitmapDataZone;	import flash.text.TextField;	import flash.geom.Matrix;	import flash.text.TextFormat;	public class EmotionalWord extends Emotion	{		private var _newParticle:Particle2D;		private var _aging:Age;		private var _tweenToZone:TweenToZone;		private var _easing:Function;		private var _bitmapDataZone:BitmapData;		private var _stage:Stage;		private var _textField:TextField;		private var _textFormat:TextFormat;		private var _bitmapData:BitmapData;		private var _matrix:Matrix;		public function EmotionalWord(stage:Stage, givenParticles:Vector.<Particle>):void		{			_easing = Cubic.easeInOut;			_stage = stage;						// Format the text.			_textFormat = new TextFormat("Helvetica Neue",1000);			_textFormat.bold = "condensed black";			_textField = new TextField  ;			_textField.width = 1000;			_textField.height = 1000;			_textField.defaultTextFormat = _textFormat;						super(_stage);						trace("Moved into new emitter!");						addParticles(givenParticles,true);						_aging = new Age(_easing);			addAction(_aging);						// Create a BitmapData object that will be used to			// draw a string to a bitmap to be used as a zone			// where particles should go.			_bitmapDataZone = new BitmapData(500,200,true,0x00FFFFFF);			// Draw somethingsomething as a test.			_bitmapDataZone.draw(_stage);			drawString( _bitmapDataZone , "10" , 0 , 0 );			// To test output, draw it to the stage.			//_stage.addChild(new Bitmap(_bitmapDataZone));						_tweenToZone = new TweenToZone(new BitmapDataZone(_bitmapDataZone));			addAction(_tweenToZone);		}								/**		 * Convert a string to a BitmapData object.		 */		private function drawString(target:BitmapData,text:String,x:Number,y:Number):void		{			_textField.text = text;			_bitmapData = new BitmapData(_textField.width,_textField.height,true,0x00FFFFFF);			_bitmapData.draw(_textField);			_matrix = new Matrix  ;			_matrix.translate(x,y);			target.draw(_bitmapData,_matrix);			_bitmapData.dispose();		}	}}