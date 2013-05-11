module Joybox
  module Physics

    class World < B2DWorld

      def self.defaults
        {
          gravity: [0, 0],
          allows_sleeping: true,
          continuous_physics: true
        }
      end


      def self.new(options)

        options = options.nil? ? defaults : defaults.merge!(options)

        world = World.alloc.init 

        world.gravity = options[:gravity]
        world.allowsSleeping = options[:allows_sleeping]
        world.continuousPhysics = options[:continuous_physics]

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
        body.instance_eval(&block) if block
        body
      end


      def setup_collision_listener

        @contact_listener = B2DContactListener.new
        addContactListener(@contact_listener)

        @listening_bodies = Hash.new

        @contact_listener.beginContact = lambda { | first_body, second_body, is_touching |

          @listening_bodies[first_body].call(second_body, is_touching) if @listening_bodies.include? first_body
          @listening_bodies[second_body].call(first_body, is_touching) if @listening_bodies.include? second_body
        }
      end


      def when_collide(body, &block)

        setup_collision_listener unless @contact_listener

        @listening_bodies[body] = block
      end

    end

  end
end
