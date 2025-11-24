require 'rails_helper'

RSpec.describe "AiAssistant", type: :request, inertia: true do
  let(:user) { create(:user) }

  describe "GET /ai-assistant" do
    context "when not authenticated" do
      it "redirects to login" do
        get ai_assistant_path
        expect(response).to have_http_status(:redirect)
        expect(response.location).to include(login_path)
      end
    end

    context "when authenticated" do
      it "renders the AI assistant page" do
        get ai_assistant_path, headers: auth_headers(user, inertia: true)

        expect(response).to have_http_status(:ok)
        expect(inertia).to render_component("AiAssistant/Index")
      end

      it "includes breadcrumbs in props" do
        get ai_assistant_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["breadcrumbs"]).to be_an(Array)
        expect(inertia.props["breadcrumbs"].last["label"]).to eq("AI Assistant")
      end

      it "includes selected country in props" do
        get ai_assistant_path, headers: auth_headers(user, inertia: true)

        expect(inertia.props["country"]).to eq("kg")
      end

      it "includes initial context when provided" do
        get ai_assistant_path, headers: auth_headers(user, inertia: true), params: { context: "I'm learning about traffic signs" }

        expect(inertia.props["initial_context"]).to eq("I'm learning about traffic signs")
      end
    end
  end

  describe "POST /ai-assistant/chat" do
    context "when not authenticated" do
      it "redirects to login" do
        post ai_assistant_chat_path, params: { message: "Test" }
        expect(response).to have_http_status(:redirect)
        expect(response.location).to include(login_path)
      end
    end

    context "when authenticated" do
      it "returns a response for a message" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "What are the speed limits?" }

        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body)
        expect(json).to have_key("response")
        expect(json).to have_key("timestamp")
        expect(json["response"]).to be_a(String)
        expect(json["response"].length).to be > 0
      end

      it "provides country-specific responses for speed limit questions" do
        post country_select_path, headers: auth_headers(user, inertia: true), params: { country: "kg" }
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "What are the speed limits?" }

        json = JSON.parse(response.body)
        expect(json["response"]).to include("Kyrgyzstan")
      end

      it "responds to stop sign questions" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "Explain stop sign rules" }

        json = JSON.parse(response.body)
        expect(json["response"]).to include("stop")
        expect(json["response"]).to include("complete stop")
      end

      it "responds to right of way questions" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "Who has right of way?" }

        json = JSON.parse(response.body)
        expect(json["response"]).to include("right of way")
      end

      it "responds to parking questions" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "Where can I park?" }

        json = JSON.parse(response.body)
        expect(json["response"]).to include("parking")
      end

      it "responds to roundabout questions" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "How do I navigate a roundabout?" }

        json = JSON.parse(response.body)
        expect(json["response"]).to include("roundabout")
      end

      it "provides welcome message for generic questions" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "Hello" }

        json = JSON.parse(response.body)
        expect(json["response"]).to include("AI driving assistant")
      end

      it "handles image upload placeholder" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "What is this sign?", image_url: "http://example.com/sign.jpg" }

        json = JSON.parse(response.body)
        expect(json["response"]).to include("image")
      end

      it "accepts conversation history" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: {
               message: "What about in USA?",
               history: [
                 { role: "user", content: "What are speed limits?" },
                 { role: "assistant", content: "Speed limits vary..." }
               ]
             }

        expect(response).to have_http_status(:ok)
      end

      it "returns timestamp in ISO8601 format" do
        post ai_assistant_chat_path,
             headers: auth_headers(user, inertia: true),
             params: { message: "Test" }

        json = JSON.parse(response.body)
        expect { DateTime.iso8601(json["timestamp"]) }.not_to raise_error
      end
    end
  end
end
