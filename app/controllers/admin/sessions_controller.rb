class Admin::SessionsController < Admin::Base
  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      admin_member = Administrator.find_by(email_for_index: @form.email.downcase)
    end
    if admin_member
      session[:administrator_id]=admin_member.id
      redirect_to :admin_root
    else
      render action: 'new'
    end
  end

  def destroy
    session.delete(:administrator_id)
    redirect_to :admin_root
  end

end