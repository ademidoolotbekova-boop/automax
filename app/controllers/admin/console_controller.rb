class Admin::ConsoleController < Admin::BaseController
  after_action :verify_authorized

  def index
    authorize :console, :index?
    total_users = User.count
    owners = User.where(owner: true).count

    render inertia: "Admin/Console", props: {
      stats: {
        total_users: total_users,
        owners: owners,
        regular_users: total_users - owners,
        active_sessions: RefreshToken.active.count
      }
    }
  end
end
