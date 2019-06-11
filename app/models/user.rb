class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.authenticate_social_login(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      begin
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        case auth.provider
        when 'linkedin'
          user.image = auth.info.picture_url
        when 'instagram'
          user.image = auth.info.image
        else
          user.image = auth.info.image
        end
        user.save(validate: false)
      rescue
        return nil
      end
		end
	end

end



