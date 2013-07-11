package flat2d.core 
{
	import flash.system.System;
	import flash.utils.getTimer;
	import flat2d.entities.FlatEntity;
	import nape.geom.Vec2;
	import nape.space.Space;
	import nape.util.Debug;
	import starling.display.Sprite;
	
	/**
	 * FlatWorld.as
	 * Created On:	22/01/2013 20:28
	 * Author:		Joshua Barnett
	 */
	
	public class FlatWorld extends FlatState
	{
<<<<<<< HEAD
		private var _gravity		:Vec2;
		private var _pause			:Boolean;
		private var _view			:Sprite;
		private var _space			:Space;
		private var _entities		:Vector.<FlatEntity>;
		private var _debug			:Debug;
        private var _prevTimeMS		:int;
        private var _simulationTime	:Number;
=======
		private var _gravity:Vec2;
		private var _pause:Boolean;
		private var _view:Sprite;
		private var _space:Space;
		private var _entities:Vector.<FlatEntity>;
		private var _debug:Debug;
<<<<<<< HEAD
        private var _prevTimeMS:int;
        private var _simulationTime:Number;
>>>>>>> no message
=======
		
        private var _prevTimeMS:int;
        private var _simulationTime:Number;
>>>>>>> no message
		
		public function FlatWorld(game:FlatGame, gravity:Vec2) 
		{
			super(game);
			
			_gravity	= gravity;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_pause					= false;
			_view					= new Sprite();
			_space					= new Space(_gravity);
			_entities				= new Vector.<FlatEntity>();
			_debug					= game.bitmapDebug;
			_debug.drawConstraints	= true;
<<<<<<< HEAD
            _prevTimeMS				= getTimer();
            _simulationTime			= 0.0;
			addChild(_view);
=======
			
            _prevTimeMS				= getTimer();
            _simulationTime			= 0.0;
			
			addChild(_world);
>>>>>>> no message
		}
		
		protected function toggleDebug():void
		{
			game.debug	= !game.debug;
			drawDebug();
		}
		
		protected function togglePause():void
		{
			_pause	= !_pause;
			drawDebug();
		}
		
		public function addEntity(entity:FlatEntity, addBody:Boolean = true):FlatEntity
		{
			if (_entities.indexOf(entity) == -1)
			{
				entity.world	= this;
				_entities.push(entity);
				if (addBody)
<<<<<<< HEAD
				{
					entity.addBody(_space);
				}
				_view.addChild(entity);
=======
					entity.addBody(_space);
				_world.addChild(entity);
>>>>>>> no message
			}
			return entity;
		}
		
<<<<<<< HEAD
		public function removeEntity(entity:FlatEntity, removeBody:Boolean = true, dispose:Boolean = true):FlatEntity
=======
		public function removeEntity(entity:FlatEntity, removeBody:Boolean = true, dispose:Boolean = false):FlatEntity
>>>>>>> no message
		{
			if (_entities.indexOf(entity) != -1)
			{
				_entities.splice(_entities.indexOf(entity), 1);
				if (removeBody)
<<<<<<< HEAD
				{
					entity.removeBody();
				}
				if(_view.contains(entity))
				{
					_view.removeChild(entity);
				}
=======
					entity.removeBody(_space);
				_world.removeChild(entity);
>>>>>>> no message
				if (dispose)
				{
					entity.dispose();
					entity = null;
				}
			}
			return entity;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!_pause)
			{
				var curTimeMS:uint	= getTimer();
				if (curTimeMS == _prevTimeMS)
<<<<<<< HEAD
=======
					return;
				var deltaTime:Number	= (curTimeMS - _prevTimeMS) / 1000;
				if (deltaTime > 0.05)
					deltaTime = 0.05;
				_prevTimeMS		= curTimeMS;
				_simulationTime	+= deltaTime;
				while (space.elapsedTime < _simulationTime)
					_space.step((game.frameRate > 0) ? (1 / game.frameRate) : (1 / 60));
				
				if (game.debug)
>>>>>>> no message
				{
					return;
				}
				var deltaTime:Number	= (curTimeMS - _prevTimeMS) / 1000;
				if (deltaTime > 0.05)
				{
					deltaTime = 0.05;
				}
				_prevTimeMS		= curTimeMS;
				_simulationTime	+= deltaTime;
				while (space.elapsedTime < _simulationTime)
				{
					_space.step((game.frameRate > 0) ? (1 / game.frameRate) : (1 / 60));
				}
				drawDebug();
				for each(var entity:FlatEntity in _entities)
				{
					entity.update();
				}
<<<<<<< HEAD
			}
		}
		
		private function drawDebug():void
		{
			if (game.debug)
			{
				game.bitmapDebug.clear();
				game.bitmapDebug.draw(_space);
				game.bitmapDebug.flush();
			}
		}
		
		override public function dispose():void 
		{
			_gravity.dispose();
			_gravity			= null;
			_pause				= false;
			while (_entities.length)
			{
				removeEntity(_entities[0], true, true);
			}
			_entities.length	= 0;
			if (_space != null)
			{
				_space.clear();
				_space			= null;
			}
			if (contains(_view))
			{
				removeChild(_view);
			}
			if (_view != null)
			{
				_view.dispose();
			}
			_view				= null;
			if (_debug != null)
			{
				_debug.clear();
			}
			_debug				= null;
			_prevTimeMS			= 0;
			_simulationTime		= NaN;
			Debug.clearObjectPools();
			System.pauseForGCIfCollectionImminent(0);
=======
				
				for each(var entity:FlatEntity in _entities)
					entity.update();
			}
		}
		
		override public function dispose():void 
		{
			_gravity.dispose();
			_pause				= false;
			if (contains(_world))
				removeChild(_world);
			if (_world)
				_world.dispose();
			_world				= null;
			_space				= null;
			while (_entities.length)
				removeEntity(_entities.pop(), true, true);
			_entities.length	= 0;
			if (_space)
			{
				_space.bodies.clear();
				_space.clear();
			}
			if(_debug)
				_debug.clear();
			_debug				= null;
			_prevTimeMS			= 0;
			_simulationTime		= NaN;
>>>>>>> no message
			super.dispose();
		}
		
		public function get view():Sprite					{	return _view;		}
		public function get space():Space 					{	return _space;		}
		public function get entities():Vector.<FlatEntity>	{	return _entities;	}
		public function get pause():Boolean 				{	return _pause;		}
		public function set pause(value:Boolean):void 		{	_pause = value;		}
	}
}