lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tree_hierarchy/version'

Gem::Specification.new do |s|
  s.name        = 'tree_hierarchy'
  s.version     = TreeHierarchy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = '2014-04-15'
  s.summary     = "Create a tree structure and update the parent with sum of its child value"
  s.description = <<-EOF
  
  Tree_hierarchy allows to form a tree structure based on parent-child relationship 
  with simple and fast computation for large records. Additional feature of updating
  the parent record with the sum of its child value
  
  EOF
  s.authors     = ["Dheenadhayalan"]
  s.email       = 'dheenaindian@gmail.com'
  s.homepage    =
    'https://github.com/dheenaINDIAN/tree_hierarchy.git'
  s.files       = [
                  "lib/tree_hierarchy.rb",
                  "lib/hierarchy/hierarchy_no_level.rb",
                  "lib/hierarchy/hierarchy_with_level.rb",
                  "lib/hierarchy/added_hierarchy_level.rb",
                  "lib/helper/support_method.rb"
                  ] 
  s.license       = 'MIT'
  s.post_install_message = "Thanks for installing Tree_hierarchy!"

end
