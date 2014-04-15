module HierarchyWithLevel

  def hierarchy_level(result_set,depth = 0)
    result_group = group_result_set(result_set)
    level_check(depth) ? self.tree_structure_level(result_set,result_group) : self.tree_structure_depth_level(result_set,result_group,depth.to_i)
  end

  def tree_structure_level(result_set,result_group,increment = 1)
    presence_check(result_group[self.id]) ? self.attributes.merge({:level => increment}) : self.attributes.merge({:level => increment, :children => result_group[self.id].map{|x| x.tree_structure_level(result_set,result_group,increment + 1)}}) 
  end

  def tree_structure_depth_level(result_set,result_group,depth,increment = 1)
    presence_check(result_group[self.id]) ? self.attributes.merge({:level => increment}) : self.attributes.merge({:level => increment, :children => result_group[self.id].map{|x| x.tree_structure_depth_level(result_set,result_group,depth,increment + 1)}}) unless compare(increment,depth)
  end

  def hchildren(result_set)
    result_group = group_result_set(result_set)
    self.hchildren_structure(result_set,result_group)
  end

  def hchildren_ids(result_set)
    result_group = group_result_set(result_set)
    self.hchildren_structure_ids(result_set,result_group)
  end
 
  def hchildren_structure(result_set,result_group)
      result_group[self.id] unless presence_check(result_group[self.id]) 
  end

  def hchildren_structure_ids(result_set,result_group)
      result_group[self.id].map(&:id) unless presence_check(result_group[self.id]) 
  end

end
