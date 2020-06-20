class FoodItem < ApplicationRecord

  has_many :likes, dependent: :destroy

  after_create :send_slack_notification

  def send_slack_notification
    notifier = Slack::Notifier.new "WEBHOOK_URL", channel: "#default",
                                              username: "notifier"
    notifier.ping ""                                              
  end
end
