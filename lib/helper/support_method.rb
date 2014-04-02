module SupportMethod

  def group_result_set(result_set) 
    result_set.group_by(&:parent_id)
  end

  def total_calc(result_group,field_set)
    result_group.sum{|x| x[field_set].to_i}
  end

end
