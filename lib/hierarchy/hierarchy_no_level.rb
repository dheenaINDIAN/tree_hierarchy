module HierarchyNoLevel

  def hierarchy(result_set,depth = 0)
    result_group = group_result_set(result_set)
    level_check(depth) ? self.tree_structure(result_set,result_group) : self.tree_structure_depth(result_set,result_group,depth.to_i)
  end

  def tree_structure(result_set,result_group)
    presence_check(result_group[self.id]) ? self.attributes : self.attributes.merge({:children => result_group[self.id].map{|x| x.tree_structure(result_set,result_group)}}) 
  end

  def tree_structure_depth(result_set,result_group,depth,increment = 1)
    presence_check(result_group[self.id]) ? self.attributes : self.attributes.merge({:children => result_group[self.id].map{|x| x.tree_structure_depth(result_set,result_group,depth,increment + 1)}}) unless compare(increment,depth) 
  end

end 
