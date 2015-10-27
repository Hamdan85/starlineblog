class PagesController < ApplicationController
  def index

    if params[:page].present?
      page =  params[:page]
    else
      page = 1
    end

    @posts = Post.where(
        'scheduled_to <= :today',
        :today => Date.today
    ).page(page).per(5)

  end
end
