# Lesson Categories and Lessons Seed Data

puts "🌱 Seeding lesson categories and lessons..."

# English lessons
categories_data_en = [
  {
    name: 'Traffic Signs & Signals',
    slug: 'traffic-signs',
    icon: 'sign',
    description: 'Learn to recognize and understand all types of road signs and traffic signals',
    position: 1,
    language: 'en',
    lessons: [
      {
        title: 'Understanding Road Signs - Regulatory, Warning, and Guide Signs',
        duration_minutes: 15,
        position: 1,
        language: 'en',
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
            content: 'Guide signs help with navigation by showing directions to cities, highwayexits, rest areas, and points of interest. They help drivers plan their route and make informed decisions.'
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
        language: 'en',
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
        language: 'en',
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
    language: 'en',
    lessons: [
      {
        title: 'Safe Lane Change Procedures',
        duration_minutes: 14,
        position: 1,
        language: 'en',
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
        language: 'en',
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
        language: 'en',
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
          'Yield to traffic already in the roundabout',
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
    language: 'en',
    lessons: [
      {
        title: 'Emergency Braking and Collision Avoidance',
        duration_minutes: 18,
        position: 1,
        language: 'en',
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
        language: 'en',
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
        language: 'en',
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
]

# Russian lessons
categories_data_ru = [
  {
    name: 'Дорожные Знаки и Сигналы',
    slug: 'traffic-signs-ru',
    icon: 'sign',
    description: 'Научитесь распознавать и понимать все типы дорожных знаков и светофоров',
    position: 1,
    language: 'ru',
    lessons: [
      {
        title: 'Понимание Дорожных Знаков - Предписывающие, Предупреждающие и Информационные',
        duration_minutes: 15,
        position: 1,
        language: 'ru',
        introduction: 'Дорожные знаки - это важные визуальные средства коммуникации, которые передают важную информацию водителям.',
        sections: [
          {
            title: 'Типы Дорожных Знаков',
            content: 'Дорожные знаки делятся на три основных типа: Предписывающие знаки (красно-белые), которые указывают, что вы должны или не должны делать, Предупреждающие знаки (жёлтые), которые предупреждают о потенциальных опасностях, и Информационные знаки (зелёные и синие), которые предоставляют направления и информацию.'
          },
          {
            title: 'Предписывающие Знаки',
            content: 'К предписывающим знакам относятся знаки "Стоп", "Уступи дорогу", ограничения скорости и "Въезд запрещён". Эти знаки имеют силу закона, и нарушение их требований может привести к штрафам и наказаниям.'
          },
          {
            title: 'Предупреждающие Знаки',
            content: 'Предупреждающие знаки информируют водителей о предстоящих опасностях, таких как крутые повороты, пешеходные переходы, школьные зоны или дорожные работы. Эти знаки дают вам время для корректировки скорости и стиля вождения.'
          },
          {
            title: 'Информационные Знаки',
            content: 'Информационные знаки помогают с навигацией, показывая направления к городам, съездам с шоссе, зонам отдыха и достопримечательностям. Они помогают водителям планировать маршрут и принимать обоснованные решения.'
          }
        ],
        key_points: [
          'Красно-белые знаки предписывающие - вы должны им подчиняться',
          'Жёлтые знаки предупреждают о возможных опасностях впереди',
          'Зелёные и синие знаки предоставляют навигационную информацию',
          'Треугольные знаки означают предупреждения, круглые - обязательные действия',
          'Всегда снижайте скорость, когда видите предупреждающий знак'
        ],
        quiz_preview: 'Проверьте свои знания дорожных знаков с помощью интерактивного теста.'
      },
      {
        title: 'Правила Светофора и Специальные Сигналы',
        duration_minutes: 12,
        position: 2,
        language: 'ru',
        introduction: 'Светофоры - одно из самых важных средств регулирования движения, управляющее потоком транспорта и пешеходов.',
        sections: [
          {
            title: 'Стандартная Последовательность Светофора',
            content: 'Красный означает полную остановку перед стоп-линией. Жёлтый означает приготовиться к остановке, если это безопасно. Зелёный означает двигаться, когда безопасно. Последовательность создана для обеспечения плавного движения и безопасности.'
          },
          {
            title: 'Стрелочные Сигналы',
            content: 'Зелёные стрелки указывают на защищённые повороты - вы можете поворачивать, не уступая встречному транспорту. Красные стрелки означают, что вы должны остановиться и не можете поворачивать в этом направлении. Жёлтые стрелки означают, что защищённый поворот заканчивается.'
          },
          {
            title: 'Мигающие Сигналы',
            content: 'Мигающий красный свет означает относиться к нему как к знаку "Стоп" - полностью остановиться, затем продолжить движение, когда безопасно. Мигающий жёлтый означает снизить скорость и продолжить с осторожностью. Они часто используются на менее загруженных перекрёстках или в непиковые часы.'
          },
          {
            title: 'Пешеходные Сигналы',
            content: 'Сигнал "Идите" означает, что пешеходы могут переходить. Мигающий сигнал "Не идите" означает закончить переход, если вы уже на перекрёстке. Постоянный сигнал "Не идите" означает не начинать переход.'
          }
        ],
        key_points: [
          'Всегда полностью останавливайтесь на красный, даже при повороте направо',
          'Жёлтый означает приготовиться к остановке, а не ускоряться',
          'Зелёная стрелка даёт вам защищённое право проезда',
          'Мигающий красный = знак стоп, мигающий жёлтый = осторожность',
          'Дождитесь сигнала "Идите" перед переходом в качестве пешехода'
        ],
        quiz_preview: 'Освойте правила светофора с практическими сценариями.'
      },
      {
        title: 'Дорожная Разметка и Указатели Полос',
        duration_minutes: 10,
        position: 3,
        language: 'ru',
        introduction: 'Дорожная разметка предоставляет важные указания по использованию полос, зонам обгона и границам дороги.',
        sections: [
          {
            title: 'Линии Полос',
            content: 'Белые линии разделяют полосы движения в одном направлении. Прерывистые белые линии означают, что вы можете менять полосу, когда это безопасно. Сплошные белые линии не рекомендуют смену полосы. Двойные белые линии запрещают смену полосы.'
          },
          {
            title: 'Осевые Линии',
            content: 'Жёлтые линии разделяют движение в противоположных направлениях. Прерывистая жёлтая линия означает, что обгон разрешён, когда это безопасно. Сплошная жёлтая линия с вашей стороны означает запрет обгона. Двойная сплошная жёлтая означает запрет обгона с обеих сторон.'
          },
          {
            title: 'Специальная Разметка',
            content: 'Стрелки указывают обязательное или разрешённое направление движения. Ромбы обозначают полосы для автомобилей с пассажирами. Символы велосипедных дорожек показывают зоны, зарезервированные для велосипедов. Линии пешеходных переходов показывают зоны перехода пешеходов.'
          },
          {
            title: 'Краевые Линии и Границы',
            content: 'Белая краевая линия обозначает правый край проезжей части. Жёлтая краевая линия обозначает левый край на разделённых шоссе. Они помогают оставаться в своей полосе, особенно ночью или в плохую погоду.'
          }
        ],
        key_points: [
          'Белые линии = движение в одном направлении, Жёлтые линии = встречное движение',
          'Прерывистые линии = обгон разрешён, Сплошные линии = обгон запрещён',
          'Никогда не пересекайте двойные сплошные жёлтые линии',
          'Следуйте направлению стрелок в вашей полосе',
          'Всегда оставайтесь между краевыми линиями'
        ],
        quiz_preview: 'Практикуйте определение дорожной разметки и её значений.'
      }
    ]
  },
  {
    name: 'Перестроения и Слияние',
    slug: 'lane-changes-ru',
    icon: 'lanes',
    description: 'Освойте безопасные техники смены полосы и вливания в транспортный поток',
    position: 2,
    language: 'ru',
    lessons: [
      {
        title: 'Безопасные Процедуры Смены Полосы',
        duration_minutes: 14,
        position: 1,
        language: 'ru',
        introduction: 'Безопасная смена полосы требует тщательного наблюдения, сигнализации и плавного выполнения.',
        sections: [
          {
            title: 'Метод Зеркало-Сигнал-Плечо',
            content: 'Перед сменой полосы: Проверьте зеркала для оценки окружающего транспорта, включите сигнал поворота заранее (минимум за 3 секунды), выполните проверку через плечо для покрытия слепых зон, и плавно выполните смену полосы, когда это безопасно.'
          },
          {
            title: 'Понимание Слепых Зон',
            content: 'У каждого транспортного средства есть слепые зоны - области, не видимые в зеркалах. Обычно они находятся сбоку и слегка позади вашего автомобиля. Всегда выполняйте быструю проверку через плечо, чтобы убедиться, что в вашей слепой зоне нет транспорта перед сменой полосы.'
          },
          {
            title: 'Выбор Правильного Времени',
            content: 'Меняйте полосу только когда это необходимо. Избегайте смены полосы на перекрёстках, на поворотах или в зонах с ограниченной видимостью. Убедитесь, что у вас достаточно пространства - минимум 3-4 секунды дистанции следования.'
          },
          {
            title: 'Распространённые Ошибки',
            content: 'Типичные ошибки включают отсутствие сигнала, слишком позднее включение сигнала, не проверку слепых зон, слишком быструю или резкую смену полосы, и подрезание других водителей. Всегда отдавайте приоритет плавным, предсказуемым движениям.'
          }
        ],
        key_points: [
          'Зеркало, Сигнал, Плечо - в этом порядке',
          'Включайте сигнал минимум за 3 секунды до смены полосы',
          'Всегда проверяйте слепые зоны взглядом через плечо',
          'Убедитесь в достаточном пространстве перед перестроением',
          'Никогда не меняйте полосу на перекрёстках'
        ],
        quiz_preview: 'Проверьте свои знания смены полосы с реалистичными сценариями.'
      },
      {
        title: 'Техники Въезда и Съезда с Шоссе',
        duration_minutes: 16,
        position: 2,
        language: 'ru',
        introduction: 'Безопасное вливание на шоссе и съезд требует правильного управления скоростью и внимательности.',
        sections: [
          {
            title: 'Использование Полосы Разгона',
            content: 'Используйте всю длину полосы разгона для достижения скорости шоссе. Включите сигнал заранее, проверьте зеркала и слепую зону, и плавно влейтесь в безопасный промежуток в транспортном потоке. Никогда не останавливайтесь на полосе разгона, если это не абсолютно необходимо.'
          },
          {
            title: 'Поиск Промежутка',
            content: 'Ищите промежуток в транспорте, который даёт вам минимум 3-4 секунды пространства. Регулируйте скорость на полосе разгона, чтобы позиционировать себя для безопасного вливания. По возможности устанавливайте зрительный контакт с другими водителями.'
          },
          {
            title: 'Процедуры Съезда',
            content: 'Включите сигнал задолго до съезда (минимум за 150 метров). Перестройтесь на полосу съезда заранее. Начинайте замедление только после въезда на полосу торможения. Проверьте скорость - съезды часто имеют более низкие ограничения скорости.'
          },
          {
            title: 'Переходы Скорости на Шоссе',
            content: 'При вливании на шоссе, разгоняйтесь до скорости потока перед вливанием. При съезде, поддерживайте скорость шоссе до достижения полосы торможения, затем постепенно снижайте скорость.'
          }
        ],
        key_points: [
          'Используйте всю полосу разгона для достижения скорости шоссе',
          'Включайте сигнал заранее и вливайтесь в безопасный промежуток',
          'Никогда не останавливайтесь на полосе разгона',
          'Включайте сигнал перед съездом и перестраивайтесь на полосу съезда заранее',
          'Начинайте замедление только после въезда на полосу торможения'
        ],
        quiz_preview: 'Практикуйте сценарии вливания на шоссе и выбора времени съезда.'
      },
      {
        title: 'Многополосные Круговые Перекрёстки',
        duration_minutes: 13,
        position: 3,
        language: 'ru',
        introduction: 'Многополосные круговые перекрёстки требуют понимания выбора полосы и её поддержания на протяжении всего маршрута.',
        sections: [
          {
            title: 'Выбор Полосы при Въезде',
            content: 'Правая полоса: Используйте для поворота направо или движения прямо. Левая полоса: Используйте для движения прямо или поворота налево. Выбирайте полосу перед въездом на основе планируемого съезда. Никогда не меняйте полосу внутри кругового перекрёстка.'
          },
          {
            title: 'Правила Уступки',
            content: 'Всегда уступайте транспорту, уже находящемуся на круговом перекрёстке. Уступайте пешеходам на пешеходных переходах при въезде и выезде. На многополосных круговых перекрёстках, уступайте транспорту в обеих полосах перед въездом.'
          },
          {
            title: 'Движение Внутри Кругового Перекрёстка',
            content: 'Оставайтесь в выбранной полосе на протяжении всего пути. Следите за транспортом в соседних полосах - они могут неожиданно съехать. Включайте правый сигнал перед съездом. Поддерживайте стабильную скорость, соответствующую размеру кругового перекрёстка.'
          },
          {
            title: 'Распространённые Ошибки на Круговых Перекрёстках',
            content: 'Избегайте смены полосы внутри кругового перекрёстка, ненужных остановок, непредоставления преимущества при въезде, отсутствия сигнала при съезде, или пересечения полос при съезде.'
          }
        ],
        key_points: [
          'Выбирайте полосу перед въездом на круговой перекрёсток',
          'Правая полоса для поворота направо/прямо, левая для прямо/налево',
          'Никогда не меняйте полосу внутри кругового перекрёстка',
          'Уступайте транспорту, уже находящемуся на круговом перекрёстке',
          'Включайте правый сигнал перед съездом'
        ],
        quiz_preview: 'Освойте навигацию по многополосным круговым перекрёсткам с практическими упражнениями.'
      }
    ]
  },
  {
    name: 'Опасные Ситуации',
    slug: 'dangerous-situations-ru',
    icon: 'alert',
    description: 'Научитесь справляться с чрезвычайными ситуациями и избегать аварий',
    position: 3,
    language: 'ru',
    lessons: [
      {
        title: 'Экстренное Торможение и Предотвращение Столкновений',
        duration_minutes: 18,
        position: 1,
        language: 'ru',
        introduction: 'Знание эффективного торможения в чрезвычайных ситуациях может предотвратить аварии и спасти жизни.',
        sections: [
          {
            title: 'Техники Экстренного Торможения',
            content: 'С ABS: Нажмите педаль тормоза твёрдо и удерживайте её. Система будет качать тормоза за вас. Без ABS: Используйте пороговое торможение - нажимайте твёрдо, но не до блокировки колёс. Если колёса заблокировались, немного отпустите, затем нажмите снова.'
          },
          {
            title: 'Манёвры Предотвращения Столкновений',
            content: 'Иногда объезд препятствия лучше, чем торможение. Ищите пути эвакуации. Будьте внимательны к слепым зонам. Никогда не сворачивайте на полосу встречного движения. Контролируемое торможение во время руления возможно с практикой.'
          },
          {
            title: 'Дистанция Следования',
            content: 'Поддерживайте минимум 3 секунды дистанции следования в хороших условиях. Увеличьте до 4-6 секунд в дождь, туман или темноту. Слишком близкое следование - главная причина столкновений сзади.'
          },
          {
            title: 'Предвидение Опасностей',
            content: 'Сканируйте впереди на 10-15 секунд. Следите за стоп-сигналами, пешеходами и поворачивающими транспортными средствами. Предполагайте, что другие водители могут совершать ошибки. Всегда имейте план эвакуации.'
          }
        ],
        key_points: [
          'С ABS: Нажмите и удерживайте педаль тормоза твёрдо',
          'Поддерживайте 3+ секунды дистанции следования',
          'Иногда руление лучше, чем торможение',
          'Сканируйте впереди и предвидьте опасности',
          'Никогда не сворачивайте на встречное движение'
        ],
        quiz_preview: 'Практикуйте сценарии экстренного реагирования.'
      },
      {
        title: 'Управление в Неблагоприятных Погодных Условиях',
        duration_minutes: 15,
        position: 2,
        language: 'ru',
        introduction: 'Неблагоприятные погодные условия требуют корректировки техники вождения для поддержания контроля и безопасности.',
        sections: [
          {
            title: 'Дождь и Мокрые Дороги',
            content: 'Снизьте скорость минимум на 15-20 км/ч. Увеличьте дистанцию следования до 4-6 секунд. Аквапланирование происходит на высоких скоростях на мокрых дорогах - если это произошло, отпустите газ и рулите прямо. Избегайте резких движений.'
          },
          {
            title: 'Туман и Низкая Видимость',
            content: 'Используйте ближний свет фар и противотуманные фары. Дальний свет отражается от тумана и снижает видимость. Значительно снизьте скорость. Используйте краевые линии дороги для ориентира. Подумайте о остановке, если видимость крайне плохая.'
          },
          {
            title: 'Снег и Лёд',
            content: 'Снизьте скорость до половины нормальной скорости или меньше. Увеличьте дистанцию следования до 8-10 секунд. Разгоняйтесь и тормозите постепенно, чтобы избежать пробуксовки или заноса. Поворачивайте в сторону заноса для восстановления контроля.'
          },
          {
            title: 'Сильный Ветер',
            content: 'Крепко держите руль обеими руками. Ожидайте боковых ветров при выезде из туннелей или обгоне крупных транспортных средств. Высокие транспортные средства особенно уязвимы. Снижайте скорость в условиях сильного ветра.'
          }
        ],
        key_points: [
          'Снижайте скорость во всех неблагоприятных погодных условиях',
          'Значительно увеличивайте дистанцию следования',
          'Используйте ближний свет в тумане, никогда дальний',
          'Избегайте резких движений на скользких поверхностях',
          'Рассмотрите возможность откладывания поездки при серьёзной погоде'
        ],
        quiz_preview: 'Проверьте свои знания вождения в неблагоприятных погодных условиях.'
      },
      {
        title: 'Реагирование на Прокол Шины и Неисправность Транспортного Средства',
        duration_minutes: 12,
        position: 3,
        language: 'ru',
        introduction: 'Механические поломки могут произойти неожиданно. Знание правильного реагирования может предотвратить потерю контроля.',
        sections: [
          {
            title: 'Реагирование на Прокол Шины',
            content: 'Не тормозите сразу. Крепко держите руль и рулите прямо. Позвольте транспортному средству замедлиться естественно. Как только скорость снизится, осторожно примените тормоза. Полностью съедьте с дороги в безопасное место.'
          },
          {
            title: 'Отказ Тормозов',
            content: 'Качайте педаль тормоза несколько раз для создания давления. Если тормоза всё ещё не работают, переключитесь на более низкую передачу. Используйте ручной тормоз постепенно. Ищите безопасное место для замедления (подъём, мягкая обочина, открытая зона).'
          },
          {
            title: 'Заевший Акселератор',
            content: 'Немедленно переключитесь на нейтраль. Не выключайте зажигание во время движения (вы потеряете гидроусилитель руля). Примените тормоза. После безопасной остановки выключите двигатель. Отбуксируйте транспортное средство для проверки.'
          },
          {
            title: 'Отказ Двигателя',
            content: 'Направьте транспортное средство к обочине дороги. У вас всё ещё будет руление и тормоза, но руление будет сложнее, а торможение менее эффективным. Включите аварийные огни. Переместитесь в безопасное место вне проезжей части.'
          }
        ],
        key_points: [
          'Прокол шины: Не тормозите, рулите прямо, замедляйтесь постепенно',
          'Отказ тормозов: Качайте педаль, используйте передачи, ручной тормоз',
          'Заевший акселератор: Переключитесь на нейтраль, не выключайте двигатель',
          'Всегда перемещайтесь в безопасное место вне проезжей части',
          'Немедленно включайте аварийные огни'
        ],
        quiz_preview: 'Практикуйте реагирование на сценарии неисправности транспортного средства.'
      }
    ]
  }
]

# Clear existing data
puts "Clearing existing lesson data..."
UserLessonProgress.destroy_all
Lesson.destroy_all
LessonCategory.destroy_all

# Create English categories and lessons
puts "\n📚 Creating English lessons..."
categories_data_en.each do |cat_data|
  lessons_data = cat_data.delete(:lessons)

  category = LessonCategory.create!(cat_data)
  puts "  ✓ Created category: #{category.name}"

  lessons_data.each do |lesson_data|
    lesson = category.lessons.create!(lesson_data)
    puts "    ✓ Created lesson: #{lesson.title}"
  end
end

# Create Russian categories and lessons
puts "\n📚 Creating Russian lessons..."
categories_data_ru.each do |cat_data|
  lessons_data = cat_data.delete(:lessons)

  category = LessonCategory.create!(cat_data)
  puts "  ✓ Created category: #{category.name}"

  lessons_data.each do |lesson_data|
    lesson = category.lessons.create!(lesson_data)
    puts "    ✓ Created lesson: #{lesson.title}"
  end
end

puts "\n✅ Lesson seeding completed!"
puts "   Categories: #{LessonCategory.count} (#{LessonCategory.where(language: 'en').count} English + #{LessonCategory.where(language: 'ru').count} Russian)"
puts "   Lessons: #{Lesson.count} (#{Lesson.where(language: 'en').count} English + #{Lesson.where(language: 'ru').count} Russian)"
