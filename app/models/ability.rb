# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Always performed
    can :access, :ckeditor # needed to access Ckeditor file browser

    return unless user.admin?

    # Performed checks for actions:
    can %i[read create destroy], Ckeditor::Picture
    can %i[read create destroy], Ckeditor::AttachmentFile
  end
end
