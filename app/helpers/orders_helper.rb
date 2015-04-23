module OrdersHelper
  def select_user(name, selected = nil)
    select_tag(name, options_for_select(User.order('email').load.map{ |x| [x.email, x.id] } + [['', nil]],[selected]))
  end
  def select_status(name, selected = nil)
    select_tag(name, options_for_select([['Оформлен',1],['Подтвержден',2],['Доставляется',3],['Завершен',4],['Отменен',5]],[selected]))
  end
end
