class Memo < ApplicationRecord
  mount_uploader :content_image, ContentImageUploader

  belongs_to :user

  validates :title,  length: { minimum: 1 }
  validates :content_image, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[title body]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
