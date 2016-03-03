class UsersController < ApplicationController
  skip_before_action :is_logged

# 注册、登录、退出部分
  def signup
      @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
        flash[:notice] = "用户注册更新成功！"
        redirect_to :root
    else
        render 'signup'
    end
  end



  def signin
      @user = User.new
  end

  def login
    user = User.find_by_name(params[:user][:name])
    if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        flash[:notice] = "登录成功！"
        redirect_to :root
    else
        flash[:error] = "用户名或密码错误！"
        render 'signin'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "退出成功！"
    redirect_to :root
  end

#首页、用户资料修改

  def welcome

  end

  def edit
    @user =current_user
  end

  def update
      @user = current_user

      if @user.update_attributes(user_params)
          flash[:notice] = "用户资料更新成功！"
          redirect_to :action => 'edit'
      else
          render 'edit'
      end


  end



  private
  def user_params
    params.require(:user).permit!
  end
end
