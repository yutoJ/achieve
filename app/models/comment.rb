class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  validates :content, presence: true
  has_many :notifications, dependent: :destroy

  def notify_new_comment
    Pusher.trigger("user_#{self.blog.user_id}_channel", 'comment_created',{
        message: 'あなたの作成したブログにコメントが付きました!'
    })
  end

  def notify_num_unread_comments
    Pusher.trigger("user_#{self.blog.user_id}_channel", 'notification_created',{
        unread_counts: Notification.where(user_id: self.blog.user_id, read: false).count
    })
  end
end
