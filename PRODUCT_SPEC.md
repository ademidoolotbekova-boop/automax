# Product Specs

## Product Overview

**AutoMax AI** is a comprehensive AI-powered driving school platform that helps users learn traffic rules, prepare for driving exams, and master safe driving practices. The platform provides interactive lessons, AI-assisted learning, and country-specific content for Kyrgyzstan, Russia, and USA.

## Core Modules

### 1. Multi-Country & Multi-Language Support

**Country Selection System**

- Three supported countries: Kyrgyzstan (primary), Russia, and USA
- Country selector in navigation header with flag icons
- All content adapts based on selected country
- Country preference stored in user session
- Country-specific traffic rules and regulations

**Language Support**

- Two languages available: English and Russian (Русский)
- Language selector in navigation header
- Complete interface translation for both languages
- All UI elements, navigation, buttons, and messages localized
- Language preference stored in user session
- Seamless language switching without page reload

### 2. Learning Platform

**Lesson Library**

The platform includes 21 comprehensive lessons organized into 7 categories:

1. **Traffic Signs & Signals** (3 lessons)
   - Understanding Road Signs - Regulatory, Warning, and Guide Signs
   - Traffic Light Rules and Special Signals
   - Pavement Markings and Lane Indicators

2. **Lane Changes & Merging** (3 lessons)
   - Safe Lane Change Procedures
   - Highway Merging and Exit Techniques
   - Multi-Lane Roundabouts

3. **Dangerous Situations** (3 lessons)
   - Emergency Braking and Collision Avoidance
   - Handling Adverse Weather Conditions
   - Tire Blowout and Vehicle Malfunction Response

4. **Turns & Intersections** (3 lessons)
   - Right of Way at Intersections
   - Protected vs. Unprotected Turns
   - Complex Intersection Navigation

5. **Speed Limits** (3 lessons)
   - Speed Limit Categories by Zone
   - School Zones and Residential Areas
   - Highway Speed Management

6. **Violations & Fines** (3 lessons)
   - Common Traffic Violations
   - Fine Structure and Point System
   - License Suspension Rules

7. **First Aid** (3 lessons)
   - Accident Scene Assessment
   - Basic Life Support (CPR)
   - Treating Common Injuries

**Lesson Features:**

- Structured content with introduction, key sections, and summary
- Country-specific information for each lesson
- Estimated reading time for each lesson
- Progress tracking (completed/in-progress/not started)
- Navigation between lessons (previous/next)
- "Ask AI" button for instant questions about the topic
- Key points summary for quick review

### 3. AI Driving Assistant

**Interactive Chat Interface**

- Full-screen chat experience similar to ChatGPT
- Real-time Q&A about traffic rules and driving situations
- Conversation history per user session
- Country-aware responses (answers specific to selected country)

**Quick Question Suggestions:**

- What are the speed limits in my country?
- Explain stop sign rules
- How do I navigate roundabouts?
- Right of way at intersections
- Where can't I park?

**Knowledge Base:**

The AI assistant can answer questions about:
- Traffic rules and regulations
- Road signs and their meanings
- Safe driving techniques
- Intersection navigation
- Speed limits and parking rules
- Traffic violations and penalties
- Exam preparation tips

**Image Upload Feature (UI Ready):**

- Upload button in chat interface
- Designed for analyzing road signs, intersections, and traffic situations
- Placeholder feedback for Level 1 prototype
- Ready for AI vision integration in future versions

### 4. Dashboard

**Learning Overview:**

- Welcome message with country flag
- Progress statistics:
  - Lessons completed (X / 21)
  - Time spent learning (minutes)
  - Current learning streak (days)
  - Next milestone progress

**Quick Actions:**

- Continue Learning (shows last lesson)
- Ask AI Assistant
- Upload Image for Analysis

**Recent Activity Feed:**

- Completed lessons
- AI assistant queries
- Practice test results
- Learning milestones

### 5. Progress Tracking

**Overall Statistics:**

- Total lessons completed
- Study time invested
- Current learning streak
- Practice tests completed

**Category Progress:**

- Breakdown by lesson category
- Visual progress bars for each category
- Completion percentage

**Achievements System:**

- "First Steps" - Complete your first lesson
- "Early Bird" - Study for 3 days in a row
- "Knowledge Seeker" - Complete 10 lessons
- "Practice Makes Perfect" - Pass 5 practice tests
- Achievement badges unlock as milestones are reached

### 6. Practice Tests (Placeholder)

**Planned Test Categories:**

- Quick Quiz (10 questions, 5 minutes)
- Traffic Signs Test (15 questions, 10 minutes)
- Full Practice Exam (40 questions, 30 minutes)
- Advanced Scenarios (25 questions, 20 minutes)

**Features (Coming Soon):**

- Exam-style questions based on country-specific rules
- Instant feedback and explanations
- Score tracking and analytics
- Timed tests simulating real exams

### 7. User Management & Authentication

**User Invitations**

- Admin sends invitation emails to new users
- Users receive secure invitation link via email
- Users set their own password (admins never see passwords)
- Invitation status tracking (pending/accepted/active)
- Resend invitation capability for pending users

**User Accounts**

- Profile management (name, email, profile picture)
- Profile picture support (JPEG, PNG, GIF, WebP, max 5MB)
- Country preference saved per user

**Authentication**

- Email/password login
- Password reset via email
- Automatic session management
- JWT-based authentication

**User Roles**

- **Regular User**: Access to all learning features
- **Admin**: Full system administration privileges

### 8. Administration (For Admins)

**Admin Console**

- Dashboard with system statistics
- Total users count
- Admin/regular user breakdown
- Active sessions monitoring
- Audit log access

**User Management**

- View all users with search and sorting
- Send user invitations
- Edit user information
- Track invitation status (pending/active)
- Resend invitations to pending users
- Assign admin privileges
- Delete users

**Audit Logging**

- Track all changes to users
- Record who, what, when for each change
- Browse logs with filtering
- View detailed change history

## Key User Workflows

### New User Onboarding

1. User receives invitation email from admin
2. Clicks invitation link
3. Creates password and logs in
4. Sees welcome dashboard with country selection
5. Selects preferred country (Kyrgyzstan/Russia/USA)
6. Explores quick actions or browses lessons

### Learning Journey

**Starting a Lesson:**

1. User clicks "Browse Lessons" from dashboard or sidebar
2. Views 7 lesson categories with progress indicators
3. Selects a category and clicks on a lesson
4. Reads lesson content with country-specific information
5. Uses "Ask AI" button if questions arise
6. Marks lesson as complete when finished
7. Proceeds to next lesson or returns to library

**Using AI Assistant:**

1. User clicks "AI Assistant" from sidebar or dashboard
2. Sees welcome message and quick question suggestions
3. Types question or clicks a quick suggestion
4. Receives instant, country-specific answer
5. Continues conversation with follow-up questions
6. Can upload images for analysis (UI ready)

**Tracking Progress:**

1. User clicks "My Progress" from sidebar
2. Views overall statistics (lessons, time, streak)
3. Sees category-by-category breakdown
4. Checks unlocked achievements
5. Sets goals for next learning session

### Country Switching

1. User clicks country dropdown in top navigation
2. Selects different country (Kyrgyzstan, Russia, or USA)
3. All content automatically updates to show rules for selected country
4. AI assistant responses reflect new country context
5. Dashboard updates with appropriate flag and country name

### Language Switching

1. User clicks language selector in top navigation
2. Selects preferred language (English or Русский)
3. Entire interface immediately updates to selected language
4. All menus, buttons, labels, and messages display in chosen language
5. Language preference is remembered for future sessions

## Data Access Rules

### Regular User Access

- View and edit own profile
- Access all learning content (lessons, AI assistant)
- View own progress and statistics
- Select country preference
- Select language preference (English/Russian)
- Cannot access admin features
- Cannot view other users' data

### Admin Access

- All regular user permissions
- Access admin console
- View system statistics
- Manage all users
- Send invitations
- View audit logs
- Assign admin privileges
- Delete users

## Current Features (Level 1 Prototype)

### Implemented Features

✅ **Landing Page**
- AutoMax AI branding
- Country flags (Kyrgyzstan, Russia, USA)
- Feature showcase (AI Assistant, Lessons, Image Analysis, etc.)
- Clear value proposition

✅ **Country Selection**
- Dropdown selector in navigation
- Three countries supported
- Session-based storage
- All pages adapt to selected country

✅ **Language Support**
- Language selector in navigation (English/Русский)
- Complete Russian translation infrastructure
- Session-based language preference
- Seamless switching without page reload
- Comprehensive translations for all UI elements

✅ **Lesson Library**
- 7 categories with 21 total lessons
- Category icons and descriptions
- Lesson progress indicators
- Reading time estimates
- Full lesson content with country-specific info
- Previous/Next navigation

✅ **AI Assistant**
- Full chat interface
- Real-time Q&A
- Quick question suggestions
- Country-aware responses
- Conversation history
- Image upload button (UI)

✅ **Dashboard**
- Learning statistics
- Progress overview
- Quick action buttons
- Recent activity feed
- Country flag display

✅ **Progress Page**
- Category breakdown
- Achievement badges
- Study time tracking
- Streak counter

✅ **Practice Tests Page**
- Coming soon placeholder
- Feature preview

✅ **Navigation**
- Sidebar with all main sections
- AutoMax AI logo
- Breadcrumb navigation
- Profile dropdown

### Implementation Details (Level 1)

**Frontend:**
- React + TypeScript + Inertia.js
- shadcn/ui components
- Tailwind CSS v4
- Responsive design
- Dark mode support

**Backend:**
- Rails 8.0 controllers
- Mock data for lessons
- Session-based country storage
- Mock AI responses (ready for real API)

**What's Mock/Placeholder:**
- Lesson completion not persisted (UI only)
- Progress data is hardcoded
- AI responses use simple pattern matching (not real AI yet)
- Image analysis UI only (no actual processing)
- Practice tests coming soon

## Next Steps (Future Versions)

### Level 2: Full Backend Implementation

- Database models for lessons and progress
- Real progress persistence
- User-specific lesson completion tracking
- Practice test database and scoring system
- Real-time progress analytics

### Level 3: Production Ready

- Comprehensive test coverage (RSpec, Vitest, Playwright)
- AI API integration (OpenAI/Anthropic)
- Image analysis with AI vision
- Video content support
- Performance optimizations
- Advanced analytics dashboard

### Future Enhancements

- More countries and languages
- Community features (forums, discussions)
- Instructor mode for driving schools
- Mobile app (iOS/Android)
- Offline mode for lessons
- Gamification (points, leaderboards, challenges)
- Social sharing of achievements
- Certificate generation on completion

---

*This specification documents AutoMax AI, an AI-powered driving school platform. The current implementation is a Level 1 prototype with full UI/UX and mock data, ready for backend integration and real AI API connections in future versions.*
