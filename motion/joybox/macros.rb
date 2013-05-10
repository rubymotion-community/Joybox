# Extracted from the Cocos2D source: https://github.com/cocos2d/cocos2d-iphone
# amazing work! Thank you Cocos2D team (https://github.com/cocos2d)!
#
# Ruby Motion does detect the original functions (Ex: ccp), thats why we
# have to change the name of the method prefix to jbp (joy box point)
#
module Joybox
  module Macros
    # Creates a CGPoint
    def jbp(x, y)
      CGPointMake(x, y)
    end

    # Opposite of point
    def jbpNeg(point)
      jbp(-point.x, -point.y)
    end

    # Sum of two points
    def jbpAdd(first_point, second_point)
      jbp(first_point.x + second_point.x, first_point.y + second_point.y)
    end

    # Difference of two points
    def jbpSub(first_point, second_point)
      jbp(first_point.x - second_point.x, first_point.y - second_point.y)
    end

    # Point multiplied by factor
    def jbpMult(first_point, factor)
      jbp(first_point.x * factor, first_point.y * factor)
    end

    # Midpoint between two points
    def jbpMidPoint(first_point, second_point)
      jbpMult(jbpAdd(first_point, second_point), 0.5)
    end

    # Product of two points
    def jbpDot(first_point, second_point)
      first_point.x * second_point.x + first_point.y * second_point.y
    end

    # Cross product of two points
    def jbpCross(first_point, second_point)
      first_point.x * second_point.y - first_point.y * second_point.x
    end

    # Perpendicular of point, rotated 90 degrees counter-clockwise
    def jbpPerp(point)
      jbp(-point.y, point.x)
    end

    # Perpendicular of v, rotated 90 degrees clockwise
    def jbpRPerp(point)
      jbp(point.y, -point.x)
    end

    # Projection of first point over second point
    def jbpProject(first_point, second_point)
      jbpMult(second_point, jbpDot(first_point, second_point) / jbpDot(second_point, second_point))
    end

    # Rotates two points
    def jbpRotate(first_point, second_point)
      jbp(first_point.x * second_point.x - first_point.y * second_point.y,
          first_point.x * second_point.y + first_point.y * second_point.x)
    end

    # Unrotates two points
    def jbpUnrotate(first_point, second_point)
      jbp(first_point.x * second_point.x + first_point.y * second_point.y,
          first_point.y * second_point.x - first_point.x * second_point.y)
    end

    # Square lenght of a CGPoint
    def jbpLengthSQ(point)
      jbpDot(point, point)
    end

    # Square distance between two points
    def jbpDistanceSQ(first_point, second_point)
      jbpLengthSQ(jbpSub(first_point, second_point))
    end

    # Distance between point an origin
    def jbpLength(point)
      Math.sqrt(jbpLengthSQ(point))
    end

    # Distance between two points
    def jbpDistance(first_point, second_point)
      jbpLength(jbpSub(first_point, second_point))
    end

    # Point multiplied to a lenght of 1
    def jbpNormalize(point)
      jbpMult(point, 1.0 / jbpLength(point))
    end

    # Converts radians to a normalized vector
    def jbpForAngle(angle)
      jbp(Math.cos(angle), Math.sin(angle))
    end

    # Converts vector to radians
    def jbpToAngle(point)
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
    def jbpClamp(point, minimum_inclusive, maximum_inclusive)
      jbp(clamp(point.x, minimum_inclusive.x, maximum_inclusive.x),
          clamp(point.y, minimum_inclusive.y, maximum_inclusive.y))
    end

    # CGSize from a CGPoint
    def jbpFromSize(size)
      jbp(size.width, size.height)
    end

    # Run a math operation function on each point component
    def jbpCompOp(point, &block)
      jbp(block.call(point.x), block.call(point.y))
    end

    # Linear interpolation between two points
    def jbpLerp(first_point, second_point, alpha)
      jbpAdd(jbpMult(first_point, 1 - alpha), jbpMult(second_point, alpha))
    end

    # Determine if two points are equal with some degree of variance
    def jbpFuzzyEqual(first_point, second_point, variance)
      if first_point.x - variance <= second_point.x and second_point.x <= first_point.x + variance
        if first_point.y - variance <= second_point.y and second_point.y <= first_point.y + variance
          return true
        end
      end

      false
    end

    # Multiples the first and second point
    def jbpCompMult(first_point, second_point)
      jbp(first_point.x * second_point.x, first_point.y * second_point.y)
    end

    # Signed angle in radians between two vector directions
    def jbpAngleSigned(first_point, second_point)
      first_point = jbpNormalize(first_point)
      second_point = jbpNormalize(second_point)

      angle = Math.atan2(first_point.x * second_point.y - first_point.y * second_point.x),
        jbpDot(first_point, second_point)

      angle = 0.0 if angle.abs < Float::EPSILON
      angle
    end

    # Angle in radians between two vector directions
    def jbpAngle(first_point, second_point)
      angle = Math.acos(jbpDot(jbpNormalize(first_point), jbpNormalize(second_point)))
      angle = 0.0 if angle.abs < Float::EPSILON
      angle
    end

    # Rotates a point counter-clockwise by the angle around the pivot
    def jbpRotateByAngle(first_point, pivot_point, angle)
      rotation_point = jbpSub(first_point, pivot_point)
      cosine = Math.cos(angle)
      sine = Math.sin(angle)

      rotation_point.x = rotation_point.x * cosine - rotation_point.y * sine + pivot_point.x
      rotation_point.y = rotation_point.y * sine + rotation_point.y * cosine + pivot_point.y

      rotation_point
    end

    # Evaluates if two lines intersect
    def jbpLineIntersect(point_a, point_b, point_c, point_d)
      # Line undefined
      return false if point_a.x == point_b.x && point_a.y == point_b.y || point_c.x == point_d.x && point_c.y == point_d.y

      x_b_to_a = point_b.x - point_a.x
      y_b_to_a = point_b.y - point_a.y
      x_d_to_c = point_d.x - point_c.x
      y_d_to_c = point_d.y - point_c.y
      x_a_to_c = point_a.x - point_c.x
      y_a_to_c = point_a.y - point_c.y

      s = x_d_to_c * y_a_to_c - y_d_to_c * x_a_to_c
      t = x_b_to_a * y_a_to_c - y_b_to_a * x_a_to_c

      denom = y_d_to_c * x_b_to_a - x_d_to_c * y_b_to_a
      if denom == 0
        # Lines incident
        return { s: hit_point, t: second_hit_point } unless s != 0 && t != 0

        # Lines parallel and not incident
        return nil
      end

      { s: hit_point / denom, t: second_hit_point / denom }
    end

    # Evaluates if two segments intersect
    def jbpSegmentIntersect(point_a, point_b, point_c, point_d)
      r = jbpLineIntersect(point_a, point_b, point_c, point_d)
      return false unless r[:s] >= 0.0 && r[:s] <= 1.0 && r[:t] >= 0.0 && r[:t] <= 1.0
      return true
    end

    # Intersection point between the two lines
    def jbpIntersectPoint(point_a, point_b, point_c, point_d)
      r = jbpLineIntersect(point_a, point_b, point_c, point_d)
      return CGPointZero unless r
      return CGPointMake(point_a.x + r[:s] * (point_b.x - point_a.x), point_a.y + r[:s] * (point_b.y - point_a.y))
    end

  end
end