class UsersController < ApplicationController
  before_filter :set_user

  def show

    if params[:page].present?
      page =  params[:page]
    else
      page = 1
    end

    if user_signed_in? && current_user == @user
      @posts = current_user.posts.page(page).per(5)
    else
      @posts = current_user.posts.where(
          'scheduled_to <= :today',
          :today => Date.today
      ).page(page).per(5)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end