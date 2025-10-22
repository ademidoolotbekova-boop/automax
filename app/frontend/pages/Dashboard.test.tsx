import { describe, it, expect } from 'vitest'
import { screen } from '@testing-library/react'
import { render } from '@/test/utils'
import Dashboard from './Dashboard'

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
  }

  it('renders welcome message with user name', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText('Welcome')).toBeInTheDocument()
    expect(screen.getByText('John Doe')).toBeInTheDocument()
  })

  it('displays user email', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText(/Email: john@example.com/i)).toBeInTheDocument()
  })

  it('shows admin badge when user is admin', () => {
    const adminProps = {
      auth: {
        user: {
          ...mockProps.auth.user,
          admin: true,
        },
      },
    }

    render(<Dashboard {...adminProps} />)
    expect(screen.getByText('Admin')).toBeInTheDocument()
  })

  it('does not show admin badge when user is not admin', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.queryByText('Admin')).not.toBeInTheDocument()
  })

  it('renders breadcrumb navigation', () => {
    render(<Dashboard {...mockProps} />)
    expect(screen.getByText('Dashboard')).toBeInTheDocument()
  })
})
