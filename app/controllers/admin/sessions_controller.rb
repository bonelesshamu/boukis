# -*- coding: utf-8 -*-
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
    if Admin::Authenticator.new(admin_member).authenticate(@form.password)
      if admin_member.suspended == false
        session[:administrator_id]=admin_member.id
        flash.notice = 'ログインしました'
        redirect_to :admin_root
      else
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_root
  end

end
