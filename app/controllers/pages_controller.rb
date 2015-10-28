class PagesController < ApplicationController
  def index

    #parametros de paginação (se presente)
    if params[:page].present?
      page =  params[:page]
    else
      page = 1
    end

    #seleciona apenas posts em que a data de publicação chegou ou ja passou
    @posts = Post.where(
        'scheduled_to <= :now',
        :now => Time.zone.now
    ).page(page).per(5)

  end
end
