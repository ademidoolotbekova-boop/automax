import { Link } from '@inertiajs/react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import {
  TrendingUp,
  Award,
  Target,
  Calendar,
  Clock,
  BookOpen,
  CheckCircle2,
  BarChart3
} from 'lucide-react'

interface Props {
  country: string
}

export default function ProgressIndex({ country }: Props) {
  const countryName = { kg: 'Kyrgyzstan', ru: 'Russia', us: 'USA' }[country]

  // Mock data for Level 1
  const stats = {
    totalLessons: 21,
    completedLessons: 3,
    totalTime: 45,
    streak: 0,
    accuracyRate: 0,
    practiceTests: 0
  }

  const categoryProgress = [
    { category: 'Traffic Signs & Signals', completed: 2, total: 3, percentage: 67 },
    { category: 'Lane Changes & Merging', completed: 1, total: 3, percentage: 33 },
    { category: 'Dangerous Situations', completed: 0, total: 3, percentage: 0 },
    { category: 'Turns & Intersections', completed: 0, total: 3, percentage: 0 },
    { category: 'Speed Limits', completed: 0, total: 3, percentage: 0 },
    { category: 'Violations & Fines', completed: 0, total: 3, percentage: 0 },
    { category: 'First Aid', completed: 0, total: 3, percentage: 0 },
  ]

  const achievements = [
    { name: 'First Steps', description: 'Complete your first lesson', unlocked: true },
    { name: 'Early Bird', description: 'Study for 3 days in a row', unlocked: false },
    { name: 'Knowledge Seeker', description: 'Complete 10 lessons', unlocked: false },
    { name: 'Practice Makes Perfect', description: 'Pass 5 practice tests', unlocked: false },
  ]

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          {/* Header */}
          <div className="px-4 lg:px-6">
            <div>
              <h1 className="text-3xl font-bold tracking-tight">My Progress</h1>
              <p className="text-muted-foreground mt-2">
                Track your learning journey in {countryName}
              </p>
            </div>
          </div>

          {/* Overview Stats */}
          <div className="px-4 lg:px-6">
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Lessons Completed</CardTitle>
                  <BookOpen className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.completedLessons} / {stats.totalLessons}</div>
                  <Progress value={(stats.completedLessons / stats.totalLessons) * 100} className="mt-2" />
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Study Time</CardTitle>
                  <Clock className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.totalTime} min</div>
                  <p className="text-xs text-muted-foreground mt-1">Total time invested</p>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Current Streak</CardTitle>
                  <Calendar className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.streak} days</div>
                  <p className="text-xs text-muted-foreground mt-1">Keep learning daily!</p>
                </CardContent>
              </Card>

              <Card>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                  <CardTitle className="text-sm font-medium">Practice Tests</CardTitle>
                  <BarChart3 className="size-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">{stats.practiceTests}</div>
                  <p className="text-xs text-muted-foreground mt-1">Tests completed</p>
                </CardContent>
              </Card>
            </div>
          </div>

          {/* Category Progress */}
          <div className="px-4 lg:px-6">
            <Card>
              <CardHeader>
                <CardTitle>Progress by Category</CardTitle>
                <CardDescription>Your completion status for each lesson category</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {categoryProgress.map((cat, index) => (
                    <div key={index} className="space-y-2">
                      <div className="flex items-center justify-between text-sm">
                        <span className="font-medium">{cat.category}</span>
                        <span className="text-muted-foreground">
                          {cat.completed} / {cat.total} lessons
                        </span>
                      </div>
                      <Progress value={cat.percentage} />
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Achievements */}
          <div className="px-4 lg:px-6">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Award className="size-5" />
                  Achievements
                </CardTitle>
                <CardDescription>Unlock badges as you progress</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="grid gap-4 md:grid-cols-2">
                  {achievements.map((achievement, index) => (
                    <div
                      key={index}
                      className={`flex items-start gap-4 rounded-lg border p-4 ${
                        achievement.unlocked ? 'bg-green-50/50 border-green-200 dark:bg-green-950/20 dark:border-green-900' : 'opacity-60'
                      }`}
                    >
                      <div className={`flex size-12 shrink-0 items-center justify-center rounded-full ${
                        achievement.unlocked ? 'bg-green-500 text-white' : 'bg-muted'
                      }`}>
                        {achievement.unlocked ? (
                          <Award className="size-6" />
                        ) : (
                          <Target className="size-6" />
                        )}
                      </div>
                      <div className="flex-1">
                        <div className="flex items-center gap-2">
                          <p className="font-semibold">{achievement.name}</p>
                          {achievement.unlocked && (
                            <CheckCircle2 className="size-4 text-green-500" />
                          )}
                        </div>
                        <p className="text-sm text-muted-foreground mt-1">
{achievement.description}
                        </p>
                      </div>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Next Steps */}
          <div className="px-4 lg:px-6">
            <Card className="border-blue-200 bg-blue-50/50 dark:border-blue-900 dark:bg-blue-950/20">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <TrendingUp className="size-5 text-blue-500" />
                  Keep Going!
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p className="mb-4">
                  You've completed {stats.completedLessons} lessons so far. Continue learning to unlock more achievements and improve your knowledge.
                </p>
                <Link href="/lessons">
                  <span className="text-blue-600 hover:text-blue-700 font-medium underline">
                    Continue learning →
                  </span>
                </Link>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
