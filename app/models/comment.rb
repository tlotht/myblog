class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  # scope :status_public,->{where(status: 'public')}
  # scope :status_private,->{where(status: 'private')}
  # scope :status_archived,->{where(status: 'archived')}

end

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  commenter  :string(255)
#  status     :string(255)      default("public")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#
