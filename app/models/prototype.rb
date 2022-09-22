class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
 #  dependent: :destroyで、親モデルが削除されたとき、それに紐付く子モデルも一緒に削除される。
  has_one_attached :image



  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true  
  validates :image, presence: true, unless: :was_attached? #←unless: :was_attached?は、もしかしたらいらないかも？

  #以下の記述はもしかしたらいらないかも？
  def was_attached?
    self.image.attached?
  end



  

end
