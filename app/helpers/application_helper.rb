module ApplicationHelper
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url,alt: user.username, class:"rounded")
        
    end

    def show_errors(object, field_name)
        if object.errors.any?
          if !object.errors.messages[field_name].blank?
            object.errors.messages[field_name].join(", ")
          end
        end
      end
    
end
