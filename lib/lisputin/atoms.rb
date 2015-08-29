module Lisputin
  class Atom
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def self.build(atom, value)
      case atom
      when :integer then Integer.new value
      when :symbol then Symbol.new value
      when :bool
      end
    end
  end

  class Integer < Atom
    def evaluate(environment = {})
      value
    end
  end

  class Symbol < Atom
    def evaluate(environment = {})
      if value.to_s[0] == "-"
        (Negation.build Symbol.new value.to_s[1..-1].to_sym).evaluate(environment)
      elsif environment.has_key? value
        environment[value]
      else
        raise "#{value}: this symbol is not defined"
      end
    end
  end

  class Boolean < Atom
    def evaluate(environment = {})
      value == true
    end
  end
end