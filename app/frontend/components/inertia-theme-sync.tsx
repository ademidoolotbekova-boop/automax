import React, { useEffect } from 'react'
import { usePage } from '@inertiajs/react'
import { useTheme } from './theme-provider'

interface PageProps extends Record<string, unknown> {
  preferences?: {
    theme?: 'light' | 'dark' | 'system'
    sidebar_variant?: 'sidebar' | 'floating' | 'inset'
  }
}

export function InertiaThemeSync({ children }: { children: React.ReactNode }) {
  const { props, url } = usePage<PageProps>()
  const { setTheme } = useTheme()
  const isSettingsPage = url === '/settings'

  useEffect(() => {
    // Only sync theme from server if NOT on settings page
    // (Settings page manages theme locally for instant preview)
    if (!isSettingsPage && props.preferences?.theme) {
      setTheme(props.preferences.theme)
    }

    // Always cache theme to localStorage for the loading screen
    if (props.preferences?.theme) {
      localStorage.setItem('ui-theme', props.preferences.theme)
    }
  }, [props.preferences?.theme, setTheme, isSettingsPage])

  // Update body background based on sidebar variant
  useEffect(() => {
    const body = document.body
    if (props.preferences?.sidebar_variant === 'inset') {
      body.setAttribute('data-sidebar-bg', 'true')
    } else {
      body.removeAttribute('data-sidebar-bg')
    }
  }, [props.preferences?.sidebar_variant])

  return <>{children}</>
}
