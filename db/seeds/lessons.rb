# Lesson Categories and Lessons Seed Data

puts "🌱 Seeding lesson categories and lessons..."

categories_data = [
  {
    name: 'Traffic Signs & Signals',
    slug: 'traffic-signs',
    icon: 'sign',
    description: 'Learn to recognize and understand all types of road signs and traffic signals',
    position: 1,
    lessons: [
      {
        title: 'Understanding Road Signs - Regulatory, Warning, and Guide Signs',
        duration_minutes: 15,
        position: 1,
        introduction: 'Road signs are essential visual communication tools that convey important information to drivers.',
        sections: [
          {
            title: 'Types of Road Signs',
            content: 'Road signs are categorized into three main types: Regulatory signs (red and white) that tell you what you must or must not do, Warning signs (yellow) that alert you to potential hazards, and Guide signs (green and blue) that provide directional and informational guidance.'
          },
          {
            title: 'Regulatory Signs',
            content: 'Regulatory signs include stop signs, yield signs, speed limit signs, and no entry signs. These signs have the force of law behind them, and violating their instructions can result in fines and penalties.'
          },
          {
            title: 'Warning Signs',
            content: 'Warning signs alert drivers to upcoming hazards such as sharp curves, pedestrian crossings, school zones, or road work. These signs give you time to adjust your speed and driving behavior.'
          },
          {
            title: 'Guide Signs',
            content: 'Guide signs help with navigation by showing directions to cities, highway exits, rest areas, and points of interest. They help drivers plan their route and make informed decisions.'
          }
        ],
        key_points: [
          'Red and white signs are regulatory - you must obey them',
          'Yellow signs warn of potential hazards ahead',
          'Green and blue signs provide navigation information',
          'Triangle signs indicate warnings, circles indicate mandatory actions',
          'Always reduce speed when you see a warning sign'
        ],
        quiz_preview: 'Test your knowledge of road signs with our interactive quiz.'
      },
      {
        title: 'Traffic Light Rules and Special Signals',
        duration_minutes: 12,
        position: 2,
        introduction: 'Traffic lights are one of the most important traffic control devices, regulating the flow of vehicles and pedestrians.',
        sections: [
          {
            title: 'Standard Traffic Light Sequence',
            content: 'Red means stop completely before the stop line. Yellow means prepare to stop if safe to do so. Green means proceed when safe. The sequence is designed to provide smooth traffic flow while ensuring safety.'
          },
          {
            title: 'Arrow Signals',
            content: 'Green arrows indicate protected turns - you can turn without yielding to oncoming traffic. Red arrows mean you must stop and cannot turn in that direction. Yellow arrows mean the protected turn is ending.'
          },
          {
            title: 'Flashing Signals',
            content: 'Flashing red light means treat it as a stop sign - stop completely, then proceed when safe. Flashing yellow means slow down and proceed with caution. These are often used at less busy intersections or during off-peak hours.'
          },
          {
            title: 'Pedestrian Signals',
            content: 'Walk signal means pedestrians may cross. Flashing dont walk means finish crossing if already in the intersection. Solid dont walk means do not start crossing.'
          }
        ],
        key_points: [
          'Always stop completely on red, even if turning right',
          'Yellow means prepare to stop, not speed up',
          'Green arrow gives you protected right of way',
          'Flashing red = stop sign, flashing yellow = caution',
          'Wait for walk signal before crossing as a pedestrian'
        ],
        quiz_preview: 'Master traffic light rules with practice scenarios.'
      },
      {
        title: 'Pavement Markings and Lane Indicators',
        duration_minutes: 10,
        position: 3,
        introduction: 'Pavement markings provide crucial guidance for lane usage, passing zones, and road boundaries.',
        sections: [
          {
            title: 'Lane Lines',
            content: 'White lines separate lanes of traffic moving in the same direction. Broken white lines mean you may change lanes when safe. Solid white lines discourage lane changes. Double white lines prohibit lane changes.'
          },
          {
            title: 'Center Lines',
            content: 'Yellow lines separate traffic moving in opposite directions. Broken yellow line means passing is allowed when safe. Solid yellow line on your side means no passing. Double solid yellow means no passing from either direction.'
          },
          {
            title: 'Special Markings',
            content: 'Arrows indicate required or permitted direction of travel. Diamond symbols mark HOV (carpool) lanes. Bike lane symbols show areas reserved for bicycles. Crosswalk lines show pedestrian crossing areas.'
          },
          {
            title: 'Edge Lines and Boundaries',
            content: 'White edge line marks the right edge of the roadway. Yellow edge line marks the left edge on divided highways. These help you stay in your lane, especially at night or in poor weather.'
          }
        ],
        key_points: [
          'White lines = same direction traffic, Yellow lines = opposite direction',
          'Broken lines = passing allowed, Solid lines = no passing',
          'Never cross double solid yellow lines',
          'Follow arrow directions in your lane',
          'Stay between the edge lines at all times'
        ],
        quiz_preview: 'Practice identifying pavement markings and their meanings.'
      }
    ]
  },
  {
    name: 'Lane Changes & Merging',
    slug: 'lane-changes',
    icon: 'lanes',
    description: 'Master safe techniques for changing lanes and merging into traffic',
    position: 2,
    lessons: [
      {
        title: 'Safe Lane Change Procedures',
        duration_minutes: 14,
        position: 1,
        introduction: 'Changing lanes safely requires careful observation, signaling, and smooth execution.',
        sections: [
          {
            title: 'The Mirror-Signal-Shoulder Check Method',
            content: 'Before changing lanes: Check your mirrors to assess surrounding traffic, signal your intention early (at least 3 seconds before), perform a shoulder check to cover blind spots, and execute the lane change smoothly when safe.'
          },
          {
            title: 'Understanding Blind Spots',
            content: 'Every vehicle has blind spots - areas not visible in mirrors. These are typically beside and slightly behind your vehicle. Always perform a quick shoulder check to ensure no vehicle is in your blind spot before changing lanes.'
          },
          {
            title: 'Choosing the Right Time',
            content: 'Change lanes only when necessary. Avoid changing lanes in intersections, on curves, or in areas with restricted visibility. Ensure you have adequate space - at least 3-4 seconds of following distance.'
          },
          {
            title: 'Common Mistakes',
            content: 'Common errors include not signaling, signaling too late, not checking blind spots, changing lanes too quickly or abruptly, and cutting off other drivers. Always prioritize smooth, predictable movements.'
          }
        ],
        key_points: [
          'Mirror, Signal, Shoulder check - in that order',
          'Signal at least 3 seconds before changing lanes',
          'Always check blind spots with shoulder check',
          'Ensure adequate space before moving',
          'Never change lanes in intersections'
        ],
        quiz_preview: 'Test your lane change knowledge with realistic scenarios.'
      },
      {
        title: 'Highway Merging and Exit Techniques',
        duration_minutes: 16,
        position: 2,
        introduction: 'Merging onto highways and taking exits safely requires proper speed management and awareness.',
        sections: [
          {
            title: 'Acceleration Lane Usage',
            content: 'Use the full length of the acceleration lane to match highway speed. Signal early, check your mirrors and blind spot, and merge smoothly into a safe gap in traffic. Never stop in the acceleration lane unless absolutely necessary.'
          },
          {
            title: 'Finding a Gap',
            content: 'Look for a gap in traffic that gives you at least 3-4 seconds of space. Adjust your speed in the acceleration lane to position yourself for a safe merge. Make eye contact with other drivers when possible.'
          },
          {
            title: 'Exit Procedures',
            content: 'Signal well before the exit (at least 500 feet). Move to the exit lane early. Begin decelerating only after entering the deceleration lane. Check your speed - exit ramps often have lower speed limits.'
          },
          {
            title: 'Highway Speed Transitions',
            content: 'When merging onto highways, accelerate to match traffic speed before merging. When exiting, maintain highway speed until you reach the deceleration lane, then gradually slow down.'
          }
        ],
        key_points: [
          'Use full acceleration lane to match highway speed',
          'Signal early and merge into a safe gap',
          'Never stop in acceleration lane',
          'Signal before exiting and move to exit lane early',
          'Begin slowing only after entering deceleration lane'
        ],
        quiz_preview: 'Practice highway merging scenarios and exit timing.'
      },
      {
        title: 'Multi-Lane Roundabouts',
        duration_minutes: 13,
        position: 3,
        introduction: 'Multi-lane roundabouts require understanding of lane selection and maintaining your lane throughout.',
        sections: [
          {
            title: 'Lane Selection on Entry',
            content: 'Right lane: Use for turning right or going straight. Left lane: Use for going straight or turning left. Choose your lane before entering based on your intended exit. Never change lanes inside the roundabout.'
          },
          {
            title: 'Yielding Rules',
            content: 'Always yield to traffic already in the roundabout. Yield to pedestrians in crosswalks at entry and exit. In multi-lane roundabouts, yield to traffic in both lanes before entering.'
          },
          {
            title: 'Navigating Inside the Roundabout',
            content: 'Stay in your chosen lane throughout. Watch for vehicles in adjacent lanes - they may exit unexpectedly. Signal right before your exit. Maintain a steady speed appropriate for the roundabout size.'
          },
          {
            title: 'Common Errors in Roundabouts',
            content: 'Avoid changing lanes inside the roundabout, stopping unnecessarily, failing to yield on entry, not signaling your exit, or cutting across lanes when exiting.'
          }
        ],
        key_points: [
          'Choose your lane before entering the roundabout',
          'Right lane for right/straight, left lane for straight/left',
          'Never change lanes inside the roundabout',
          'Yield to trafficalready in the roundabout',
          'Signal right before your exit'
        ],
        quiz_preview: 'Master multi-lane roundabout navigation with practice exercises.'
      }
    ]
  },
  {
    name: 'Dangerous Situations',
    slug: 'dangerous-situations',
    icon: 'alert',
    description: 'Learn how to handle emergency situations and avoid accidents',
    position: 3,
    lessons: [
      {
        title: 'Emergency Braking and Collision Avoidance',
        duration_minutes: 18,
        position: 1,
        introduction: 'Knowing how to brake effectively in emergencies can prevent accidents and save lives.',
        sections: [
          {
            title: 'Emergency Braking Techniques',
            content: 'With ABS: Press brake pedal firmly and hold it down. The system will pump the brakes for you. Without ABS: Use threshold braking - press firmly but just short of locking wheels. If wheels lock, release slightly then reapply.'
          },
          {
            title: 'Collision Avoidance Maneuvers',
            content: 'Sometimes steering around an obstacle is better than braking. Look for escape routes. Be aware of blind spots. Never swerve into oncoming traffic lane. Controlled braking while steering is possible with practice.'
          },
          {
            title: 'Following Distance',
            content: 'Maintain at least 3 seconds following distance in good conditions. Increase to 4-6 seconds in rain, fog, or darkness. Following too closely is the leading cause of rear-end collisions.'
          },
          {
            title: 'Anticipating Hazards',
            content: 'Scan ahead 10-15 seconds. Watch for brake lights, pedestrians, and turning vehicles. Anticipate that other drivers may make mistakes. Always have an escape plan.'
          }
        ],
        key_points: [
          'With ABS: Press and hold brake pedal firmly',
          'Maintain 3+ seconds following distance',
          'Sometimes steering is better than braking',
          'Scan ahead and anticipate hazards',
          'Never swerve into oncoming traffic'
        ],
        quiz_preview: 'Practice emergency response scenarios.'
      },
      {
        title: 'Handling Adverse Weather Conditions',
        duration_minutes: 15,
        position: 2,
        introduction: 'Adverse weather conditions require adjusting your driving technique to maintain control and safety.',
        sections: [
          {
            title: 'Rain and Wet Roads',
            content: 'Reduce speed by at least 10-15 mph. Increase following distance to 4-6 seconds. Hydroplaning occurs at higher speeds on wet roads - if it happens, ease off gas and steer straight. Avoid sudden movements.'
          },
          {
            title: 'Fog and Low Visibility',
            content: 'Use low-beam headlights and fog lights. High beams reflect off fog and reduce visibility. Slow down significantly. Use road edge lines for guidance. Consider pulling over if visibility is extremely poor.'
          },
          {
            title: 'Snow and Ice',
            content: 'Reduce speed to half your normal speed or less. Increase following distance to 8-10 seconds. Accelerate and brake gradually to avoid wheel spin or skidding. Turn into skids to regain control.'
          },
          {
            title: 'Strong Winds',
            content: 'Grip steering wheel firmly with both hands. Expect crosswinds when exiting tunnels or passing large vehicles. High-profile vehicles are especially vulnerable. Reduce speed in strong wind conditions.'
          }
        ],
        key_points: [
          'Reduce speed in all adverse weather',
          'Increase following distance significantly',
          'Use low beams in fog, never high beams',
          'Avoid sudden movements on slippery surfaces',
          'Consider delaying trip in severe weather'
        ],
        quiz_preview: 'Test your knowledge of adverse weather driving.'
      },
      {
        title: 'Tire Blowout and Vehicle Malfunction Response',
        duration_minutes: 12,
        position: 3,
        introduction: 'Mechanical failures can occur unexpectedly. Knowing how to respond can prevent loss of control.',
        sections: [
          {
            title: 'Tire Blowout Response',
            content: 'Do not brake immediately. Grip steering wheel firmly and steer straight. Allow vehicle to slow naturally. Once speed drops, gently apply brakes. Pull completely off the road to a safe location.'
          },
          {
            title: 'Brake Failure',
            content: 'Pump the brake pedal several times to build pressure. If brakes still dont work, shift to lower gear. Use parking brake gradually. Look for safe place to slow down (uphill, soft shoulder, open area).'
          },
          {
            title: 'Accelerator Stuck',
            content: 'Shift to neutral immediately. Do not turn off ignition while moving (you will lose power steering). Apply brakes. Once stopped safely, turn off engine. Have vehicle towed for inspection.'
          },
          {
            title: 'Engine Failure',
            content: 'Steer vehicle to side of road. You will still have steering and brakes, but steering will be harder and braking less effective. Turn on hazard lights. Move to safe location off the roadway.'
          }
        ],
        key_points: [
          'Tire blowout: Dont brake, steer straight, slow gradually',
          'Brake failure: Pump pedal, use gears, parking brake',
          'Stuck accelerator: Shift to neutral, dont turn off engine',
          'Always move to safe location off roadway',
          'Turn on hazard lights immediately'
        ],
        quiz_preview: 'Practice responding to vehicle malfunction scenarios.'
      }
    ]
  }
  # Continue with remaining categories...
]

# Clear existing data
puts "Clearing existing lesson data..."
UserLessonProgress.destroy_all
Lesson.destroy_all
LessonCategory.destroy_all

# Create categories and lessons
categories_data.each do |cat_data|
  lessons_data = cat_data.delete(:lessons)

  category = LessonCategory.create!(cat_data)
  puts "  ✓ Created category: #{category.name}"

  lessons_data.each do |lesson_data|
    lesson = category.lessons.create!(lesson_data)
    puts "    ✓ Created lesson: #{lesson.title}"
  end
end

puts "✅ Lesson seeding completed!"
puts "   Categories: #{LessonCategory.count}"
puts "   Lessons: #{Lesson.count}"
