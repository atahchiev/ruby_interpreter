# In file parser.rb
require 'treetop'

# Find out what our base path is
BASE = File.expand_path(File.dirname(__FILE__))

# Load our custom syntax node classes so the parser can use them
require File.join(BASE, 'node_extensions.rb')
Treetop.load(File.join(BASE, 'parser.treetop'))

module Lisputin
  class Parser

    # Load the Treetop grammar from the 'sexp_parser' file, and 
    # create a new instance of that parser as a class variable 
    # so we don't have to re-create it every time we need to 
    # parse a stri    Treetop.load(File.join(BASE, 'parser.treetop'))
    @@parser = Lisputin::R5RSParser.new

    def self.parse(data)
      tree = (@@parser.parse(data))
      clean_tree(tree)
      if(tree.nil?)
        raise Exception, "Parser error bad input #{@@parser.index}" 
      end

      return tree
    end

    private
    # line
     
    def self.clean_tree(root_node)
      return if root_node.elements.nil?
      root_node.elements.delete_if do |node| 
      node.class.name == "Treetop::Runtime::SyntaxNode" and node.terminal? or\
      node.text_value == " " or node.text_value == ""
      end
      root_node.elements.each {|node| self.clean_tree(node) }
    end
  end

  # Treetop.load(File.join(BASE, 'parser.treetop'))
  # cat = Parser.new
  # Parser.parse('(+ 126 123)').elements[0].elements.each{|node| p "lin", node }
  p Parser.parse('(define dog (a v ) (+ 2 3))').to_sexp
  # p cat.parse('(+ 100 12)').class
  # p cat.parse('"jesus"').class
end
