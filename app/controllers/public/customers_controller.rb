class Public::CustomersController < ApplicationController
  def withdraw_confirm
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to new_customer_registration_path
  end
end
