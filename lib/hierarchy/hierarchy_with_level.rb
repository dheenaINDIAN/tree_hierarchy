module HierarchyWithLevel

  def hierarchy_level(result_set,depth = 0)
    result_group = group_result_set(result_set)
    (depth == 0) ? self.tree_structure_level(result_set,result_group) : self.tree_structure_depth_level(result_set,result_group,depth.to_i)
  end

  def tree_structure_level(result_set,result_group,increment = 1)
    result_group[self.id].blank? ? self.attributes.merge({:level => increment}) : self.attributes.merge({:level => increment, :children => result_group[self.id].map{|x| x.tree_structure_level(result_set,result_group,increment + 1)}}) 
  end

  def tree_structure_depth_level(result_set,result_group,depth,increment = 1)
    result_group[self.id].blank? ? self.attributes.merge({:level => increment}) : self.attributes.merge({:level => increment, :children => result_group[self.id].map{|x| x.tree_structure_depth_level(result_set,result_group,depth,increment + 1)}}) unless increment > depth 
  end

end
