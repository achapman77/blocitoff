class TaskPolicy < ApplicationPolicy

  def index?
    true
  end

  def destroy?
    user.present? && (record.user == user || user.role?(:admin))
  end
end
#see: https://www.bloc.io/users/adam-chapman--2/checkpoints/310