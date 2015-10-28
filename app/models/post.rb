class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title,
      :presence => {:message => 'Seu post precisa ter um título!'}

  validates :post,
      :presence => {:message => 'Você precisa inserir algum texto no seu post.'}

  validates :scheduled_to,
      :presence => {:message => 'Você precisa agendar uma data de publicação.'}

  validate :scheduled_to_is_in_future?

  def scheduled_to_is_in_future?
    errors.add(:scheduled_to, 'A data de publicação precisa estar no futuro') if self.scheduled_to.nil? || self.scheduled_to < Time.now.in_time_zone
  end

end
