require "hierarchy/hierarchy_no_level"
require "hierarchy/hierarchy_with_level"
require "hierarchy/added_hierarchy_level"
require "helper/support_method"

class ActiveRecord::Base  
  include HierarchyNoLevel 
  include HierarchyWithLevel
  include AddedHierarchyLevel
  include SupportMethod 
end 
