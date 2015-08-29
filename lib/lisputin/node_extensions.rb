require 'treetop'

module Lisputin
  class Program < Treetop::Runtime::SyntaxNode
    def to_sexp
      elements.map { |e| e.elements[0] }.map(&:to_sexp)
    end
  end    

  class Expr < Treetop::Runtime::SyntaxNode
    def to_sexp
      e.to_sexp
    end
  end

  class Operator < Treetop::Runtime::SyntaxNode
    def to_sexp
      [:op, text_value.to_sym]
    end
  end 

  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def to_sexp
      [:integer, text_value.to_i]
    end
  end

  class Stringliteral < Treetop::Runtime::SyntaxNode
    # def to_sexp
    #     100
    # end
  end

  class FloatLiteral < Treetop::Runtime::SyntaxNode
    def to_sexp
      [:float, text_value.to_f]
    end
  end


  class RationalLiteral < Treetop::Runtime::SyntaxNode
    def to_sexp
      [:rat, elements[0].text_value.to_i, elements[1].text_value.to_i]
    end
  end

  class ComplexLiteral < Treetop::Runtime::SyntaxNode
    def to_sexp
      [:complex, elements[0].to_sexp, elements[1].to_sexp]
    end
  end

  class SimpleArithmethic < Treetop::Runtime::SyntaxNode
    def to_sexp
      # p "wy"         
      op = elements[0].text_value.strip.to_sym
      args = elements[1].elements.map{|i| i.elements[0].to_sexp}
      # p args
      # args[1..-1].reduce(args[0], op)
      [[:op, op], args]
    end
  end

  class ComplexArithmethic < Treetop::Runtime::SyntaxNode
    def to_sexp
      # p "wy"         
      op = elements[0].text_value.strip.to_sym
      args = elements[1].elements.map{|i| i.to_sexp}
      # p args
      # args[1..-1].reduce(args[0], op)
      [[:op, op], args]
    end
  end

  class Symbol < Treetop::Runtime::SyntaxNode
    def to_sexp
      name.to_sym
    end
  end

  class Bool < Treetop::Runtime::SyntaxNode
    def to_sexp
      [:bool, text_value != "#f"]    
    end
  end

  class IfElse < Treetop::Runtime::SyntaxNode
    # p 4
    def to_sexp
      [[:if, elements[0].to_sexp], [elements[1].to_sexp, elements[2].to_sexp]]
    end
  end

  class Symbol  < Treetop::Runtime::SyntaxNode
    def to_sexp
    [:symbol, text_value.strip.to_sym]
    end
  end

  class Symbols < Treetop::Runtime::SyntaxNode
    def to_sexp
    elements.map { |e| e.to_sexp }
    end
  end

  class Args < Treetop::Runtime::SyntaxNode
    def to_sexp
     [:args, text_value.strip[1...-1].split.map(&:to_sym)]
    end
  end

  class Function < Treetop::Runtime::SyntaxNode
    def to_sexp
     [[:func, elements[0].text_value.strip.to_sym], elements[1].to_sexp, elements[2].to_sexp]
    end
  end


  class Whitespace < Treetop::Runtime::SyntaxNode
  end
end 