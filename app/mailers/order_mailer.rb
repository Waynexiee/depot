class OrderMailer < ApplicationMailer
  default from: 'Sam Ruby <wuliao1993_1@163.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received (order,cart)
    @order = order
    @cart = cart
    mail to: @order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped (order)
    @order = order

    mail to: @order.email, subject: 'Pragmatic Store Order Shipped'
  end
end
