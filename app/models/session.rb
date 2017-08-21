class Session < ApplicationRecord
  def self.sweep(time = 30.minutes)
    if time.is_a? String
      time = time.split.reduce { |amount, unit| amount.to_i.send(unit) }
    end

    delete_all "updated_at < '#{time.ago.to_s(:db)}' OR created_at < '#{2.days.to_s(:db)}'"
  end
end
