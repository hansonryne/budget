module ApplicationHelper
  def get_single_percentage(month, amount)
    if month.incomes.sum(&:net_amount) == 0
      "Add Incomes"
    else
      '%.2f %%' % (amount / month.incomes.sum(&:net_amount) * 100)
    end
  end
  
  def get_total_percentage(month, type)
    if month.incomes.sum(&:net_amount) == 0
      "Add Incomes"
    else
      case type
        when 'bills'
          '%.2f %%' % (month.bills.sum(&:amount) / month.incomes.sum(&:net_amount) * 100)
        when 'savings'
          '%.2f %%' % (month.savings.sum(&:amount) / month.incomes.sum(&:net_amount) * 100)
        when 'incomes'
          '%.2f %%' % (month.incomes.sum(&:net_amount) / month.incomes.sum(&:net_amount) * 100)
        when 'leftovers'
          '%.2f %%' % (month.get_leftovers / month.incomes.sum(&:net_amount) * 100)
        else
          'Check Something'
      end
    end
  end
end
