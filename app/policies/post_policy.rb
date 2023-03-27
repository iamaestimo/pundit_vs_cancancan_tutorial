class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user_id: @user.try(:id)).or(scope.where(@user.editor?))

      if user.editor?
        # an editor can only access posts in "draft" status
        scope.where(published: false)
      else # assumes this is a writer
        # can access a post if they are the author
        scope.where(user: user)
      end
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
