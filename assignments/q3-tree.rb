class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def initialize(obj)
    @children = Array.new()
    keys = obj.keys
    if keys != nil
      for i in obj[keys[0]]
        @children.add(Tree.new(i[0],i[1]))
      end
    end
    @node_name = keys[0]
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new({
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {}, 
      'child 4' => {}
    }
  }
})

puts tree
puts tree.children
puts tree.node_name