import { Link } from '@inertiajs/react'
import { Button } from '@/components/ui/button'
import {
  Sparkles,
  Zap,
  ArrowRight,
  Car,
  MessageSquare,
  BookOpen,
  Image,
  Globe,
  GraduationCap,
  Shield
} from 'lucide-react'

export default function Landing() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-primary/5 via-background to-accent/5">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 border-b bg-background/80 backdrop-blur-sm">
        <div className="container mx-auto flex h-16 items-center justify-between px-4">
          <div className="flex items-center gap-2">
            <div className="flex size-8 items-center justify-center rounded-lg bg-gradient-to-br from-blue-500 to-blue-600">
              <Car className="size-5 text-white" />
            </div>
            <span className="text-xl font-bold">AutoMax AI</span>
          </div>
          <Link href="/login">
            <Button variant="outline">Log In</Button>
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <main className="container mx-auto px-4 pt-32 pb-16">
        <div className="flex flex-col items-center text-center">
          {/* Animated Badge */}
          <div className="mb-6 inline-flex items-center gap-2 rounded-full border bg-card px-4 py-2 text-sm animate-fade-in">
            <Sparkles className="size-4 text-blue-500" />
            <span className="text-muted-foreground">100% Free AI-Powered Driving School</span>
          </div>

          {/* Main Headline */}
          <h1 className="mb-6 max-w-4xl text-4xl font-bold leading-tight tracking-tight md:text-5xl lg:text-6xl">
            Master Driving Rules with{' '}
            <span className="bg-gradient-to-r from-blue-500 via-blue-600 to-blue-500 bg-clip-text text-transparent animate-gradient">
              AI Assistant
            </span>
          </h1>

          {/* Subheadline */}
          <p className="mb-8 max-w-2xl text-lg text-muted-foreground md:text-xl">
            Learn traffic rules, practice with AI-powered lessons, and pass your driving exam.
            Interactive learning for Kyrgyzstan, Russia, and USA.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col gap-4 sm:flex-row">
            <Link href="/login">
              <Button size="lg" className="group bg-gradient-to-r from-blue-500 to-blue-600 hover:shadow-lg hover:shadow-blue-500/50 transition-all">
                Start Learning Free
                <ArrowRight className="ml-2 size-4 transition-transform group-hover:translate-x-1" />
              </Button>
            </Link>
            <Button size="lg" variant="outline" onClick={() => document.getElementById('features')?.scrollIntoView({ behavior: 'smooth' })}>
              View Features
            </Button>
          </div>

          {/* Countries Supported */}
          <div className="mt-16 w-full max-w-4xl">
            <p className="mb-6 text-sm font-medium text-muted-foreground uppercase tracking-wide">
              Available for multiple countries
            </p>
            <div className="flex justify-center gap-8">
              {[
                { name: 'Kyrgyzstan', flag: '🇰🇬' },
                { name: 'Russia', flag: '🇷🇺' },
                { name: 'USA', flag: '🇺🇸' },
              ].map((country) => (
                <div
                  key={country.name}
                  className="flex flex-col items-center gap-2 rounded-lg border bg-card p-6 transition-all hover:border-blue-500/50 hover:shadow-md"
                >
                  <span className="text-4xl">{country.flag}</span>
                  <span className="text-sm font-medium">{country.name}</span>
                </div>
              ))}
            </div>
          </div>

          {/* Features Section */}
          <div id="features" className="mt-24 w-full max-w-6xl">
            <h2 className="mb-4 text-3xl font-bold">Everything you need to pass your driving exam</h2>
            <p className="mb-12 text-lg text-muted-foreground">
              Complete learning platform with AI-powered assistance
            </p>

            <div className="grid gap-8 md:grid-cols-3">
              {[
                {
                  icon: MessageSquare,
                  title: 'AI Driving Assistant',
                  description: 'Ask questions about traffic rules, road signs, and driving situations. Get instant, accurate answers.',
                },
                {
                  icon: BookOpen,
                  title: 'Interactive Lessons',
                  description: 'Learn with structured lessons covering all topics: signs, intersections, safety, and more.',
                },
                {
                  icon: Image,
                  title: 'Image Analysis',
                  description: 'Upload photos of road signs or traffic situations and get AI-powered explanations.',
                },
                {
                  icon: GraduationCap,
                  title: 'Practice Tests',
                  description: 'Test your knowledge with exam-style questions and track your progress over time.',
                },
                {
                  icon: Globe,
                  title: 'Multi-Country Support',
                  description: 'Country-specific rules and regulations for Kyrgyzstan, Russia, and USA.',
                },
                {
                  icon: Shield,
                  title: 'Always Free',
                  description: 'All features are completely free. Learn at your own pace without any cost.',
                },
              ].map((feature) => (
                <div
key={feature.title}
                  className="rounded-xl border bg-card p-6 transition-all hover:border-blue-500/50 hover:shadow-lg"
                >
                  <div className="mb-4 inline-flex size-12 items-center justify-center rounded-lg bg-blue-500/10">
                    <feature.icon className="size-6 text-blue-500" />
                  </div>
                  <h3 className="mb-2 text-xl font-semibold">{feature.title}</h3>
                  <p className="text-muted-foreground">{feature.description}</p>
                </div>
              ))}
            </div>
          </div>

          {/* Final CTA */}
          <div className="mt-24 w-full max-w-4xl rounded-2xl border bg-gradient-to-br from-blue-500/10 via-background to-blue-600/10 p-12">
            <h2 className="mb-4 text-3xl font-bold">Ready to ace your driving exam?</h2>
            <p className="mb-8 text-lg text-muted-foreground">
              Join thousands of learners using AI to master traffic rules and pass their exams.
            </p>
            <Link href="/login">
              <Button size="lg" className="bg-gradient-to-r from-blue-500 to-blue-600 hover:shadow-lg hover:shadow-blue-500/50 transition-all">
                Start Learning Now - It's Free
              </Button>
            </Link>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="border-t py-8">
        <div className="container mx-auto px-4 text-center text-sm text-muted-foreground">
          <p>
            Built using{' '}
            <a
              href="https://cayu.ai"
              target="_blank"
              rel="noopener noreferrer"
              className="text-primary hover:underline"
            >
              Cayu AI
            </a>
          </p>
        </div>
      </footer>

      <style>{`
        @keyframes fade-in {
          from {
            opacity: 0;
            transform: translateY(-10px);
          }
          to {
            opacity: 1;
            transform: translateY(0);
          }
        }

        @keyframes gradient {
          0%, 100% {
            background-position: 0% 50%;
          }
          50% {
            background-position: 100% 50%;
          }
        }

        .animate-fade-in {
          animation: fade-in 0.6s ease-out;
        }

        .animate-gradient {
          background-size: 200% auto;
          animation: gradient 3s linear 3 forwards;
        }
      `}</style>
    </div>
  )
}
