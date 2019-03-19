# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, #:validatable,
         :confirmable, :trackable, :omniauthable,
         omniauth_providers: %i[steam vkontakte]
  validates :nickname, presence: true
  validates :nickname, format: { with: /\A[a-z0-9\-_]+\z/i,
                                 message: 'Никнейм содержит недопустимые символы' }

  has_many :comments
  has_many :authorizations, dependent: :destroy

  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if params[:password].blank? || valid_password?(current_password) || password_generated
               correct_password(params, *options)
             else
               wrong_password(params, *options, current_password)
             end

    clean_up_passwords
    result
  end

  def correct_password(params, *options)
    params[:password_generated] = false if params[:password].present?
    update_attributes(params, *options)
  end

  def wrong_password(params, *options, current_password)
    assign_attributes(params, *options)
    valid?
    errors.add(:current_password, current_password.blank? ? :blank : :invalid)
    false
  end

  def connection_with?(provider)
    auth = authorizations.where(provider: provider).first
    if auth.present?
      auth.uid.present?
    else
      false
    end
  end
end
