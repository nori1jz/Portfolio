class Public::ContactsController < ApplicationController
  
  def new
    @contact = current_customer.contacts.new
    @contact.company = current_customer.company
    @contact.email = current_customer.email
  end

  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行。
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  
  # 入力内容に誤りがあった場合、
  # 入力内容を保持したまま前のページに戻る.
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 送信するアクション。
  # ここで入力内容を保存。
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to public_done_path
    else
      render :new
    end
  end

  # 送信完了画面
  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_id, :customer_id, :company, :email, :name, :subject, :message)
  end
end
