class DateTime

  # PRE: None
  # POST: None
  def hour_24
    self.strftime("%H:%M")
  end

  # PRE: None
  # POST: None
  def hour_12
    self.strftime("%I:%M %p")
  end
end