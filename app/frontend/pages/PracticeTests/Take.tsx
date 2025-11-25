import { useState, useEffect } from 'react'
import { router } from '@inertiajs/react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group'
import { Label } from '@/components/ui/label'
import { Progress } from '@/components/ui/progress'
import {
  Clock,
  AlertCircle,
  ChevronLeft,
  ChevronRight,
  Flag
} from 'lucide-react'

interface Answer {
  id: number
  answer_text: string
}

interface Question {
  id: number
  question_text: string
  question_type: string
  image_url: string | null
  answers: Answer[]
}

interface Test {
  id: number
  title: string
  difficulty: string
  duration_minutes: number
  passing_score: number
}

interface Props {
  test: Test
  attempt_id: number
  questions: Question[]
  country: string
}

export default function PracticeTestsTake({ test, attempt_id, questions, country }: Props) {
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0)
  const [selectedAnswers, setSelectedAnswers] = useState<Record<number, number>>({})
  const [timeRemaining, setTimeRemaining] = useState(test.duration_minutes * 60) // in seconds
  const [showWarning, setShowWarning] = useState(false)

  const currentQuestion = questions[currentQuestionIndex]
  const progress = ((currentQuestionIndex + 1) / questions.length) * 100
  const answeredCount = Object.keys(selectedAnswers).length

  // Timer countdown
  useEffect(() => {
    const timer = setInterval(() => {
      setTimeRemaining((prev) => {
        if (prev <= 1) {
          clearInterval(timer)
          handleSubmit() // Auto-submit when time runs out
          return 0
        }
        return prev - 1
      })
    }, 1000)

    return () => clearInterval(timer)
  }, [])

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60)
    const secs = seconds % 60
    return `${mins}:${secs.toString().padStart(2, '0')}`
  }

  const handleAnswerSelect = (questionId: number, answerId: number) => {
    setSelectedAnswers((prev) => ({
      ...prev,
      [questionId]: answerId,
    }))
  }

  const handleNext = () => {
    if (currentQuestionIndex < questions.length - 1) {
      setCurrentQuestionIndex((prev) => prev + 1)
    }
  }

  const handlePrevious = () => {
    if (currentQuestionIndex > 0) {
      setCurrentQuestionIndex((prev) => prev - 1)
    }
  }

  const handleSubmit = () => {
    if (answeredCount < questions.length && !showWarning) {
      setShowWarning(true)
      return
    }

    router.post(`/practice-tests/${test.id}/submit`, {
      id: attempt_id,
      answers: selectedAnswers,
    })
  }

  const isLowTime = timeRemaining < 60 // Less than 1 minute

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          <div className="px-4 lg:px-6">
            {/* Header with Timer */}
            <div className="mb-6">
              <div className="flex items-center justify-between mb-4">
                <div>
                  <h1 className="text-2xl font-bold tracking-tight">{test.title}</h1>
                  <p className="text-sm text-muted-foreground mt-1">
                    Question {currentQuestionIndex + 1} of {questions.length}
                  </p>
                </div>
                <div className="flex items-center gap-4">
                  <Badge variant={isLowTime ? 'destructive' : 'secondary'} className="text-lg px-4 py-2">
                    <Clock className="mr-2 size-4" />
                    {formatTime(timeRemaining)}
                  </Badge>
                  <Badge variant="outline" className="text-lg px-4 py-2">
                    {answeredCount} / {questions.length}
                  </Badge>
                </div>
              </div>
              <Progress value={progress} className="h-2" />
            </div>

            {/* Warning Message */}
            {showWarning && (
              <Card className="mb-6 border-orange-200 bg-orange-50/50 dark:border-orange-900 dark:bg-orange-950/20">
                <CardContent className="pt-6">
                  <div className="flex items-start gap-3">
                    <AlertCircle className="size-5 text-orange-500 shrink-0 mt-0.5" />
                    <div className="flex-1">
                      <p className="font-medium text-orange-900 dark:text-orange-100">
                        You haven't answered all questions
                      </p>
                      <p className="text-sm text-orange-700 dark:text-orange-300 mt-1">
                        You've answered {answeredCount} out of {questions.length} questions.
                        Are you sure you want to submit?
                      </p>
                      <div className="flex gap-2 mt-3">
                        <Button size="sm" variant="outline" onClick={() => setShowWarning(false)}>
                          Continue Test
                        </Button>
                        <Button size="sm" variant="destructive" onClick={handleSubmit}>
                          Submit Anyway
                        </Button>
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>
            )}

            {/* Question Card */}
            <Card className="mb-6">
              <CardHeader>
                <CardTitle className="text-xl leading-relaxed">
                  {currentQuestion.question_text}
                </CardTitle>
              </CardHeader>
              <CardContent>
                {currentQuestion.image_url && (
                  <div className="mb-6">
                    <img
                      src={currentQuestion.image_url}
                      alt="Question illustration"
                      className="rounded-lg max-w-full h-auto"
                    />
                  </div>
                )}

                <RadioGroup
                  value={selectedAnswers[currentQuestion.id]?.toString()}
                  onValueChange={(value) => handleAnswerSelect(currentQuestion.id, parseInt(value))}
                >
                  <div className="space-y-3">
                    {currentQuestion.answers.map((answer, index) => (
                      <div
                        key={answer.id}
                        className="flex items-start space-x-3 rounded-lg border p-4 hover:bg-muted/50 cursor-pointer transition-colors"
                      >
                        <RadioGroupItem value={answer.id.toString()} id={`answer-${answer.id}`} className="mt-0.5" />
                        <Label
                          htmlFor={`answer-${answer.id}`}
                          className="flex-1 cursor-pointer font-normal leading-relaxed"
                        >
                          <span className="font-medium mr-2">
                            {String.fromCharCode(65 + index)}.
                          </span>
                          {answer.answer_text}
                        </Label>
                      </div>
                    ))}
                  </div>
                </RadioGroup>
              </CardContent>
            </Card>

            {/* Navigation Buttons */}
            <div className="flex items-center justify-between gap-4">
              <Button
                variant="outline"
                onClick={handlePrevious}
                disabled={currentQuestionIndex === 0}
              >
                <ChevronLeft className="mr-2 size-4" />
                Previous
              </Button>

              <div className="flex gap-2">
                {currentQuestionIndex === questions.length - 1 ? (
                  <Button onClick={handleSubmit} size="lg">
                    <Flag className="mr-2 size-4" />
                    Submit Test
                  </Button>
                ) : (
                  <Button onClick={handleNext}>
                    Next
                    <ChevronRight className="ml-2 size-4" />
                  </Button>
                )}
              </div>
            </div>

            {/* Question Grid Navigation */}
            <Card className="mt-6">
              <CardHeader>
                <CardTitle className="text-sm">Question Overview</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="grid grid-cols-8 gap-2">
                  {questions.map((question, index) => {
                    const isAnswered = selectedAnswers[question.id] !== undefined
                    const isCurrent = index === currentQuestionIndex

                    return (
                      <button
                        key={question.id}
                        onClick={() => setCurrentQuestionIndex(index)}
                        className={`
                          aspect-square rounded-md text-sm font-medium transition-all
                          ${isCurrent ? 'ring-2 ring-blue-500 ring-offset-2' : ''}
                          ${isAnswered
                            ? 'bg-blue-500 text-white hover:bg-blue-600'
                            : 'bg-muted text-muted-foreground hover:bg-muted/80'
                          }
                        `}
                      >
                        {index + 1}
                      </button>
                    )
                  })}
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </div>
  )
}
