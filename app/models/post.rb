class Post < ActiveRecord::Base

  #define que um post pertence a um usuário
  belongs_to :user
  #define que um post tem muitos comentarios
  has_many :comments

  #valida a presença de um título
  validates :title,
      :presence => {:message => 'Seu post precisa ter um título!'}

  #valida a presença do texto do post
  validates :post,
      :presence => {:message => 'Você precisa inserir algum texto no seu post.'}

  #valida a presença da data de publicação
  validates :scheduled_to,
      :presence => {:message => 'Você precisa agendar uma data de publicação.'}

  #impede que a data de validação esteja no passado
  validate :scheduled_to_is_in_future?

  def scheduled_to_is_in_future?
    errors.add(:scheduled_to, 'A data de publicação precisa estar no futuro') if self.scheduled_to.nil? || self.scheduled_to < Time.zone.now
  end

end
