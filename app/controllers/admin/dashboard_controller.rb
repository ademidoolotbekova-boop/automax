class Admin::DashboardController < Admin::BaseController
  after_action :verify_authorized

  def index
    authorize :dashboard, :index?
    render inertia: "Admin/Dashboard", props: {
      stats: {
        total_users: User.count,
        super_admins: User.where(super_admin: true).count,
        admins: User.where(role: "admin").count,
        regular_users: User.where(role: "user").count,
        active_sessions: RefreshToken.active.count
      }
    }
  end
end
