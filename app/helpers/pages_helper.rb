module PagesHelper
	def percent_of(number, total)
    number.to_f / total.to_f * 100.0
  end

  def consumable_total(supplies)
  	supplies.price * supplies.units_bought
  end

  def total_cogs(supplies)
  	supplies.map{|consumable| consumable.cogs}.sum
  end

  def total_operative_expenses(supplies)
  	supplies.map{|operative_expenses| operative_expenses.units_bought}.sum
  end
end