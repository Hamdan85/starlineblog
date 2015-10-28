class Comment < ActiveRecord::Base
  belongs_to :post

  validates :name,
      :presence => {message: 'Seu nome é obrigatório'}

  validates :email,
      :presence => {message: 'E-mail não pode estar em branco'}

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, message: 'O email digitado é inválido'

  validates :comment,
      :presence => {message: 'Você precisa digitar um comentário.'}


end
