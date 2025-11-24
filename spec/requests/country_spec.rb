require 'rails_helper'

RSpec.describe "Country", type: :request, inertia: true do
  let(:user) { create(:user) }

  describe "POST /country/select" do
    context "when not authenticated" do
      it "redirects to login" do
        post country_select_path, params: { country: "ru" }
        expect(response).to have_http_status(:redirect)
        expect(response.location).to include(login_path)
      end
    end

    context "when authenticated" do
      it "sets country in session and returns success" do
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "ru" }

        expect(response).to have_http_status(:ok)
      end

      it "accepts valid country code kg" do
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "kg" }

        expect(response).to have_http_status(:ok)
      end

      it "accepts valid country code ru" do
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "ru" }

        expect(response).to have_http_status(:ok)
      end

      it "accepts valid country code us" do
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "us" }

        expect(response).to have_http_status(:ok)
      end

      it "defaults to kg for invalid country code" do
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "invalid" }

        expect(response).to have_http_status(:ok)
      end

      it "persists country selection across requests" do
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "us" }
        get lessons_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["country"]).to eq("us")
      end
    end
  end
end
