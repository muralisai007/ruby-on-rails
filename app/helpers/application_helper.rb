module ApplicationHelper
	 def clp_currency(amount)
    number_to_currency(amount, unit: 'CLP $', delimiter: '.')
  end
end
