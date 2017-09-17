class DateTime
  def hour_24
    self.strftime("%H:%M")
  end

  def hour_12
    self.strftime("%I:%M %p")
  end
end