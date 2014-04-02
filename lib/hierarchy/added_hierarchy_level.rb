module AddedHierarchyLevel

  @@result_group = []

  def added_hierarchy(result_set,depth = 0,*args)
    @@result_group = group_result_set(result_set)
    parent_child_add(args)
    (depth == 0) ? self.tree_structure(result_set,@@result_group) : self.tree_structure_depth(result_set,@@result_group,depth.to_i)
  end
 
  def added_hierarchy_level(result_set,depth = 0, *args)
    @@result_group = group_result_set(result_set)
    parent_child_add(args)
    (depth == 0) ? self.tree_structure_level(result_set,@@result_group) : self.tree_structure_depth_level(result_set,@@result_group,depth.to_i)
  end

  def parent_child_add(field_set)
    case field_set.length
    when 0
    when 1
      calc_of_parent_one(field_set)
    when 2
      calc_of_parent_two(field_set)
    when 3
      calc_of_parent_three(field_set)
    when 4
      calc_of_parent_four(field_set)
    else
      calc_of_parent_five(field_set)
    end
  end

  # Code repetiation occurs to avoid unwanted conditions during execution 
  # If these codes are combained together, more conditions need to check for each looping and updating of @@result_group become too complex, this affect the performance

  def calc_of_parent_one(field_set)
    unless @@result_group[self.id].blank?
      @@result_group[self.id].map{|x| x.calc_of_parent_one(field_set)}
      sum_value = total_calc(@@result_group[self.id],field_set[0]) 
      @@result_group[self.parent_id].map{|x| x.id == self.id && x[field_set[0]] = sum_value}
    end 
  end
  
  def calc_of_parent_two(field_set)
    unless @@result_group[self.id].blank?
      @@result_group[self.id].map{|x| x.calc_of_parent_two(field_set)}
      sum_value0,sum_value1 = total_calc(@@result_group[self.id],field_set[0]),total_calc(@@result_group[self.id],field_set[1])
      @@result_group[self.parent_id].map{|x| (x.id == self.id) && (x[field_set[0]] = sum_value0) && (x[field_set[1]] = sum_value1)}
    end 
  end

  def calc_of_parent_three(field_set)
    unless @@result_group[self.id].blank?
      @@result_group[self.id].map{|x| x.calc_of_parent_three(field_set)}
      sum_value0,sum_value1,sum_value2 = total_calc(@@result_group[self.id],field_set[0]),total_calc(@@result_group[self.id],field_set[1]),total_calc(@@result_group[self.id],field_set[2])
      @@result_group[self.parent_id].map{|x| (x.id == self.id) && (x[field_set[0]] = sum_value0) && (x[field_set[1]] = sum_value1) && (x[field_set[2]] = sum_value2)}
    end 
  end

  def calc_of_parent_four(field_set)
    unless @@result_group[self.id].blank?
      @@result_group[self.id].map{|x| x.calc_of_parent_four(field_set)}
      sum_value0,sum_value1,sum_value2,sum_value3 = total_calc(@@result_group[self.id],field_set[0]),total_calc(@@result_group[self.id],field_set[1]),total_calc(@@result_group[self.id],field_set[2]),total_calc(@@result_group[self.id],field_set[3])
      @@result_group[self.parent_id].map{|x| (x.id == self.id) && (x[field_set[0]] = sum_value0) && (x[field_set[1]] = sum_value1) && (x[field_set[2]] = sum_value2) && (x[field_set[3]] = sum_value3)}
    end 
  end

  def calc_of_parent_five(field_set)
    unless @@result_group[self.id].blank?
      @@result_group[self.id].map{|x| x.calc_of_parent_five(field_set)}
      sum_value0,sum_value1,sum_value2,sum_value3,sum_value4 = total_calc(@@result_group[self.id],field_set[0]),total_calc(@@result_group[self.id],field_set[1]),total_calc(@@result_group[self.id],field_set[2]),total_calc(@@result_group[self.id],field_set[3]),total_calc(@@result_group[self.id],field_set[4])
      @@result_group[self.parent_id].map{|x| (x.id == self.id) && (x[field_set[0]] = sum_value0) && (x[field_set[1]] = sum_value1) && (x[field_set[2]] = sum_value2) && (x[field_set[3]] = sum_value3) && (x[field_set[4]] = sum_value4)}
    end 
  end

end
