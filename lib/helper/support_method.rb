module SupportMethod

  def group_result_set(result_set)
    result_set.group_by{|x| nil_check(x.parent_id) }
  end

  def total_calc(result_group,field_set)
    result_group.sum{|x| x[field_set].to_f}
  end
 
  def presence_check(value)
    value.blank?
  end
 
  def level_check(value)
    value == 0
  end

  def compare(arg1,arg2)
    arg1 > arg2
  end
  
  def nil_check(value)
    value ? value.to_i : value
  end
  
end
