# module Joybox
#   module Debug
    class PhysicsDraw

      attr_accessor :draw

      Modes = { shapes: 0x0001, joints: 0x0002, aabb: 0x0004, pairs: 0x0008, center_of_mass: 0x0010 }

      def initialize(options = [])
        @draw = B2DDraw.new

        initialize_shader
        initialize_drawing
        
        mode = options.reduce(0) { |sum, option| sum + Modes[option] }
        @draw.drawFlags = mode unless options.empty?
      end

      def modes=(options = [])
        modes = options.reduce(0) { |sum, option| sum + Modes[option] }
        @draw.drawFlags = modes unless options.empty?
      end

      private

      def initialize_shader
        @shader_program = CCShaderCache.sharedShaderCache.programForKey(KCCShader_Position_uColor)
        @color_location = glGetUniformLocation(@shader_program.program, :u_color)
      end

      def initialize_drawing
        @draw.drawPolygon = lambda do |vertices, vertex_count, color|
          prepare_for_drawing
          draw_polygon(vertices, vertex_count, color)
          check_for_drawing_errors
        end

        @draw.drawSolidPolygon = lambda do |vertices, vertex_count, color|
          prepare_for_drawing
          draw_solid_polygon(vertices, vertex_count, color)
          check_for_drawing_errors
        end

        @draw.drawCircle = lambda do |center, radius, color|
          prepare_for_drawing
          draw_circle(center, radius, color)
          check_for_drawing_errors
        end

        @draw.drawSolidCircle = lambda do |center, radius, axis, color|
          prepare_for_drawing
          draw_solid_circle(center, radius, axis, color)
          check_for_drawing_errors
        end

        @draw.drawSegment = lambda do |first_point, second_point, color|
          prepare_for_drawing
          draw_segment(first_point, second_point, color)
          check_for_drawing_errors
        end

        @draw.drawTransform = lambda do |transform|
          prepare_for_drawing
          draw_transform(transform)
          check_for_drawing_errors
        end 
      end

      def prepare_for_drawing
        @shader_program.use
        @shader_program.setUniformsForBuiltins
      end

      def set_drawing_color(color, alpha)
        @shader_program.setUniformLocation(@color_location, 
         withF1: color.red * alpha, 
         f2: color.green * alpha, 
         f3: color.blue * alpha, 
         f4: alpha)
      end

      def check_for_drawing_errors
        error = glGetError
        print "error" if error > 0
        # Todo print error message on the console "0x#{error}4x" if error > 0
      end

      def draw_polygon(box_vertices, vertex_count, color)
        vertices = Pointer.new(:float, vertex_count * 2)
        vertex_count.times do |i|
          vertices[i * 2] = box_vertices[i].x.to_pixels 
          vertices[i * 2 + 1] = box_vertices[i].y.to_pixels
        end

        set_drawing_color(color, 1)
        glVertexAttribPointer(KCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, vertices)
        glDrawArrays(GL_LINE_LOOP, 0, vertex_count)
      end

      def draw_solid_polygon(box_vertices, vertex_count, color)
        vertices = Pointer.new(:float, vertex_count * 2)
        vertex_count.times do |i|
          vertices[i * 2] = box_vertices[i].x.to_pixels 
          vertices[i * 2 + 1] = box_vertices[i].y.to_pixels
        end

        set_drawing_color(color, 0.5)
        glVertexAttribPointer(KCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, vertices)
        glDrawArrays(GL_TRIANGLE_FAN, 0, vertex_count)

        set_drawing_color(color, 1)
        glDrawArrays(GL_LINE_LOOP, 0, vertex_count)
      end

      def draw_circle(center, radius, color)
        vertex_count = 16
        increment = 2.0 * Math::PI / vertex_count
        theta = 0.0

        vertices = Pointer.new(:float, vertex_count * 2)
        vertex_count.times do |i|
          vertex = center + radius * CGPointMake(Math.cos(theta), Math.sin(theta))
          vertex = vertex.to_pixel_coordinates

          vertices[i * 2] = vertex.x
          vertices[i * 2 + 1] = vertex.y
          theta += increment
        end

        p color

        set_drawing_color(color, 1.0)
        glVertexAttribPointer(KCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, vertices)
        glDrawArrays(GL_LINE_LOOP, 0, vertex_count)
      end

      def draw_solid_circle(center, radius, axis, color)
        vertex_count = 16
        increment = 2.0 * Math::PI / vertex_count
        theta = 0.0

        vertices = Pointer.new(:float, vertex_count * 2)
        vertex_count.times do |i|
          vertex = center + radius * CGPointMake(Math.cos(theta), Math.sin(theta))
          vertex = vertex.to_pixel_coordinates

          vertices[i * 2] = vertex.x
          vertices[i * 2 + 1] = vertex.y
          theta += increment
        end

        set_drawing_color(color, 0.5)
        glVertexAttribPointer(KCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, vertices)
        glDrawArrays(GL_TRIANGLE_FAN, 0, vertex_count)

        set_drawing_color(color, 1.0)
        glDrawArrays(GL_LINE_LOOP, 0, vertex_count)

        draw_segment(center, center + radius * axis, color)
      end

      def draw_segment(first_point, second_point, color)
        vertices = Pointer.new(:float, 4)

        vertices = Pointer.new(:float, 4)
        vertices[0] = first_point.x.to_pixels  
        vertices[1] = first_point.y.to_pixels
        vertices[2] = second_point.x.to_pixels
        vertices[3] = second_point.y.to_pixels
        
        set_drawing_color(color, 1)
        glVertexAttribPointer(KCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, vertices)
        glDrawArrays(GL_LINES, 0, 2)
      end

      def draw_transform(transform)
        axis_scale = 0.4
        first_point = transform.metric_position

        #p first_point.x

        angle_x_axis = CGPointMake(Math.cos(transform.angle), Math.sin(transform.angle))
        angle_y_axis = CGPointMake(-Math.sin(transform.angle), Math.cos(transform.angle)) 

        second_point = first_point + axis_scale * angle_x_axis
        draw_segment(first_point, second_point, Color.new(1, 0, 0))

        second_point = first_point + axis_scale * angle_y_axis
        draw_segment(first_point, second_point, Color.new(0, 1, 0))
      end

    end

#   end
# end