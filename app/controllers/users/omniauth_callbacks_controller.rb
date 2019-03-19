# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token

    def steam
      oauthorize 'Steam'
    end

    def vkontakte
      oauthorize 'Vkontakte'
    end

    def failure
      redirect_to root_path
    end

    private

    def oauthorize(kind)
      @user = find_for_ouath(kind, request.env['omniauth.auth'], current_user)
      return unless @user

      if flash[:error]
        flash[:error]
        redirect_to edit_user_registration_path
      else
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: kind
        session["devise.#{kind.downcase}_data"] = request.env['omniauth.auth']
        sign_in_and_redirect @user, event: :authentication
      end
    end

    def find_for_ouath(provider, access_token, resource = nil)
      user = nil
      auth_attr = {}
      case provider
      when 'Steam'
        auth_attr = { uid: access_token['uid'], name: access_token['info']['nickname'] }
      when 'Vkontakte'
        auth_attr = { uid: access_token['uid'], name: access_token['info']['name'],
                      token: access_token['credentials']['token'],
                      first_name: access_token['info']['first_name'],
                      last_name: access_token['info']['last_name'],
                      link: access_token['extra']['raw_info']['id'] }
      else
        raise "Provider #{provider} not handled"
      end

      if !resource.nil?
        user = resource
      elsif resource.nil? && auth_attr[:uid] && auth_attr[:name]
        user = find_for_oauth_by_uid(auth_attr[:uid], provider)
        user = create_user_for_oauth(auth_attr[:name]) if user.nil?
      end

      update_ouath_params(provider, user, auth_attr)
      user
    end

    def update_ouath_params(provider, user, auth_attr)
      auth = user.authorizations.find_by_provider(provider)
      if resource.nil? || (resource && Authorization.find_by(provider: provider, uid: auth_attr[:uid]).nil?)
        if auth.nil?
          auth = user.authorizations.build(provider: provider)
          user.authorizations << auth
        end
        auth.update_attributes auth_attr
      else
        flash[:error] = "Этот профиль #{provider} уже используется"
      end
    end

    def find_for_oauth_by_uid(uid, provider)
      user = nil
      auth = Authorization.find_by(uid: uid.to_s, provider: provider)
      user = auth.user if auth
      user
    end

    def create_user_for_oauth(nickname)
      user = User.new(nickname: nickname,
                      password: Devise.friendly_token[0, 20],
                      password_generated: true)
      user.save(validate: false)
      user.skip_confirmation!
      user
    end
  end
end
