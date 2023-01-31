class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: @user.try(:id)).or(scope.where(@user.editor?))
    end
  end

  def show?
    @user.writer? || @user.editor?
  end

  def create?
    @user.writer? # a writer is able to create a post
  end

  def edit?
    @user.writer? || @user.editor?
  end

  def update?
    @user.writer? || @user.editor?
  end

  def delete?
    @user.writer?
  end
end
