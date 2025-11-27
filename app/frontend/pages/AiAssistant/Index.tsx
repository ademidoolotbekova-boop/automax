import { useState, useRef, useEffect } from 'react'
import { router, usePage } from '@inertiajs/react'
import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Textarea } from '@/components/ui/textarea'
import { Badge } from '@/components/ui/badge'
import {
  Send,
  Image as ImageIcon,
  Sparkles,
  User,
  Loader2
} from 'lucide-react'
import { useTranslation } from '@/lib/i18n'

interface Message {
  role: 'user' | 'assistant'
  content: string
  timestamp: string
  image_url?: string
}

interface Props {
  country: string
  initial_context?: string
}

export default function AiAssistantIndex({ country, initial_context }: Props) {
  const { props } = usePage()
  const { t } = useTranslation(props.selectedLanguage as any)
  const [messages, setMessages] = useState<Message[]>([])
  const [input, setInput] = useState(initial_context || '')
  const [isLoading, setIsLoading] = useState(false)
  const messagesEndRef = useRef<HTMLDivElement>(null)
  const textareaRef = useRef<HTMLTextAreaElement>(null)

  const countryName = { kg: 'Kyrgyzstan', ru: 'Russia', us: 'USA' }[country]
  const countryNameRu = { kg: 'Кыргызстане', ru: 'России', us: 'США' }[country]
  const countryDisplayName = props.selectedLanguage === 'ru' ? countryNameRu : countryName

  const quickQuestions = [t.aiAssistant.q1, t.aiAssistant.q2, t.aiAssistant.q3, t.aiAssistant.q4, t.aiAssistant.q5]

  useEffect(() => {
    // Show welcome message on first load
    if (messages.length === 0) {
      setMessages([
        {
          role: 'assistant',
          content: t.aiAssistant.welcomeMessage.replace('{country}', countryDisplayName),
          timestamp: new Date().toISOString()
        }
      ])
    }
  }, [])

  useEffect(() => {
    // Auto-scroll to bottom when new messages arrive
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages])

  const handleSend = async () => {
    if (!input.trim() || isLoading) return

    const userMessage: Message = {
      role: 'user',
      content: input,
      timestamp: new Date().toISOString()
    }

    setMessages(prev => [...prev, userMessage])
    setInput('')
    setIsLoading(true)

    try {
      const response = await fetch('/ai-assistant/chat', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector<HTMLMetaElement>('meta[name="csrf-token"]')?.content || '',
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        },
        body: JSON.stringify({
          message: input,
          history: messages.slice(-10) // Send last 10 messages for context
        })
      })

      const data = await response.json()

      const assistantMessage: Message = {
        role: 'assistant',
        content: data.response,
        timestamp: data.timestamp
      }

      setMessages(prev => [...prev, assistantMessage])
    } catch (error) {
      console.error('Error sending message:', error)
      const errorMessage: Message = {
        role: 'assistant',
        content: 'Sorry, I encountered an error. Please try again.',
        timestamp: new Date().toISOString()
      }
      setMessages(prev => [...prev, errorMessage])
    } finally {
      setIsLoading(false)
      textareaRef.current?.focus()
    }
  }

  const handleQuickQuestion = (question: string) => {
    setInput(question)
    textareaRef.current?.focus()
  }

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault()
      handleSend()
    }
  }

  const handleImageUpload = () => {
    // For Level 1, show placeholder feedback
    alert(t.aiAssistant.imageUploadPlaceholder)
  }

  return (
    <div className="flex flex-1 flex-col h-[calc(100vh-8rem)]">
      <div className="@container/main flex flex-1 flex-col min-h-0">
        {/* Header */}
        <div className="shrink-0 px-4 py-4 lg:px-6 border-b">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-bold tracking-tight">{t.aiAssistant.title}</h1>
              <p className="text-sm text-muted-foreground mt-1">
                {t.aiAssistant.subtitle} {countryDisplayName}
              </p>
            </div>
            <Badge variant="secondary" className="gap-1.5">
              <Sparkles className="size-3" />
              {t.aiAssistant.aiPowered}
            </Badge>
          </div>
        </div>

        {/* Messages */}
        <div className="flex-1 overflow-y-auto px-4 py-6 lg:px-6">
          <div className="mx-auto max-w-3xl space-y-6">
            {messages.map((message, index) => (
              <div
                key={index}
                className={`flex gap-3 ${message.role === 'user' ? 'flex-row-reverse' : 'flex-row'}`}
              >
                <div className={`flex size-8 shrink-0 items-center justify-center rounded-lg ${
                  message.role === 'assistant'
                    ? 'bg-blue-500 text-white'
                    : 'bg-muted'
                }`}>
                  {message.role === 'assistant' ? (
                    <Sparkles className="size-4" />
                  ) : (
                    <User className="size-4" />
                  )}
                </div>
                <div className={`flex-1 ${message.role === 'user' ? 'text-right' : 'text-left'}`}>
                  <Card className={message.role === 'user' ? 'bg-primary text-primary-foreground' : ''}>
                    <CardContent className="p-4">
                      <p className="whitespace-pre-wrap leading-relaxed">{message.content}</p>
                      {message.image_url && (
                        <img
                          src={message.image_url}
                          alt="Uploaded"
                          className="mt-3 max-w-sm rounded-lg border"
                        />
                      )}
                    </CardContent>
                  </Card>
                  <p className="mt-1 px-1 text-xs text-muted-foreground">
                    {new Date(message.timestamp).toLocaleTimeString()}
                  </p>
                </div>
              </div>
            ))}

            {isLoading && (
              <div className="flex gap-3">
                <div className="flex size-8 shrink-0 items-center justify-center rounded-lg bg-blue-500 text-white">
                  <Sparkles className="size-4" />
                </div>
                <Card>
                  <CardContent className="p-4">
                    <div className="flex items-center gap-2 text-muted-foreground">
                      <Loader2 className="size-4 animate-spin" />
                      <span>{t.aiAssistant.thinking}</span>
                    </div>
                  </CardContent>
                </Card>
              </div>
            )}

            <div ref={messagesEndRef} />
          </div>
        </div>

        {/* Quick Questions (show when no messages yet) */}
        {messages.length <= 1 && (
          <div className="shrink-0 px-4 py-4 lg:px-6 border-t">
            <div className="mx-auto max-w-3xl">
              <p className="mb-3 text-sm font-medium text-muted-foreground">{t.aiAssistant.quickQuestions}</p>
              <div className="flex flex-wrap gap-2">
                {quickQuestions.map((question, index) => (
                  <Button
                    key={index}
                    variant="outline"
                    size="sm"
                    onClick={() => handleQuickQuestion(question)}
                  >
                    {question}
                  </Button>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* Input */}
        <div className="shrink-0 border-t bg-background px-4 py-4 lg:px-6">
          <div className="mx-auto max-w-3xl">
            <div className="flex gap-2">
              <Button
                variant="outline"
                size="icon"
                onClick={handleImageUpload}
                title="Upload image (coming soon)"
              >
                <ImageIcon className="size-4" />
              </Button>
              <div className="relative flex-1">
                <Textarea
                  ref={textareaRef}
                  value={input}
                  onChange={(e) => setInput(e.target.value)}
                  onKeyDown={handleKeyPress}
                  placeholder={t.aiAssistant.placeholder}
                  className="min-h-[60px] max-h-[200px] resize-none pr-12"
                  disabled={isLoading}
                />
                <Button
                  size="icon"
                  className="absolute bottom-2 right-2"
                  onClick={handleSend}
                  disabled={!input.trim() || isLoading}
                >
                  {isLoading ? (
                    <Loader2 className="size-4 animate-spin" />
                  ) : (
                    <Send className="size-4" />
                  )}
                </Button>
              </div>
            </div>
            <p className="mt-2 text-xs text-muted-foreground text-center">
              {t.aiAssistant.pressEnter}
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}
