class SubmitRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :request_user, class_name: 'User'

  validates :user_id, :task_id, :request_user_id, presence: true
  validate :no_repeated_request, on: :create

  enum status: {依頼中: 1, 依頼済み: 2, 却下: 9}

  private
  def no_repeated_request
    submit_request = SubmitRequest.where(task_id: task_id, status: "依頼中")
    errors.add(:base, "このタスクは既に依頼を出しています") unless submit_request.blank?
  end

end
