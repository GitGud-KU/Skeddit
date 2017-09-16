module EventsHelper
  def self.hour_24(x)
    x.strftime("%H:%M")
  end

  def self.hour_12(x)
    x.strftime("%I:%M %p")
  end
end
