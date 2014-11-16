class Hash
  def compact
    select { |_,v| !v.nil? }
  end

  def compact!
    select! { |_,v| !v.nil? }
  end
end
