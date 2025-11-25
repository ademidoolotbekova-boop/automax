import { Link, usePage } from '@inertiajs/react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import {
  ClipboardList,
  Clock,
  Target,
  Trophy,
  CheckCircle2,
  PlayCircle
} from 'lucide-react'
import { useTranslation } from '@/lib/i18n'

interface Test {
  id: number
  title: string
  description: string
  difficulty: string
  difficulty_display: string
  difficulty_color: string
  duration: string
  questions_count: number
  passing_score: number
  best_score: number
  attempts_count: number
  passed: boolean
}

interface Props {
  tests: Test[]
  country: string
}

export default function PracticeTestsIndex({ tests, country }: Props) {
  const { props } = usePage()
  const { t } = useTranslation(props.selectedLanguage as any)
  const countryName = { kg: 'Kyrgyzstan', ru: 'Russia', us: 'USA' }[country]

  const getDifficultyVariant = (color: string) => {
    if (color === 'green') return 'default'
    if (color === 'orange') return 'secondary'
    if (color === 'red') return 'destructive'
    return 'secondary'
  }

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          {/* Header */}
          <div className="px-4 lg:px-6">
            <div>
              <h1 className="text-3xl font-bold tracking-tight">{t.practiceTests.title}</h1>
              <p className="text-muted-foreground mt-2">
                {t.practiceTests.subtitle} {countryName}
              </p>
            </div>
          </div>

          {/* Test Categories */}
          <div className="px-4 lg:px-6">
            <div className="grid gap-4 md:grid-cols-2">
              {tests.map((test) => (
                <Card key={test.id} className="flex flex-col">
                  <CardHeader>
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <div className="flex items-center gap-2 mb-2">
                          <CardTitle className="flex items-center gap-2">
                            <ClipboardList className="size-4" />
                            {test.title}
                          </CardTitle>
                          <Badge variant={getDifficultyVariant(test.difficulty_color)}>
                            {test.difficulty_display}
                          </Badge>
                        </div>
                        <CardDescription>
                          {test.description}
                        </CardDescription>
                      </div>
                    </div>
                  </CardHeader>
                  <CardContent className="flex-1 flex flex-col">
                    <div className="flex flex-wrap items-center gap-2 mb-4">
                      <Badge variant="outline">
                        <Clock className="mr-1 size-3" />
                        {test.duration}
                      </Badge>
                      <Badge variant="outline">
                        <Target className="mr-1 size-3" />
                        {test.questions_count} questions
                      </Badge>
                      <Badge variant="outline">
                        <Trophy className="mr-1 size-3" />
                        {t.practiceTests.pass}: {test.passing_score}%
                      </Badge>
                    </div>

                    {/* Score Display */}
                    {test.attempts_count > 0 && (
                      <div className="mb-4 p-3 rounded-lg bg-muted/50">
                        <div className="flex items-center justify-between text-sm">
                          <span className="text-muted-foreground">{t.practiceTests.bestScore}:</span>
                          <div className="flex items-center gap-2">
                            <span className="font-semibold text-lg">
                              {Math.round((test.best_score / test.questions_count) * 100)}%
                            </span>
                            {test.passed && (
                              <CheckCircle2 className="size-4 text-green-500" />
                            )}
                          </div>
                        </div>
                        <div className="mt-2 text-xs text-muted-foreground">
                          {test.attempts_count} {test.attempts_count === 1 ? t.practiceTests.attempt : t.practiceTests.attempts}
                        </div>
                      </div>
                    )}

                    <div className="mt-auto">
                      <Link href={`/practice-tests/${test.id}`}>
                        <Button className="w-full">
                          <PlayCircle className="mr-2 size-4" />
                          {test.attempts_count > 0 ? t.practiceTests.tryAgain : t.practiceTests.startTest}
                        </Button>
                      </Link>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
