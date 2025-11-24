import { describe, it, expect, vi } from 'vitest'
import { screen } from '@testing-library/react'
import { render } from '@/test/utils'
import LessonShow from './Show'

// Mock Inertia router
vi.mock('@inertiajs/react', async () => {
  const actual = await vi.importActual('@inertiajs/react')
  return {
    ...actual,
    Link: ({ href, children, ...props }: any) => <a href={href} {...props}>{children}</a>,
    router: {
      visit: vi.fn(),
    },
  }
})

describe('Lessons/Show', () => {
  const mockProps = {
    lesson: {
      id: 1,
      title: 'Understanding Road Signs - Regulatory, Warning, and Guide Signs',
      duration: '15 min',
      completed: false,
    },
    category: {
      id: 'traffic-signs',
      title: 'Traffic Signs & Signals',
    },
    content: {
      introduction: 'This lesson covers road signs as applied in Kyrgyzstan.',
      sections: [
        {
          title: 'Overview',
          content: 'In this comprehensive lesson, we will explore key concepts.',
        },
        {
          title: 'Key Regulations in Kyrgyzstan',
          content: 'The traffic laws in Kyrgyzstan require specific procedures.',
        },
      ],
      key_points: [
        'Always check your mirrors before any maneuver',
        'Signal your intentions early',
        'Follow the specific regulations for Kyrgyzstan',
      ],
      quiz_preview: 'After completing this lesson, you will be able to test your knowledge.',
    },
    prev_lesson: null,
    next_lesson: {
      id: 2,
      title: 'Traffic Light Rules',
      duration: '12 min',
      completed: false,
    },
    country: 'kg',
  }

  it('renders lesson title', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText(/Understanding Road Signs/i)).toBeInTheDocument()
  })

  it('displays category badge', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText('Traffic Signs & Signals')).toBeInTheDocument()
  })

  it('shows lesson duration', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText('15 min')).toBeInTheDocument()
  })

  it('displays introduction text', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText(/This lesson covers road signs as applied in Kyrgyzstan/i)).toBeInTheDocument()
  })

  it('renders all content sections', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText('Overview')).toBeInTheDocument()
    expect(screen.getByText('Key Regulations in Kyrgyzstan')).toBeInTheDocument()
  })

  it('displays section content', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText(/In this comprehensive lesson, we will explore key concepts/i)).toBeInTheDocument()
    expect(screen.getByText(/The traffic laws in Kyrgyzstan require specific procedures/i)).toBeInTheDocument()
  })

  it('shows key points section', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText('Key Points to Remember')).toBeInTheDocument()
  })

  it('renders all key points', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText(/Always check your mirrors before any maneuver/i)).toBeInTheDocument()
    expect(screen.getByText(/Signal your intentions early/i)).toBeInTheDocument()
    expect(screen.getByText(/Follow the specific regulations for Kyrgyzstan/i)).toBeInTheDocument()
  })

  it('displays quiz preview text', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText(/After completing this lesson, you will be able to test your knowledge/i)).toBeInTheDocument()
  })

  it('shows Ask AI button', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText('Ask AI')).toBeInTheDocument()
  })

  it('displays Next Lesson button when available', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText('Next Lesson')).toBeInTheDocument()
  })

  it('shows Mark as Complete button for incomplete lessons', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.getByText('Mark as Complete')).toBeInTheDocument()
  })

  it('does not show Mark as Complete button for completed lessons', () => {
    const completedProps = {
      ...mockProps,
      lesson: { ...mockProps.lesson, completed: true },
    }
    render(<LessonShow {...completedProps} />)
    expect(screen.queryByText('Mark as Complete')).not.toBeInTheDocument()
  })

  it('shows Previous Lesson button when available', () => {
    const propsWithPrev = {
      ...mockProps,
      prev_lesson: { id: 0, title: 'Previous Lesson', duration: '10 min', completed: true },
    }
    render(<LessonShow {...propsWithPrev} />)
    expect(screen.getByText('Previous Lesson')).toBeInTheDocument()
  })

  it('does not show Previous Lesson button when not available', () => {
    render(<LessonShow {...mockProps} />)
    expect(screen.queryByText('Previous Lesson')).not.toBeInTheDocument()
  })

  it('creates proper links for navigation', () => {
    render(<LessonShow {...mockProps} />)
    const nextLink = screen.getByText('Next Lesson').closest('a')
    expect(nextLink).toHaveAttribute('href', '/lessons/2')
  })
})
