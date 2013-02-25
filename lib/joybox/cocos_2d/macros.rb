# Extracted from the Cocos2D source: https://github.com/cocos2d/cocos2d-iphone
# amazing work! Thank you Cocos2D team (https://github.com/cocos2d)!
#
# Ruby Motion does detect the original functions (Ex: ccp), thats why we 
# have to change the name of the method prefix to bb (Ex: bbc)
#
# Missing implementation of the following methods
# => bbpCompOp
# => bbpLineIntersect
# => bbpSegmentIntersect
# => bbpIntersectPoint
module Joybox
  module Cocos2D
    module Macros

      # Creates a CGPoint
      def bbp(x, y)

        CGPointMake(x, y)
      end

      # Oposite of point
      def bbpNeg(point)

        cxp(-point.x, -point.y)
      end

      # Sum of two points
      def bbpAdd(first_point, second_point)

        cxp(first_point.x + second_point.x, first_point.y + second_point.y)
      end

      # Difference of two points
      def bbSub(first_point, second_point)

        bbp(first_point.x - second_point.x, first_point.y - second_point.y)
      end

      # Point multiplied by factor
      def bbpMult(first_point, factor)

        bbp(first_point.x * factor, first_point.y * factor)
      end

      # Midpoint between two points
      def bbpMidPoint(first_point, second_point)

        bbpMult(bbpAdd(first_point, second_point), 0.5)
      end

      # Product of two points
      def bbpDot(first_point, second_point)

        first_point.x * second_point.x + first_point.y * second_point.y
      end

      # Cross product of two points
      def bbpCross(first_point, second_point)

        first_point.x * second_point.y - first_point.y * second_point.x
      end

      # Perpendicular of point, rotated 90 degrees counter-clockwise
      def bbpPerp(point)

        bbp(-point.y, point.x)
      end

      # Perpendicular of v, rotated 90 degrees clockwise
      def bbpRPerp(point)

        bbp(v.y, -v.x)
      end

      # Projection of first point over second point
      def bbpProject(first_point, second_point)

        bbpMult(second_point, bbpDot(first_point, second_point) / bbpDot(second_point, second_point))
      end

      # Rotates two points
      def bbpRotate(first_point, second_point)

        bbp(first_point.x * second_point.x - first_point.y * second_point.y,
            first_point.x * second_point.y + first_point.y * second_point.x)
      end

      # Unrotates two points
      def bbpUnrotate(first_point, second_point)

        bbp(first_point.x * second_point.x + first_point.y * second_point.y,
            first_point.y * second_point.x - first_point.x * second_point.y)
      end

      # Square lenght of a CGPoint
      def bbpLengthSQ(point)

        bbpDot(v, v)
      end

      # Square distance between two points
      def bbpDistanceSQ(first_point, second_point)

        bbpLengthSQ(bbpSub(first_point, second_point))
      end

      # Distance between point an origin
      def bbpLenght(point)

        Math.sqrt(bbpLengthSQ(point))
      end

      # Distance between two points
      def bbpDistance(first_point, second_point)

        bbpLenght(bbpSub(first_point, second_point))
      end

      # Point multiplied to a lenght of 1
      def bbpNormalize(point)

        bbpMult(v, 1.0 / bbpLenght(point))
      end

      # Converts radians to a normalized vector
      def bbpForAngle(angle)

        bbp(Math.cos(angle), Math.sin(angle))
      end

      # Converts vector to radians
      def bbpToAngle(point)

        Math.atan2(v.y, v.x)
      end

      # Clamp a value between from and to
      def clamp(value, minimum_inclusive, maximum_inclusive)

        if minimum_inclusive > maximum_inclusive

          swap = minimum_inclusive

          minimum_inclusive = maximum_inclusive
          maximum_inclusive = swap
        end

        value < minimum_inclusive ? minimum_inclusive : value < maximum_inclusive ? value : maximum_inclusive
      end

      # Clamp a point between from and to
      def bbpClamp(point, minimum_inclusive, maximum_inclusive)

        bbp(clamp(point.x, minimum_inclusive.x, maximum_inclusive.x), 
            clamp(point.y, minimum_inclusive.y, maximum_inclusive.y))
      end

      # CGSize from a CGPoint
      def bbpFromSize(size)

        bbp(size.width, size.height)
      end

      # Run a math operation function on each point component
      def bbpCompOp
        rise 'Method not implemented'
      end

      # Linear interpolation between two points
      def bbpLerp(first_point, second_point, alpha)

        bbpAdd(bbpMult(first_point, 1 - alpha), bbpMult(second_point, alpha))
      end

      # Determine if two points are equal with some degree of variance
      def bbpFuzzyEqual(first_point, second_point, variance)

        if first_point.x - variance <= second_point.x and second_point.x <= first_point.x + variance

          if first_point.y - variance <= second_point.y and second_point.y <= first_point.y + variance

            return true
          end
        end

        false
      end

      # Multiples the first and second point
      def bbpCompMult(first_point, second_point)

        bbp(first_point.x * second_point.x, first_point.y * second_point.y)
      end

      # Signed angle in radians between two vector directions
      def bbpAngleSigned(first_point, second_point)

        first_point = bbpNormalize(first_point)
        second_point = bbpNormalize(second_point)

        angle = Math.atan2(first_point.x * second_point.y - first_point.y * second_point.x),
        bbpDot(first_point, second_point)

        angle = 0.0 if Math.abs(angle) < Float::EPSILON

        angle
      end 

      # Angle in radians between two vector directions 
      def bbAngle(first_point, second_point)

        angle = Math.acos(bbpDot(bbpNormalize(first_point), bbpNormalize(b)))

        angle = 0.0 if Math.abs(angle) < Float::EPSILON

        angle
      end

      # Rotates a point counter-clockwise by the angle around the pivot
      def bbpRotateByAngle(first_point, pivot_point, angle)

        rotation_point = bbpSub(first_point, pivot_point)
        cosine = Math.cos(angle)
        sine = Math.sin(angle)


        rotation_point.x = rotation_point.x * cosine - rotation_point.y * sine + pivot_point.x
        rotation_point.y = rotation_point.y * sine + rotation_point.y * cosine + pivot_point.y

        rotation_point
      end

      # Evaluates if two lines intersect
      def bbpLineIntersect(point_a, point_b, point_c, point_d, hit_point, second_hit_point)

        rise 'Method not implemented'
      end

      # Evaluates if two segments intersect
      def bbpSegmentIntersect(point_a, point_b, point_c, point_d)

        rise 'Method not implemented'
      end

      # Intersection point between the two lines
      def bbpIntersectPoint(point_a, point_b, point_c, point_d)

        rise 'Method not implemented'
      end
    end
  end
end
