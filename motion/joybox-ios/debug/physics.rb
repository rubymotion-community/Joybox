module Joybox
  module Debug
    module Physics

      class << self
        attr_accessor :modes
        attr_accessor :world
        attr_accessor :draw
      end
      
      def draw
        super
        initialize_physics_drawing if @world_symbol.nil?
        draw_physics unless @world_symbol.nil?
      end

      def initialize_physics_drawing
        @world_symbol = self.instance_variables.find do |symbol|
          instance_variable_get(symbol).class == Joybox::Physics::World
        end

        unless @world_symbol.nil?
          @physics_draw = PhysicsDraw.new(Joybox::Debug::Physics.modes)
          instance_variable_get(@world_symbol).setDebugDraw(@physics_draw.draw)
          Joybox::Debug::Physics.world = instance_variable_get(@world_symbol)
          Joybox::Debug::Physics.draw = @physics_draw
        end
      end

      def draw_physics
        ccGLEnableVertexAttribs(KCCVertexAttribFlag_Position)
        kmGLPushMatrix
        instance_variable_get(@world_symbol).drawDebugData
        kmGLPopMatrix
      end

    end

  end
end