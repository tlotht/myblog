class Comment < ApplicationRecord
  belongs_to :article
end

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  commenter  :string(255)
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
