module Joybox
  module Box2D

    class World < B2DWorld

      def self.defaults
        {
          gravity: [0, 0],
          allows_sleeping: true,
          continuos_physics: true
        }
      end


      def self.new(options)

        options = options.nil? ? defaults : defaults.merge!(options)

        world = World.alloc.init 

        world.gravity = options[:gravity]
        world.allowsSleeping = options[:allows_sleeping]
        world.continuosPhysics = options[:continuos_physics]

        world
      end


      def step_defaults
        {
          velocity_interactions: 8,
          position_interactions: 1
        }
      end


      def step(options = {})

        options = options.nil? ? step_defaults : step_defaults.merge!(options)

        stepWithDelta(options[:delta], 
                      velocityInteractions: options[:velocity_interactions],
                      positionInteractions: options[:position_interactions])
      end


      def new_body(options = {}, &block)

        body = Body.new(self, options)
        body.instance_eval(&block)

        body 
      end

    end

  end
end