module PaymentsHelper
  def link_to_paid(*args)
    link_with_icon({ action: 'payments', icon: 'glyphicon-ok' }, *args)
  end
end
