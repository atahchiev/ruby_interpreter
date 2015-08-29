module Lisputin
  class Interpreter
    def initialize(scope)
      @scope = scope
    end

    def eval(ast)
      ast
    end
  end
end
