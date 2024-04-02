# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  # Alte metode de autorizare generice...

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.none
    end
  end
end

# app/policies/user_policy.rb
class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  # Alte metode de autorizare pentru utilizatori...
end

# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    record.user == user || user.admin?
  end

  def destroy?
    record.user == user || user.admin?
  end

  # Alte metode de autorizare pentru postări...
end

# app/policies/comment_policy.rb
class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    record.user == user || user.admin?
  end

  # Alte metode de autorizare pentru comentarii...
end

