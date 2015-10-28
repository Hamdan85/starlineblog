class User < ActiveRecord::Base

  #define parametros do modelo de usuários
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #estabelece a relação de que um usuário tem vários posts
  has_many :posts

  #valida a presença do nome do usuário no registro
  validates :name,
      :presence => true

  #define a url do blog do usuario como uma strins do tipo id-nome-do-usuario
  def to_param
    "#{id} #{name}".parameterize
  end
end
