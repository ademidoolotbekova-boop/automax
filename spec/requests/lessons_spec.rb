require 'rails_helper'

RSpec.describe "Lessons", type: :request, inertia: true do
  let(:user) { create(:user) }

  describe "GET /lessons" do
    context "when not authenticated" do
      it "redirects to login" do
        get lessons_path
        expect(response).to have_http_status(:redirect)
        expect(response.location).to include(login_path)
      end
    end

    context "when authenticated" do
      it "renders the lessons index page with categories" do
        get lessons_path, headers: auth_headers(user, inertia: true)

        expect(response).to have_http_status(:ok)
        expect(inertia).to render_component("Lessons/Index")
        expect(inertia).to include_props("categories")
        expect(inertia.props["categories"]).to be_an(Array)
        expect(inertia.props["categories"].length).to eq(7)
      end

      it "includes breadcrumbs in props" do
        get lessons_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["breadcrumbs"]).to be_an(Array)
        expect(inertia.props["breadcrumbs"].last["label"]).to eq("Browse Lessons")
      end

      it "includes selected country in props" do
        get lessons_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["country"]).to eq("kg")
      end

      it "respects session country preference" do
        # Set session by making a request to country selector first
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "ru" }
        get lessons_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["country"]).to eq("ru")
      end

      it "includes all lesson categories with correct structure" do
        get lessons_path, headers: auth_headers(user, inertia: true)

        categories = inertia.props["categories"]
        category = categories.first

        expect(category).to have_key("id")
        expect(category).to have_key("title")
        expect(category).to have_key("icon")
        expect(category).to have_key("description")
        expect(category).to have_key("lessons")
        expect(category["lessons"]).to be_an(Array)
        expect(category["lessons"].length).to eq(3)
      end

      it "includes lesson details in each category" do
        get lessons_path, headers: auth_headers(user, inertia: true)

        lesson = inertia.props["categories"].first["lessons"].first

        expect(lesson).to have_key("id")
        expect(lesson).to have_key("title")
        expect(lesson).to have_key("duration")
        expect(lesson).to have_key("completed")
        expect(lesson["completed"]).to be_in([true, false])
      end
    end
  end

  describe "GET /lessons/:id" do
    context "when not authenticated" do
      it "redirects to login" do
        get lesson_path(1)
        expect(response).to have_http_status(:redirect)
        expect(response.location).to include(login_path)
      end
    end

    context "when authenticated" do
      it "renders the lesson show page with content" do
        get lesson_path(1), headers: auth_headers(user, inertia: true)

        expect(response).to have_http_status(:ok)
        expect(inertia).to render_component("Lessons/Show")
      end

      it "includes lesson, category, and content in props" do
        get lesson_path(1), headers: auth_headers(user, inertia: true)

        expect(inertia.props).to have_key("lesson")
        expect(inertia.props).to have_key("category")
        expect(inertia.props).to have_key("content")
        expect(inertia.props).to have_key("country")
      end

      it "includes breadcrumbs with lesson title" do
        get lesson_path(1), headers: auth_headers(user, inertia: true)

        breadcrumbs = inertia.props["breadcrumbs"]
        expect(breadcrumbs).to be_an(Array)
        expect(breadcrumbs.length).to eq(3)
        expect(breadcrumbs.last).to have_key("label")
      end

      it "includes lesson content structure" do
        get lesson_path(1), headers: auth_headers(user, inertia: true)

        content = inertia.props["content"]
        expect(content).to have_key("introduction")
        expect(content).to have_key("sections")
        expect(content).to have_key("key_points")
        expect(content).to have_key("quiz_preview")
        expect(content["sections"]).to be_an(Array)
        expect(content["key_points"]).to be_an(Array)
      end

      it "generates country-specific content" do
        # Set session by making a request to country selector first
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "us" }
        get lesson_path(1), headers: auth_headers(user, inertia: true)

        content = inertia.props["content"]
        expect(content["introduction"]).to include("USA")
      end

      it "includes prev and next lesson navigation" do
        get lesson_path(2), headers: auth_headers(user, inertia: true)

        expect(inertia.props).to have_key("prev_lesson")
        expect(inertia.props).to have_key("next_lesson")
        expect(inertia.props["prev_lesson"]).to be_a(Hash)
        expect(inertia.props["next_lesson"]).to be_a(Hash)
      end

      it "prev_lesson is nil for first lesson" do
        get lesson_path(1), headers: auth_headers(user, inertia: true)

        expect(inertia.props["prev_lesson"]).to be_nil
      end

      it "next_lesson is nil for last lesson" do
        get lesson_path(21), headers: auth_headers(user, inertia: true)

        expect(inertia.props["next_lesson"]).to be_nil
      end

      it "redirects to lessons index for invalid lesson id" do
        get lesson_path(999), headers: auth_headers(user, inertia: true)

        expect(response).to redirect_to(lessons_path)
      end
    end
  end
end
