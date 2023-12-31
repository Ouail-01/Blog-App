class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new

    if user.role == 'admin'
      can :manage, :all
    else

      can :read, Post, public: true
      can :read, Comment, public: true
      can :manage, Post, author: user
      can :manage, Comment, author: user
      can :read, :all
      can :destroy, Comment.where(author_id: user.id)
      can :destroy, Post.where(author_id: user.id)
    end
  end
end
