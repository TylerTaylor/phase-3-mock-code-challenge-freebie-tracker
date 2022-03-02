class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    Freebie.create(item_name: item_name, value: value, dev: dev, company: self)
  end

  def self.oldest_company
    # y = self.all.minimum(:founding_year)
    # self.find_by(founding_year: y)

    # self.order(:founding_year).first

    all.order(:founding_year).first
  end

end
