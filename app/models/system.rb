module System
  VISA = 'visa'
  MARSTERCARD = 'master_card'
  PAYPALL = 'paypall'
  STRIPE = 'stripe'
  BITCOINS = 'bitcoins'

  PAYMENT_PROVIDERS =
    [
      [I18n.t(VISA), VISA],
      [I18n.t(MARSTERCARD), MARSTERCARD],
      [I18n.t(STRIPE), STRIPE],
      [I18n.t(PAYPALL), PAYPALL],
      [I18n.t(BITCOINS), BITCOINS]
    ].freeze

  def self.administrator
    @@administrator ||=
      System::Admin.first_or_create(uuid: SecureRandom.uuid)
  end

  def self.table_name_prefix
    'system_'
  end

  def self.balance
    return 0.0 if admin_user.nil?
    Transaction.where(recipient: admin_user.uuid).sum(:amount)
    #admin_user.balance
  end

  def self.admin_user
    User.find_by(uuid: administrator.uuid)
  end

  def self.uuid
    @@uuid ||= Rails.configuration.uuid
  end
end
