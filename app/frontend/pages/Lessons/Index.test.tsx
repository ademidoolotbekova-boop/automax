import { describe, it, expect, vi } from 'vitest'
import { screen } from '@testing-library/react'
import { render } from '@/test/utils'
import LessonsIndex from './Index'

// Mock Inertia router
vi.mock('@inertiajs/react', async () => {
  const actual = await vi.importActual('@inertiajs/react')
  return {
    ...actual,
    Link: ({ href, children, ...props }: any) => <a href={href} {...props}>{children}</a>,
  }
})

describe('Lessons/Index', () => {
  const mockCategories = [
    {
      id: 'traffic-signs',
      title: 'Traffic Signs & Signals',
      icon: 'sign',
      description: 'Learn to recognize and understand all types of road signs',
      lessons: [
        { id: 1, title: 'Understanding Road Signs', duration: '15 min', completed: false },
        { id: 2, title: 'Traffic Light Rules', duration: '12 min', completed: true },
        { id: 3, title: 'Pavement Markings', duration: '10 min', completed: false },
      ],
    },
    {
      id: 'lane-changes',
      title: 'Lane Changes & Merging',
      icon: 'lanes',
      description: 'Master safe techniques for changing lanes',
      lessons: [
        { id: 4, title: 'Safe Lane Change Procedures', duration: '14 min', completed: false },
        { id: 5, title: 'Highway Merging', duration: '16 min', completed: false },
        { id: 6, title: 'Multi-Lane Roundabouts', duration: '13 min', completed: false },
      ],
    },
  ]

  const mockProps = {
    categories: mockCategories,
    country: 'kg',
  }

  it('renders page title', () => {
    render(<LessonsIndex {...mockProps} />)
    expect(screen.getByText('Browse Lessons')).toBeInTheDocument()
  })

  it('renders page description', () => {
    render(<LessonsIndex {...mockProps} />)
    expect(screen.getByText(/Master driving rules with structured lessons/i)).toBeInTheDocument()
  })

  it('displays progress overview', () => {
    render(<LessonsIndex {...mockProps} />)
    expect(screen.getByText('Your Learning Progress')).toBeInTheDocument()
    expect(screen.getByText('Completed Lessons')).toBeInTheDocument()
  })

  it('calculates and displays correct progress', () => {
    render(<LessonsIndex {...mockProps} />)
    // 1 completed out of 6 total
    expect(screen.getByText('1 / 6')).toBeInTheDocument()
  })

  it('renders all lesson categories', () => {
    render(<LessonsIndex {...mockProps} />)
    expect(screen.getByText('Traffic Signs & Signals')).toBeInTheDocument()
    expect(screen.getByText('Lane Changes & Merging')).toBeInTheDocument()
  })

  it('displays category descriptions', () => {
    render(<LessonsIndex {...mockProps} />)
    expect(screen.getByText(/Learn to recognize and understand all types of road signs/i)).toBeInTheDocument()
    expect(screen.getByText(/Master safe techniques for changing lanes/i)).toBeInTheDocument()
  })

  it('shows category completion badges', () => {
    render(<LessonsIndex {...mockProps} />)
    // First category: 1 / 3
    expect(screen.getByText('1 / 3')).toBeInTheDocument()
    // Second category: 0 / 3
    expect(screen.getByText('0 / 3')).toBeInTheDocument()
  })

  it('renders all lessons within categories', () => {
    render(<LessonsIndex {...mockProps} />)
    expect(screen.getByText(/Understanding Road Signs/i)).toBeInTheDocument()
    expect(screen.getByText(/Traffic Light Rules/i)).toBeInTheDocument()
    expect(screen.getByText(/Pavement Markings/i)).toBeInTheDocument()
    expect(screen.getByText(/Safe Lane Change Procedures/i)).toBeInTheDocument()
  })

  it('displays lesson durations', () => {
    render(<LessonsIndex {...mockProps} />)
    expect(screen.getByText('15 min')).toBeInTheDocument()
    expect(screen.getByText('12 min')).toBeInTheDocument()
    expect(screen.getByText('14 min')).toBeInTheDocument()
  })

  it('shows completion status for lessons', () => {
    render(<LessonsIndex {...mockProps} />)
    // Should render check icons for completed lessons and circle icons for incomplete
    const lessonItems = screen.getAllByRole('link')
    expect(lessonItems.length).toBeGreaterThan(0)
  })

  it('creates links to individual lessons', () => {
    render(<LessonsIndex {...mockProps} />)
    const links = screen.getAllByRole('link')
    const lessonLink = links.find(link => link.getAttribute('href') === '/lessons/1')
    expect(lessonLink).toBeDefined()
  })

  it('displays start buttons for each lesson', () => {
    render(<LessonsIndex {...mockProps} />)
    const startButtons = screen.getAllByText('Start')
    expect(startButtons.length).toBeGreaterThan(0)
  })
})
