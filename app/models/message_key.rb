# == Schema Information
#
# Table name: message_keys
#
#  id                 :bigint(8)        not null, primary key
#  replyable_type     :string           not null
#  replyable_id       :integer          not null
#  reply_sender_id    :integer          not null
#  reply_recipient_id :integer          not null
#  key                :uuid             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_message_keys_on_key  (key) UNIQUE
#
# Foreign Keys
#
#  message_keys_reply_recipient_id_fkey  (reply_recipient_id => users.id)
#  message_keys_reply_sender_id_fkey     (reply_sender_id => users.id)
#

class MessageKey < ActiveRecord::Base

  belongs_to :reply_sender, :class_name => "User", :foreign_key => :reply_sender_id
  belongs_to :reply_recipient, :class_name => "User", :foreign_key => :reply_recipient_id

  before_validation { self.key ||= self.class.generate_message_key }
  
  def self.generate_message_key
      SecureRandom.hex(16)
  end

end
