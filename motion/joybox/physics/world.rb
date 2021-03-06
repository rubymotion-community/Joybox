module Joybox
  module Physics

    class World < B2DWorld

      extend Joybox::Common::Initialize

      alias_method :bodies, :bodyList
      alias_method :allows_sleeping?, :allowsSleeping
      alias_method :allows_sleeping=, :setAllowsSleeping
      alias_method :proxy_count, :proxyCount
      alias_method :body_count, :bodyCount
      alias_method :joint_count, :jointCount
      alias_method :contact_count, :contactCount
      alias_method :tree_height, :treeHeight
      alias_method :tree_balance, :treeBalance
      alias_method :tree_quality, :treeQuality
      alias_method :locked?, :isLocked
      alias_method :auto_clear_forces?, :autoClearForces
      alias_method :auto_clear_forces=, :setAutoClearForces
      alias_method :create_body, :createBody
      alias_method :clear_forces, :clearForces
      alias_method :draw_debug_data, :drawDebugData
      alias_method :continuous_physics, :continuousPhysics

      def defaults
        {
          gravity: [0, 0],
          allows_sleeping: true
        }
      end

      def initialize(options = {})
        options = options.nil? ? defaults : defaults.merge!(options)

        init
        self.gravity = options[:gravity]
        self.allowsSleeping = options[:allows_sleeping]
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

      def destroy_body(body)
        destroyBody(body)
        @listening_sprites.delete(body[:sprite]) unless @listening_sprites.nil?
      end

      def should_collide(&block)
        @should_collide = block

        @contact_filter = B2DContactFilter.new;
        @contact_filter.shouldCollide = lambda do |first_fixture, second_fixture|
          @should_collide.call(first_fixture, second_fixture)
        end

        setContactFilter(@contact_filter)
      end

      def setup_collision_listener
        @contact_listener = B2DContactListener.new
        setContactListener(@contact_listener)

        @listening_sprites = Hash.new

        @contact_listener.beginContact = lambda do |first_body, second_body, is_touching|
          # TODO: Find a better way to do this assignment
          collision = [first_body, second_body] if @listening_sprites.has_key? first_body[:sprite]
          collision = [second_body, first_body] if @listening_sprites.has_key? second_body[:sprite]
  
          unless collision.nil?
            object = collision[1][:sprite].nil? ? collision[1] : collision[1][:sprite]
            @listening_sprites[collision[0][:sprite]].call(object, is_touching)
          end

          @on_collision.call(first_body, second_body, is_touching) unless @on_collision.nil?
        end
      end

      def when_collide(sprite, &block)
        setup_collision_listener unless @contact_listener
        @listening_sprites[sprite] = block
      end

      def on_collision(&block)
        setup_collision_listener unless @contact_listener
        @on_collision = block
      end

      def on_fixture_destroyed(&block)
        @when_fixture_destroyed = block

        @destruction_listener = B2DDestructionListener.new;
        @destruction_listener.fixtureSayGoodbye = lambda do |fixture|
          @when_fixture_destroyed.call(fixture)
        end

        setDestructionListener(@destruction_listener)
      end 

      def query(options = {}, &block)
        @query = block
        @query_callback = B2DQueryCallback.new
        @query_callback.reportFixture = lambda do |fixture|
          @query.call(fixture)
        end

        aabb = AABB.new
        aabb.lower_bound = CGPointMake(options[:lower_bound][0], options[:lower_bound][1])
        aabb.upper_bound = CGPointMake(options[:upper_bound][0], options[:upper_bound][1])
        queryAABBWithCallback(@query_callback, andAABB:aabb)
      end

      def ray_cast(options = {}, &block)
        @ray_cast = block
        @ray_cast_callback = B2DRayCastCallback.new
        @ray_cast_callback.reportFixture = lambda do |fixture, point, normal, fraction|
          @ray_cast.call(fixture, point.from_pixel_coordinates, normal, fraction)
        end

        first_point = CGPointMake(options[:first_point][0], options[:first_point][1])
        second_point = CGPointMake(options[:second_point][0], options[:second_point][1])

        rayCastWithCallback(@ray_cast_callback,
                            andPoint1:first_point.from_pixel_coordinates,
                            andPoint2:second_point.from_pixel_coordinates)
      end

    end

  end
end
