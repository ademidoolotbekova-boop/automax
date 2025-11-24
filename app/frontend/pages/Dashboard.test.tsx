import { describe, it, expect, vi } from 'vitest'
import { screen } from '@testing-library/react'
import { render } from '@/test/utils'
import Dashboard from './Dashboard'

// Mock Inertia router
vi.mock('@inertiajs/react', async () => {
  const actual = await vi.importActual('@inertiajs/react')
  return {
    ...actual,
    Link: ({ href, children, ...props }: any) => <a href={href} {...props}>{children}</a>,
  }
})

describe('Dashboard', () => {
  const mockProps = {
    auth: {
      user: {
        id: 1,
        name: 'John Doe',
        email: 'john@example.com',
        admin: false,
      },
    },
    selectedCountry: 'kg',
  }

  it('renders welcome message with user name', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText(/Welcome back, John Doe!/i)).toBeInTheDocument()
  })

  it('displays country flag for Kyrgyzstan', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText('🇰🇬')).toBeInTheDocument()
  })

  it('displays country name in description', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText(/Continue your driving education in Kyrgyzstan/i)).toBeInTheDocument()
  })

  it('shows learning statistics', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText('Lessons Completed')).toBeInTheDocument()
    expect(screen.getByText('Time Spent Learning')).toBeInTheDocument()
    expect(screen.getByText('Current Streak')).toBeInTheDocument()
    expect(screen.getByText('Next Milestone')).toBeInTheDocument()
  })

  it('displays lesson completion progress', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText('3 / 21')).toBeInTheDocument()
  })

  it('shows quick action buttons', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText('Continue Learning')).toBeInTheDocument()
    expect(screen.getByText('Ask AI Assistant')).toBeInTheDocument()
    expect(screen.getByText('Upload Image')).toBeInTheDocument()
  })

  it('displays recent activity section', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText('Recent Activity')).toBeInTheDocument()
  })

  it('renders correctly for Russia', () => {
    const propsWithRussia = {
      ...mockProps,
      selectedCountry: 'ru',
    }

    render(<Dashboard {...propsWithRussia} />)
    expect(screen.getByText('🇷🇺')).toBeInTheDocument()
    expect(screen.getByText(/Russia/i)).toBeInTheDocument()
  })

  it('renders correctly for USA', () => {
    const propsWithUSA = {
      ...mockProps,
      selectedCountry: 'us',
    }

    render(<Dashboard {...propsWithUSA} />)
    expect(screen.getByText('🇺🇸')).toBeInTheDocument()
    expect(screen.getByText(/USA/i)).toBeInTheDocument()
  })

  it('renders correctly for different user names', () => {
    const propsWithDifferentUser = {
      auth: {
        user: {
          id: 2,
          name: 'Jane Smith',
          email: 'jane@example.com',
          admin: true,
        },
      },
      selectedCountry: 'kg',
    }

    render(<Dashboard {...propsWithDifferentUser} />)
    expect(screen.getByText(/Welcome back, Jane Smith!/i)).toBeInTheDocument()
  })
})
