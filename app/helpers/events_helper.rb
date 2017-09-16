module EventsHelper
  def hour_24
    self.strftime("%I:%M %p")
  end

  def hour_12
    self.strftime("%l:%M")
  end
end
