class FoodItem < ApplicationRecord

  has_many :likes, dependent: :destroy

  after_create :send_slack_notification

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def send_slack_notification
    notifier = Slack::Notifier.new(Rails.application.secrets.WEBHOOK_URL, channel: "#food-dedicated", username: "Restuarant")
    message_attachment = self.avatar.url(:medium)
    message = {
    	menu_name: "#{self.title}",
    	description: "#{self.description}",
    	attachment: "#{self.avatar.url(:medium)}"

	}
    notifier.ping "#{message}"
  end
end
