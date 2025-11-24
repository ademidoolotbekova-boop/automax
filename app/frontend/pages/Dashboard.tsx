import { Link } from '@inertiajs/react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import {
  BookOpen,
  MessageSquare,
  TrendingUp,
  Clock,
  Target,
  Zap,
  ArrowRight,
  Image as ImageIcon,
  CheckCircle2
} from 'lucide-react'

interface DashboardProps {
  auth: {
    user: {
      id: number
      name: string
      email: string
      admin: boolean
    }
  }
  selectedCountry?: string
}

export default function Dashboard({ auth, selectedCountry = 'kg' }: DashboardProps) {
  const countryFlag = { kg: '🇰🇬', ru: '🇷🇺', us: '🇺🇸' }[selectedCountry]
  const countryName = { kg: 'Kyrgyzstan', ru: 'Russia', us: 'USA' }[selectedCountry]

  // Mock data for Level 1
  const stats = {
    lessonsCompleted: 3,
    totalLessons: 21,
    timeSpent: 45, // minutes
    currentStreak: 0, // days
    lastLesson: 'Understanding Road Signs - Regulatory, Warning, and Guide Signs'
  }

  const progressPercentage = Math.round((stats.lessonsCompleted / stats.totalLessons) * 100)

  const recentActivity = [
    { action: 'Completed lesson', title: 'Traffic Light Rules and Special Signals', time: '2 hours ago' },
    { action: 'Asked AI assistant', title: 'Speed limits in residential areas', time: '1 day ago' },
    { action: 'Started lesson', title: 'Understanding Road Signs', time: '2 days ago' },
  ]

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          {/* Welcome Header */}
          <div className="px-4 lg:px-6">
            <div className="flex items-start justify-between">
              <div>
                <div className="flex items-center gap-2 mb-2">
                  <span className="text-3xl">{countryFlag}</span>
                  <h1 className="text-3xl font-bold tracking-tight">
                    Welcome back, {auth.user.name}!
                  </h1>
                </div>
                <p className="text-muted-foreground">
                  Continue your driving education in {countryName}
                </p>
              </div>
            </div>
          </div>

          {/* Stats Grid */}
          <div className="px-4 lg:px-6">
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Lessons Completed</CardTitle>
                  <CheckCircle2 className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.lessonsCompleted} / {stats.totalLessons}</div>
                  <p className="text-xs text-muted-foreground mt-1">
                    {progressPercentage}% complete
                  </p>
                  <Progress value={progressPercentage} className="mt-2" />
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Time Spent Learning</CardTitle>
                  <Clock className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.timeSpent} min</div>
                  <p className="text-xs text-muted-foreground mt-1">
                    This week
                  </p>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Current Streak</CardTitle>
                  <Zap className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.currentStreak} days</div>
                  <p className="text-xs text-muted-foreground mt-1">
                    Keep learning daily!
                  </p>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Next Milestone</CardTitle>
                  <Target className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">5 lessons</div>
                  <p className="text-xs text-muted-foreground mt-1">
                    Until badge unlock
                  </p>
                </CardContent>
              </Card>
            </div>
          </div>

          {/* Quick Actions */}
          <div className="px-4 lg:px-6">
            <Card>
              <CardHeader>
                <CardTitle>Quick Actions</CardTitle>
                <CardDescription>Jump right back into learning</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="grid gap-4 md:grid-cols-3">
                  <Link href="/lessons">
                    <Button variant="outline" className="h-auto flex-col items-start gap-2 p-4 w-full">
                      <div className="flex items-center gap-2 self-stretch">
                        <div className="flex size-10 items-center justify-center rounded-lg bg-blue-500/10">
                          <BookOpen className="size-5 text-blue-500" />
                        </div>
                        <ArrowRight className="ml-auto size-4" />
                      </div>
                      <div className="text-left">
                        <p className="font-semibold">Continue Learning</p>
                        <p className="text-xs text-muted-foreground mt-1">
                          {stats.lastLesson}
                        </p>
                      </div>
                    </Button>
                  </Link>

                  <Link href="/ai-assistant">
                    <Button variant="outline" className="h-auto flex-col items-start gap-2 p-4 w-full">
                      <div className="flex items-center gap-2 self-stretch">
                        <div className="flex size-10 items-center justify-center rounded-lg bg-green-500/10">
                          <MessageSquare className="size-5 text-green-500" />
                        </div>
                        <ArrowRight className="ml-auto size-4" />
                      </div>
                      <div className="text-left">
                        <p className="font-semibold">Ask AI Assistant</p>
                        <p className="text-xs text-muted-foreground mt-1">
                          Get instant answers to your questions
                        </p>
                      </div>
                    </Button>
                  </Link>

                  <Link href="/ai-assistant">
                    <Button variant="outline" className="h-auto flex-col items-start gap-2 p-4 w-full">
                      <div className="flex items-center gap-2 self-stretch">
                        <div className="flex size-10 items-center justify-center rounded-lg bg-purple-500/10">
                          <ImageIcon className="size-5 text-purple-500" />
                        </div>
                        <ArrowRight className="ml-auto size-4" />
                      </div>
                      <div className="text-left">
                        <p className="font-semibold">Upload Image</p>
                        <p className="text-xs text-muted-foreground mt-1">
                          Analyze road signs and situations
                        </p>
                      </div>
                    </Button>
                  </Link>
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Recent Activity */}
          <div className="px-4 lg:px-6">
            <Card>
              <CardHeader>
                <CardTitle>Recent Activity</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {recentActivity.map((activity, index) => (
                    <div key={index} className="flex items-start gap-4">
                      <div className="flex size-2 shrink-0 translate-y-2 rounded-full bg-blue-500" />
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium">{activity.action}</p>
<p className="text-sm text-muted-foreground">{activity.title}</p>
                        <p className="text-xs text-muted-foreground mt-1">{activity.time}</p>
                      </div>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
