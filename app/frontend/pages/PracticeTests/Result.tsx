import { Link, usePage } from '@inertiajs/react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Separator } from '@/components/ui/separator'
import {
  CheckCircle2,
  XCircle,
  Trophy,
  Clock,
  Target,
  RotateCcw,
  Home,
  Lightbulb
} from 'lucide-react'
import { useTranslation } from '@/lib/i18n'

interface Answer {
  text: string
  is_correct: boolean
  explanation: string
}

interface Result {
  question_text: string
  user_answer_text: string
  correct_answer_text: string
  is_correct: boolean
  explanation: string
  all_answers: Answer[]
}

interface Test {
  title: string
  passing_score: number
}

interface Attempt {
  score: number
  percentage: number
  correct_answers: number
  total_questions: number
  passed: boolean
  duration_seconds: number
}

interface Props {
  test: Test
  attempt: Attempt
  results: Result[]
}

export default function PracticeTestsResult({ test, attempt, results }: Props) {
  const { props } = usePage()
  const { t } = useTranslation(props.selectedLanguage as any)

  const formatDuration = (seconds: number) => {
    const mins = Math.floor(seconds / 60)
    const secs = seconds % 60
    return `${mins}m ${secs}s`
  }

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          <div className="px-4 lg:px-6">
            {/* Header */}
            <div className="mb-6">
              <h1 className="text-3xl font-bold tracking-tight mb-2">{t.practiceTests.testResults}</h1>
              <p className="text-muted-foreground">{test.title}</p>
            </div>

            {/* Score Summary Card */}
            <Card className={`mb-6 ${
              attempt.passed
                ? 'border-green-200 bg-green-50/50 dark:border-green-900 dark:bg-green-950/20'
                : 'border-red-200 bg-red-50/50 dark:border-red-900 dark:bg-red-950/20'
            }`}>
              <CardHeader>
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    {attempt.passed ? (
                      <div className="flex size-12 items-center justify-center rounded-full bg-green-500/10">
                        <Trophy className="size-6 text-green-500" />
                      </div>
                    ) : (
                      <div className="flex size-12 items-center justify-center rounded-full bg-red-500/10">
                        <XCircle className="size-6 text-red-500" />
                      </div>
                    )}
                    <div>
                      <CardTitle className="text-2xl">
                        {attempt.passed ? t.practiceTests.congratulations : t.practiceTests.keepTrying}
                      </CardTitle>
                      <p className="text-sm text-muted-foreground mt-1">
                        {attempt.passed
                          ? `${t.practiceTests.passedMessage} ${test.passing_score}%`
                          : `${t.practiceTests.failedMessage} ${test.passing_score}% ${t.practiceTests.toPass}`
                        }
                      </p>
                    </div>
                  </div>
                  <Badge
                    variant={attempt.passed ? 'default' : 'destructive'}
                    className="text-3xl px-6 py-3"
                  >
                    {Math.round(attempt.percentage)}%
                  </Badge>
                </div>
              </CardHeader>
              <CardContent>
                <div className="grid grid-cols-3 gap-4">
                  <div className="flex items-center gap-3">
                    <div className="flex size-10 items-center justify-center rounded-lg bg-background">
                      <Target className="size-5 text-muted-foreground" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{attempt.correct_answers}</p>
                      <p className="text-xs text-muted-foreground">{t.practiceTests.correctAnswers}</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="flex size-10 items-center justify-center rounded-lg bg-background">
                      <CheckCircle2 className="size-5 text-muted-foreground" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{attempt.total_questions}</p>
                      <p className="text-xs text-muted-foreground">{t.practiceTests.totalQuestions}</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="flex size-10 items-center justify-center rounded-lg bg-background">
                      <Clock className="size-5 text-muted-foreground" />
                    </div>
                    <div>
                      <p className="text-2xl font-bold">{formatDuration(attempt.duration_seconds)}</p>
                      <p className="text-xs text-muted-foreground">{t.practiceTests.timeTaken}</p>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>

            {/* Action Buttons */}
            <div className="flex gap-3 mb-6">
              <Link href="/practice-tests">
                <Button variant="outline">
                  <Home className="mr-2 size-4" />
                  {t.practiceTests.backToTests}
                </Button>
              </Link>
              <Link href={`/practice-tests/${test.title}`}>
                <Button>
                  <RotateCcw className="mr-2 size-4" />
                  {t.practiceTests.tryAgain}
                </Button>
              </Link>
            </div>

            {/* Detailed Results */}
            <div className="space-y-6">
              <div className="flex items-center gap-2">
                <Lightbulb className="size-5 text-blue-500" />
                <h2 className="text-xl font-semibold">{t.practiceTests.detailedReview}</h2>
              </div>

              {results.map((result, index) => (
                <Card
                  key={index}
                  className={
                    result.is_correct
                      ? 'border-green-200 dark:border-green-900'
                      : 'border-red-200 dark:border-red-900'
                  }
                >
                  <CardHeader>
                    <div className="flex items-start justify-between gap-4">
                      <div className="flex-1">
                        <div className="flex items-center gap-2 mb-2">
                          <Badge variant="outline">{t.practiceTests.question} {index + 1}</Badge>
                          {result.is_correct ? (
                            <Badge variant="default" className="bg-green-500">
                              <CheckCircle2 className="mr-1 size-3" />
                              {t.practiceTests.correct}
                            </Badge>
                          ) : (
                            <Badge variant="destructive">
                              <XCircle className="mr-1 size-3" />
                              {t.practiceTests.incorrect}
                            </Badge>
                          )}
                        </div>
                        <CardTitle className="text-lg leading-relaxed">
                          {result.question_text}
                        </CardTitle>
                      </div>
                    </div>
                  </CardHeader>
                  <CardContent>
                    <div className="space-y-4">
                      {/* Your Answer */}
                      <div>
                        <p className="text-sm font-medium text-muted-foreground mb-2">{t.practiceTests.yourAnswer}</p>
                        <div
                          className={`p-3 rounded-lg ${
                            result.is_correct
                              ? 'bg-green-50 dark:bg-green-950/20'
                              : 'bg-red-50 dark:bg-red-950/20'
                          }`}
                        >
                          <p className="leading-relaxed">{result.user_answer_text}</p>
                        </div>
                      </div>

                      {/* Correct Answer (if wrong) */}
                      {!result.is_correct && (
                        <div>
                          <p className="text-sm font-medium text-muted-foreground mb-2">{t.practiceTests.correctAnswer}</p>
                          <div className="p-3 rounded-lg bg-green-50 dark:bg-green-950/20">
                            <p className="leading-relaxed">{result.correct_answer_text}</p>
                          </div>
                        </div>
                      )}

                      <Separator />

                      {/* Explanation */}
                      <div className="bg-blue-50/50 dark:bg-blue-950/20 p-4 rounded-lg">
                        <div className="flex gap-2 items-start">
                          <Lightbulb className="size-4 text-blue-500 shrink-0 mt-0.5" />
                          <div>
                            <p className="text-sm font-medium text-blue-900 dark:text-blue-100 mb-1">
                              {t.practiceTests.explanation}
                            </p>
                            <p className="text-sm text-blue-800 dark:text-blue-200 leading-relaxed">
                              {result.explanation}
                            </p>
                          </div>
                        </div>
                      </div>

                      {/* All Answers with Explanations */}
                      {!result.is_correct && (
                        <details className="group">
                          <summary className="cursor-pointer text-sm font-medium text-muted-foreground hover:text-foreground">
                            {t.practiceTests.showAllAnswers}
                          </summary>
                          <div className="mt-3 space-y-2">
                            {result.all_answers.map((answer, idx) => (
                              <div
                                key={idx}
                                className={`p-3 rounded-lg border ${
                                  answer.is_correct
                                    ? 'border-green-200 bg-green-50/50 dark:border-green-900 dark:bg-green-950/20'
                                    : 'border-gray-200 bg-gray-50/50 dark:border-gray-800 dark:bg-gray-950/20'
                                }`}
                              >
                                <div className="flex items-start gap-2 mb-1">
                                  {answer.is_correct && (
                                    <CheckCircle2 className="size-4 text-green-500 shrink-0 mt-0.5" />
                                  )}
                                  <p className="text-sm font-medium">{answer.text}</p>
                                </div>
                                {answer.explanation && (
                                  <p className="text-xs text-muted-foreground ml-6">
                                    {answer.explanation}
                                  </p>
                                )}
                              </div>
                            ))}
                          </div>
                        </details>
                      )}
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>

            {/* Bottom Actions */}
            <div className="flex justify-center gap-3 mt-8">
              <Link href="/practice-tests">
                <Button variant="outline" size="lg">
                  <Home className="mr-2 size-4" />
                  {t.practiceTests.backToTests}
                </Button>
              </Link>
              <Link href={`/practice-tests/${test.title}`}>
                <Button size="lg">
                  <RotateCcw className="mr-2 size-4" />
                  {t.practiceTests.tryAgain}
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
