class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
 
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customer_path, notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:company, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :telephone_number, :email, :is_deleted)
    end
end
