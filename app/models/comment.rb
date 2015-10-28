class Comment < ActiveRecord::Base
  #define que o comentario pertence a um post
  belongs_to :post

  #valida a presença do nome no comentario
  validates :name,
      :presence => {message: 'Seu nome é obrigatório'}

  #valida a presença de um email
  validates :email,
      :presence => {message: 'E-mail não pode estar em branco'}

  #valida o formato do email (is_valid?)
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, message: 'O email digitado é inválido'

  #valida presença de um texto no comentário
  validates :comment,
      :presence => {message: 'Você precisa digitar um comentário.'}


end
