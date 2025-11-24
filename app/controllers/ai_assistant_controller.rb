class AiAssistantController < ApplicationController
  before_action :authenticate_user!

  def index
    country = session[:selected_country] || 'kg'
    context = params[:context]

    render inertia: "AiAssistant/Index", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'AI Assistant' }
      ],
      country: country,
      initial_context: context
    }
  end

  def chat
    country = session[:selected_country] || 'kg'
    message = params[:message]
    image_url = params[:image_url]
    conversation_history = params[:history] || []

    # For Level 1 prototype, return mock response
    # In Level 2+, this would call actual AI API (OpenAI, Anthropic, etc.)
    response = generate_ai_response(message, country, image_url, conversation_history)

    render json: {
      response: response,
      timestamp: Time.current.iso8601
    }
  end

  private

  def generate_ai_response(message, country, image_url, history)
    country_name = { 'kg' => 'Kyrgyzstan', 'ru' => 'Russia', 'us' => 'USA' }[country]

    # Check if message is about specific topics
    if message.downcase.include?('speed limit')
      return "In #{country_name}, speed limits vary by zone:\n\n" \
             "• Urban areas: 60 km/h\n" \
             "• Residential zones: 40 km/h\n" \
             "• School zones: 20 km/h (during school hours)\n" \
             "• Highways: 90-110 km/h\n\n" \
             "Always watch for speed limit signs as they may indicate lower limits in specific areas. Would you like to know more about speeding penalties?"
    elsif message.downcase.include?('stop sign') || message.downcase.include?('stop signal')
      return "A stop sign (octagonal red sign with white letters) means you must come to a complete stop before the stop line, crosswalk, or intersection.\n\n" \
             "In #{country_name}, the procedure is:\n" \
             "1. Come to a complete stop (vehicle must be stationary)\n" \
             "2. Check for pedestrians and cross traffic\n" \
             "3. Yield to all traffic that arrived first\n" \
             "4. Proceed only when safe\n\n" \
             "Running a stop sign can result in fines of 3000-5000 som and penalty points on your license."
    elsif message.downcase.include?('right of way') || message.downcase.include?('priority')
      return "Right of way rules in #{country_name} follow these principles:\n\n" \
             "• Vehicles on the main road have priority over those entering from side roads\n" \
             "• At uncontrolled intersections, yield to vehicles approaching from the right\n" \
             "• Always yield to pedestrians at crosswalks\n" \
             "• Emergency vehicles with sirens/lights always have right of way\n• Traffic already in a roundabout has priority\n\n" \
             "Would you like me to explain a specific intersection scenario?"
    elsif message.downcase.include?('parking')
      return "Parking regulations in #{country_name}:\n\n" \
             "**Prohibited parking areas:**\n" \
             "• Within 5 meters of intersections\n" \
             "• On crosswalks or within 5 meters before them\n" \
             "• At bus stops (within 15 meters)\n" \
             "• Where parking signs prohibit it\n" \
             "• On highways and main roads\n\n" \
             "**Time limits:** Pay attention to time-restricted parking zones (marked with signs). In city centers, parking is often limited to 1-2 hours during business days.\n\n" \
             "Illegal parking can result in fines and your vehicle may be towed."
    elsif message.downcase.include?('roundabout')
      return "Navigating roundabouts in #{country_name}:\n\n" \
             "**Key rules:**\n" \
             "1. Slow down as you approach\n" \
             "2. Yield to traffic already in the roundabout\n" \
             "3. Enter when there's a safe gap\n" \
             "4. Stay in your lane (don't change lanes inside)\n" \
             "5. Signal before exiting\n\n" \
             "**Lane selection:**\n" \
             "• Right lane: for turning right or going straight\n" \
             "• Left lane: for going straight or turning left\n\n" \
             "Would you like tips on multi-lane roundabouts?"
    elsif image_url
      return "I can see the image you've uploaded. To provide accurate analysis, I need integration with an AI vision model. In the full version, I would analyze:\n\n" \
             "• What type of sign or road marking this is\n" \
             "• What it means according to #{country_name} traffic laws\n" \
             "• How drivers should respond to it\n" \
             "• Any penalties for non-compliance\n\n" \
             "For now, please describe what you see in the image, and I'll help explain it!"
    else
      return "Hello! I'm your AI driving assistant for #{country_name}. I can help you with:\n\n" \
             "• Traffic rules and regulations\n" \
             "• Road signs and their meanings\n" \
             "• Safe driving techniques\n" \
             "• Intersection navigation\n" \
             "• Speed limits and parking rules\n" \
             "• Traffic violations and penalties\n" \
             "• Exam preparation tips\n\n" \
             "Feel free to ask me any question about driving in #{country_name}, or upload an image of a road sign or traffic situation for analysis!"
    end
  end
end
