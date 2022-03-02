class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    # if self.freebies.find_by(item_name: item_name) == nil
    #   false
    # else
    #   true
    # end

    # if self.freebies.find_by(item_name: item_name)
    #   true
    # else
    #   false
    # end

    self.freebies.any? do |freebie|
      freebie.item_name == item_name
    end
  end

  def give_away(dev, freebie)
    # if self.received_one?(freebie.item_name)
    #   freebie.update(dev_id: dev.id)
    # end

    # if freebie.dev == self
    #   freebie.update(dev_id: dev.id)
    # end

    # freebie.dev == self ? freebie.update(dev: dev) : nil

    # freebie.update(dev: dev) unless freebie.dev != self
    freebie.update(dev: dev) if freebie.dev == self
  end
end
