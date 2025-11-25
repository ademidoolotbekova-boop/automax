import { Link, router } from '@inertiajs/react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Separator } from '@/components/ui/separator'
import {
  Clock,
  CheckCircle2,
  ChevronLeft,
  ChevronRight,
  MessageSquare,
  Lightbulb
} from 'lucide-react'

interface Lesson {
  id: number
  title: string
  duration: string
  completed: boolean
}

interface Category {
  id: string
  title: string
}

interface ContentSection {
  title: string
  content: string
}

interface Content {
  introduction: string
  sections: ContentSection[]
  key_points: string[]
  quiz_preview: string
}

interface Props {
  lesson: Lesson
  category: Category
  content: Content
  prev_lesson: Lesson | null
  next_lesson: Lesson | null
  country: string
}

export default function LessonShow({ lesson, category, content, prev_lesson, next_lesson, country }: Props) {
  const handleMarkComplete = () => {
    router.post(`/lessons/${lesson.id}/complete`, {}, {
      preserveScroll: true,
      onSuccess: () => {
        router.reload({ only: ['lesson'] })
      }
    })
  }

  const handleAskAI = () => {
    router.visit('/ai-assistant', {
      data: { context: `I'm learning about: ${lesson.title}` }
    })
  }

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          <div className="px-4 lg:px-6">
            {/* Header */}
            <div className="mb-6 flex flex-col gap-4">
              <div className="flex items-start justify-between gap-4">
                <div className="flex-1">
                  <Badge variant="secondary" className="mb-3">
                    {category.title}
                  </Badge>
                  <h1 className="text-3xl font-bold tracking-tight mb-2">{lesson.title}</h1>
                  <div className="flex items-center gap-4 text-sm text-muted-foreground">
                    <div className="flex items-center gap-1.5">
                      <Clock className="size-4" />
                      <span>{lesson.duration}</span>
                    </div>
                    {lesson.completed && (
                      <div className="flex items-center gap-1.5 text-green-600">
                        <CheckCircle2 className="size-4" />
                        <span>Completed</span>
                      </div>
                    )}
                  </div>
                </div>
                <Button onClick={handleAskAI} variant="outline">
                  <MessageSquare className="mr-2 size-4" />
                  Ask AI
                </Button>
              </div>
            </div>

            {/* Content */}
            <div className="grid gap-6">
              {/* Introduction */}
              <Card>
                <CardContent className="pt-6">
                  <p className="text-lg leading-relaxed">{content.introduction}</p>
                </CardContent>
              </Card>

              {/* Sections */}
              {content.sections.map((section, index) => (
                <Card key={index}>
                  <CardHeader>
                    <CardTitle className="text-xl">{section.title}</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <p className="leading-relaxed text-muted-foreground">{section.content}</p>
                  </CardContent>
                </Card>
              ))}

              {/* Key Points */}
              <Card className="border-blue-200 bg-blue-50/50 dark:border-blue-900 dark:bg-blue-950/20">
                <CardHeader>
                  <div className="flex items-center gap-2">
                    <Lightbulb className="size-5 text-blue-500" />
                    <CardTitle className="text-xl">Key Points to Remember</CardTitle>
                  </div>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-2">
                    {content.key_points.map((point, index) => (
                      <li key={index} className="flex gap-3">
                        <span className="mt-1.5 size-1.5 shrink-0 rounded-full bg-blue-500" />
                        <span className="leading-relaxed">{point}</span>
                      </li>
                    ))}
                  </ul>
                </CardContent>
              </Card>

              {/* Quiz Preview */}
              <Card>
                <CardContent className="pt-6">
                  <p className="text-muted-foreground">{content.quiz_preview}</p>
                </CardContent>
              </Card>

              {/* Actions */}
              <div className="flex items-center justify-between gap-4">
                <div>
                  {prev_lesson && (
                    <Link href={`/lessons/${prev_lesson.id}`}>
                      <Button variant="outline">
                        <ChevronLeft className="mr-2 size-4" />
                        Previous Lesson
                      </Button>
                    </Link>
                  )}
                </div>

                <div className="flex items-center gap-3">
                  {!lesson.completed && (
                    <Button onClick={handleMarkComplete} variant="default">
                      <CheckCircle2 className="mr-2 size-4" />
                      Mark as Complete
                    </Button>
                  )}
                  {next_lesson && (
                    <Link href={`/lessons/${next_lesson.id}`}>
                      <Button>
                        Next Lesson
                        <ChevronRight className="ml-2 size-4" />
                      </Button>
                    </Link>
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
