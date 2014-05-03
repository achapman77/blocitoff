class TaskPolicy < ApplicationPolicy

  def destroy?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
end
#see: https://www.bloc.io/users/adam-chapman--2/checkpoints/310