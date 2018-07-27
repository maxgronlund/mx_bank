json.extract! user, :id, :uuid, :name, :given_name, :family_name, :nickname, :preferred_username, :profile, :picture, :website, :email, :email_verified, :gender, :birthdate, :zoneinfo, :locale, :phone_number, :phone_number_verified, :address, :public_key, :created_at, :updated_at
json.url user_url(user, format: :json)
