class Article < ApplicationRecord
  include Visible

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  # scope :status_public,->{where(status: 'public')}
  # scope :status_private,->{where(status: 'private')}
  # scope :status_archived,->{where(status: 'archived')}


end

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  status     :string(255)      default("public")
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
