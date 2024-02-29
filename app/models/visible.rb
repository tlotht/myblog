module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

#验证和scope写在这里(类方法)
  included do
    validates :status, inclusion: { in: VALID_STATUSES }

    scope :by_status,->(status){where(status: status) if status.present? }
  end
#也是类方法
  class_methods do 
    def public_count
      where(status: 'public').count 
    end
  end
  
#实例方法
  def archived?
    status == 'archived'
  end
end