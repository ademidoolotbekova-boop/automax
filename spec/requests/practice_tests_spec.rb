require 'rails_helper'

RSpec.describe "PracticeTests", type: :request, inertia: true do
  let(:user) { create(:user) }

  describe "GET /practice-tests" do
    context "when not authenticated" do
      it "redirects to login" do
        get practice_tests_path
        expect(response).to have_http_status(:redirect)
        expect(response.location).to include(login_path)
      end
    end

    context "when authenticated" do
      it "renders the practice tests page" do
        get practice_tests_path, headers: auth_headers(user, inertia: true)

        expect(response).to have_http_status(:ok)
        expect(inertia).to render_component("PracticeTests/Index")
      end

      it "includes breadcrumbs in props" do
        get practice_tests_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["breadcrumbs"]).to be_an(Array)
        expect(inertia.props["breadcrumbs"].last["label"]).to eq("Practice Tests")
      end

      it "includes selected country in props" do
        get practice_tests_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["country"]).to eq("kg")
      end
    end
  end
end
