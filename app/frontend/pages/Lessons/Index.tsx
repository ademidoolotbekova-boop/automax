import { Link, usePage } from '@inertiajs/react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import {
  SignpostBig,
  ArrowLeftRight,
  AlertTriangle,
  Navigation,
  Gauge,
  FileWarning,
  HeartPulse,
  Clock,
  CheckCircle2,
  Circle,
  ArrowRight
} from 'lucide-react'
import { useTranslation } from '@/lib/i18n'

interface Lesson {
  id: number
  title: string
  duration: string
  completed: boolean
}

interface Category {
  id: string
  title: string
  icon: string
  description: string
  lessons: Lesson[]
}

interface Props {
  categories: Category[]
  country: string
}

const ICON_MAP: Record<string, any> = {
  sign: SignpostBig,
  lanes: ArrowLeftRight,
  alert: AlertTriangle,
  turn: Navigation,
  speed: Gauge,
  fine: FileWarning,
  medical: HeartPulse,
}

export default function LessonsIndex({ categories, country }: Props) {
  const { props } = usePage()
  const { t } = useTranslation(props.selectedLanguage as any)
  const totalLessons = categories.reduce((sum, cat) => sum + cat.lessons.length, 0)
  const completedLessons = categories.reduce(
    (sum, cat) => sum + cat.lessons.filter(l => l.completed).length,
    0
  )

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          {/* Header */}
          <div className="px-4 lg:px-6">
            <div className="flex flex-col gap-4">
              <div>
                <h1 className="text-3xl font-bold tracking-tight">{t.lessons.browseLessons}</h1>
                <p className="text-muted-foreground mt-2">
                  {t.lessons.masterDrivingRules}
                </p>
              </div>

              {/* Progress Overview */}
              <Card>
                <CardHeader>
                  <CardTitle className="text-lg">{t.lessons.yourLearningProgress}</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="flex items-center gap-4">
                    <div className="flex-1">
                      <div className="mb-2 flex items-center justify-between text-sm">
                        <span className="text-muted-foreground">{t.lessons.completedLessons}</span>
                        <span className="font-medium">{completedLessons} / {totalLessons}</span>
                      </div>
                      <div className="h-2 w-full overflow-hidden rounded-full bg-secondary">
                        <div
                          className="h-full bg-blue-500 transition-all"
                          style={{ width: `${(completedLessons / totalLessons) * 100}%` }}
                        />
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </div>
          </div>

          {/* Categories */}
          <div className="px-4 lg:px-6">
            <div className="grid gap-6">
              {categories.map((category) => {
                const Icon = ICON_MAP[category.icon] || SignpostBig
                const categoryCompleted = category.lessons.filter(l => l.completed).length
                const categoryTotal = category.lessons.length

                return (
                  <Card key={category.id} className="overflow-hidden">
                    <CardHeader className="bg-muted/50">
                      <div className="flex items-start justify-between">
                        <div className="flex items-start gap-4">
                          <div className="flex size-12 shrink-0 items-center justify-center rounded-lg bg-blue-500/10">
                            <Icon className="size-6 text-blue-500" />
                          </div>
                          <div>
                            <CardTitle className="text-xl">{category.title}</CardTitle>
                            <CardDescription className="mt-1">
                              {category.description}
                            </CardDescription>
                          </div>
                        </div>
                        <Badge variant="secondary">
                          {categoryCompleted} / {categoryTotal}
                        </Badge>
                      </div>
                    </CardHeader>
                    <CardContent className="p-0">
                      <div className="divide-y">
                        {category.lessons.map((lesson, index) => (
                          <Link
                            key={lesson.id}
                            href={`/lessons/${lesson.id}`}
                            className="block transition-colors hover:bg-muted/50"
                          >
                            <div className="flex items-center gap-4 p-4">
                              <div className="flex size-8 shrink-0 items-center justify-center">
                                {lesson.completed ? (
                                  <CheckCircle2 className="size-5 text-green-500" />
                                ) : (
                                  <Circle className="size-5 text-muted-foreground" />
                                )}
                              </div>
                              <div className="flex-1 min-w-0">
                                <p className="font-medium leading-tight">
                                  {index + 1}. {lesson.title}
                                </p>
                                <div className="mt-1 flex items-center gap-2 text-sm text-muted-foreground">
                                  <Clock className="size-3" />
                                  <span>{lesson.duration}</span>
                                </div>
                              </div>
                              <Button variant="ghost" size="sm" className="shrink-0">
                                {t.lessons.start}
                                <ArrowRight className="ml-2 size-4" />
                              </Button>
                            </div>
                          </Link>
                        ))}
                      </div>
                    </CardContent>
                  </Card>
                )
              })}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
