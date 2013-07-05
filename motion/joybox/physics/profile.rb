Joybox::Physics::Profile = B2DProfile

class B2DProfile

  alias_method :solve_init, :solveInit
  alias_method :solve_init=, :setSolveInit
  alias_method :solve_velocity, :solveVelocity
  alias_method :solve_velocity=, :setSolveVelocity
  alias_method :solve_position, :solvePosition
  alias_method :solve_position=, :setSolvePosition
  alias_method :solve_TOI, :solveTOI
  alias_method :solve_TOI=, :setSolveTOI
  
end