import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import {
  ClipboardList,
  Lock,
  Clock,
  Target,
  TrendingUp
} from 'lucide-react'

interface Props {
  country: string
}

export default function PracticeTestsIndex({ country }: Props) {
  const countryName = { kg: 'Kyrgyzstan', ru: 'Russia', us: 'USA' }[country]

  const testCategories = [
    {
      title: 'Quick Quiz',
      description: '10 random questions to test your knowledge',
      duration: '5 min',
      questions: 10,
      locked: false
    },
    {
      title: 'Traffic Signs Test',
      description: 'Focus on road signs and signals',
      duration: '10 min',
      questions: 15,
      locked: false
    },
    {
      title: 'Full Practice Exam',
      description: 'Complete exam simulation with 40 questions',
      duration: '30 min',
      questions: 40,
      locked: true,
      requirement: 'Complete 10 lessons to unlock'
    },
    {
      title: 'Advanced Scenarios',
      description: 'Complex driving situations and decision making',
      duration: '20 min',
      questions: 25,
      locked: true,
      requirement: 'Complete all lessons to unlock'
    },
  ]

  return (
    <div className="flex flex-1 flex-col">
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          {/* Header */}
          <div className="px-4 lg:px-6">
            <div>
              <h1 className="text-3xl font-bold tracking-tight">Practice Tests</h1>
              <p className="text-muted-foreground mt-2">
                Test your knowledge with exam-style questions for {countryName}
              </p>
            </div>
          </div>

          {/* Coming Soon Notice */}
          <div className="px-4 lg:px-6">
            <Card className="border-blue-200 bg-blue-50/50 dark:border-blue-900 dark:bg-blue-950/20">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <TrendingUp className="size-5 text-blue-500" />
                  Coming Soon!
                </CardTitle>
              </CardHeader>
              <CardContent>
                <p>
                  Practice tests are currently under development. This feature will include:
                </p>
                <ul className="mt-3 space-y-2 ml-4">
                  <li className="flex gap-2">
                    <span>•</span>
                    <span>Exam-style questions based on {countryName} traffic rules</span>
                  </li>
                  <li className="flex gap-2">
                    <span>•</span>
                    <span>Instant feedback and explanations for each answer</span>
                  </li>
                  <li className="flex gap-2">
                    <span>•</span>
                    <span>Score tracking and performance analytics</span>
                  </li>
                  <li className="flex gap-2">
                    <span>•</span>
                    <span>Timed tests to simulate real exam conditions</span>
                  </li>
                </ul>
                <p className="mt-4 text-sm text-muted-foreground">
                  In the meantime, continue learning with our lessons and ask the AI assistant any questions you have!
                </p>
              </CardContent>
            </Card>
          </div>

          {/* Test Categories (Preview) */}
          <div className="px-4 lg:px-6">
            <div className="grid gap-4 md:grid-cols-2">
              {testCategories.map((test, index) => (
                <Card key={index} className={test.locked ? 'opacity-60' : ''}>
                  <CardHeader>
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <CardTitle className="flex items-center gap-2">
                          {test.locked ? (
                            <Lock className="size-4 text-muted-foreground" />
                          ) : (
                            <ClipboardList className="size-4" />
                          )}
                          {test.title}
                        </CardTitle>
                        <CardDescription className="mt-2">
                          {test.description}
                        </CardDescription>
                      </div>
                    </div>
                  </CardHeader>
                  <CardContent>
                    <div className="flex flex-wrap items-center gap-2 mb-4">
                      <Badge variant="secondary">
                        <Clock className="mr-1 size-3" />
                        {test.duration}
                      </Badge>
                      <Badge variant="secondary">
                        <Target className="mr-1 size-3" />
                        {test.questions} questions
                      </Badge>
                    </div>
                    {test.locked ? (
                      <div>
                        <p className="text-sm text-muted-foreground mb-3">
                          {test.requirement}
                        </p>
                        <Button disabled className="w-full">
                          <Lock className="mr-2 size-4" />
                          Locked
                        </Button>
                      </div>
                    ) : (
                      <Button disabled className="w-full">
                        Coming Soon
                      </Button>
                    )}
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
