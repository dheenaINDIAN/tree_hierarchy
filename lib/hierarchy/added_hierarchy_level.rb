module AddedHierarchyLevel

  @@result_group = []
  @@linear = []

  def added_hierarchy(result_set,args,depth = 0)
    initial = initial_load(result_set,args)
    level_check(depth) ? initial.tree_structure(result_set,@@result_group) : initial.tree_structure_depth(result_set,@@result_group,depth.to_i)
  end
 
  def added_hierarchy_level(result_set,args,depth = 0)
    initial = initial_load(result_set,args)
    level_check(depth) ? initial.tree_structure_level(result_set,@@result_group) : initial.tree_structure_depth_level(result_set,@@result_group,depth.to_i)
  end

  def added_hchildren(result_set,args)
    children_group(result_set,args)
    self.hchildren_structure(result_set,@@result_group)
  end
  
  def added_hchildren_ids(result_set,args)
    children_group(result_set,args)
    self.hchildren_structure_ids(result_set,@@result_group)
  end

  def linear_level(result_set,depth = 0)
    result_group = linear_load(result_set)
    level_check(depth) ? self.linear_structure_level(result_set,result_group) : self.linear_structure_depth_level(result_set,result_group,depth.to_i)
    return @@linear
  end

  def linear(result_set,depth = 0)
    result_group = linear_load(result_set)
    level_check(depth) ? self.linear_structure(result_set,result_group) : self.linear_structure_depth(result_set,result_group,depth.to_i)
    return @@linear
  end

  def added_linear(result_set,args,depth = 0)
    initial = added_linear_load(result_set,args)
    level_check(depth) ? initial.linear_structure(result_set,@@result_group) : initial.linear_structure_depth(result_set,@@result_group,depth.to_i)
    return @@linear
  end
  
  def added_linear_level(result_set,args,depth = 0)
    initial = added_linear_load(result_set,args)
    level_check(depth) ? initial.linear_structure_level(result_set,@@result_group) : initial.linear_structure_depth_level(result_set,@@result_group,depth.to_i)
    return @@linear
  end
 
  def added_linear_load(result_set,args)   
    @@linear = initialise_array()
    initial_load(result_set,args)
  end
 
  def initialise_array()
    []
  end
  
  def parent_child_add(field_set)
    unless presence_check(@@result_group[self.id])
      @@result_group[self.id].map{|x| x.parent_child_add(field_set)}
        @@result_group[nil_check(self.parent_id)].each do|x| 
          next unless x.id == self.id
            for i in 0..field_set.length-1
              x[field_set[i]] = total_calc(@@result_group[self.id],field_set[i])
            end
        end
    end 
  end

  def linear_structure_level(result_set,result_group,increment = 1)
    @@linear <<  self.attributes.merge(:level => increment)
    result_group[self.id].map{|x| x.linear_structure_level(result_set,result_group,increment+1)} unless presence_check(result_group[self.id])
  end

  def linear_structure_depth_level(result_set,result_group,depth,increment = 1)
    unless compare(increment,depth)
      @@linear << self.attributes.merge({:level => increment})
      result_group[self.id].map{|x| x.linear_structure_depth_level(result_set,result_group,depth,increment + 1)} unless presence_check(result_group[self.id]) 
    end
  end

  def linear_structure(result_set,result_group)
    @@linear << self
    result_group[self.id].map{|x| x.linear_structure(result_set,result_group)} unless presence_check(result_group[self.id])
  end

  def linear_structure_depth(result_set,result_group,depth,increment = 1)
    unless compare(increment,depth)
      @@linear << self
      result_group[self.id].map{|x| x.linear_structure_depth(result_set,result_group,depth,increment + 1)} unless presence_check(result_group[self.id]) 
    end
  end

private


  def initial_load(result_set,args)
    children_group(result_set,args)
    @@result_group[nil_check(self.parent_id)].select{|x| x.id == self.id}.first
  end 
  
  def children_group(result_set,args)
    @@result_group = group_result_set(result_set)
    parent_child_add(args)
  end

  def linear_load(result_set)
    @@linear = initialise_array()
    group_result_set(result_set)
  end

  def added_linear_load(result_set,args)   
    @@linear = initialise_array()
    initial_load(result_set,args)
  end
 
  def initialise_array()
    []
  end
  
end
