# Inertia.js Concepts & Best Practices

## Key Concepts

### 1. **`usePage()` Hook**

The `usePage()` hook gives you access to the current page's data within any component.

```typescript
import { usePage } from '@inertiajs/react'

function MyComponent() {
  const { props, url, component } = usePage()

  // Access shared props (from inertia_share in Rails)
  const auth = props.auth
  const flash = props.flash

  // Current URL
  console.log(url) // "/users"

  // Current component name
  console.log(component) // "Users/Index"
}
```

**Important:** Must be used **inside** the Inertia component tree (inside `<App />`).

### 2. **`router` Object**

The router handles navigation and provides lifecycle events.

```typescript
import { router } from '@inertiajs/react'

// Navigation
router.get('/users')
router.post('/users', { name: 'John' })
router.put('/users/1', { name: 'Jane' })
router.delete('/users/1')

// Visit options
router.get('/users', {
  preserveState: true,    // Keep component state
  preserveScroll: true,   // Keep scroll position
  only: ['users'],        // Only update specific props
  replace: true,          // Replace history instead of push
})

// Events (work anywhere, don't need component tree)
router.on('start', () => console.log('Navigation started'))
router.on('success', (event) => console.log('Success', event.detail.page))
router.on('error', () => console.log('Error'))
router.on('finish', () => console.log('Finished'))
```

### 3. **Persistent Layouts**

Layouts persist across page navigations and have access to `usePage()`.

**Pattern 1: Default Layout (Recommended)**
```typescript
// In inertia.tsx resolve function
page.default.layout = (page) => <AppLayout>{page}</AppLayout>
```

**Pattern 2: Per-Page Layout**
```typescript
// In your page component
MyPage.layout = (page) => <CustomLayout>{page}</CustomLayout>
```

## Flash Messages Architecture

### ✅ Best Practice: Persistent Layout with `usePage()`

**File:** `app/frontend/layouts/app-layout.tsx`

```typescript
import { useEffect } from 'react'
import { usePage } from '@inertiajs/react'
import { toast } from 'sonner'

export function AppLayout({ children }) {
  const { props } = usePage()
  const flash = props.flash

  useEffect(() => {
    if (flash?.success) toast.success(flash.success)
    if (flash?.error) toast.error(flash.error)
  }, [flash])

  return (
    <>
      <Toaster />
      {children}
    </>
  )
}
```

**Why this is best:**
- ✅ React-like (uses hooks, not events)
- ✅ Standard Inertia pattern (official docs)
- ✅ Cleaner separation of concerns
- ✅ Layout persists, `usePage()` tracks changes
- ✅ Flash messages automatically trigger `useEffect`

### ❌ Alternative: Router Events (Not Recommended)

```typescript
// Works but less idiomatic
router.on('success', (event) => {
  const flash = event.detail.page.props.flash
  if (flash?.success) toast.success(flash.success)
})
```

**Why avoid:**
- ❌ Imperative, not declarative
- ❌ Less React-like
- ❌ Harder to test
- ❌ Doesn't leverage Inertia's built-in reactivity

## Common Patterns

### Pattern: Filter/Search with `only` Parameter

When updating data via filters (search, pagination), use `only` to prevent unnecessary prop updates:

```typescript
const handleSearch = (query: string) => {
  router.get('/users', { search: query }, {
    preserveState: true,
    preserveScroll: true,
    only: ['users', 'pagination', 'filters'], // Don't update auth, preferences, flash
  })
}
```

**Why:** Prevents re-renders that can break input focus.

### Pattern: Shared Props (Rails)

```ruby
# app/controllers/application_controller.rb
inertia_share do
  {
    auth: { user: current_user },
    preferences: current_user&.preferences,
    flash: {
      success: flash[:success],
      error: flash[:error],
    }
  }
end
```

**Access in React:**
```typescript
const { auth, preferences, flash } = usePage().props
```

### Pattern: Manual Toasts in Components

```typescript
import { showSuccess, showError } from '@/lib/toast-helpers'

const handleSubmit = async () => {
  try {
    await saveData()
    showSuccess('Saved successfully!')
  } catch (error) {
    showError('Failed to save')
  }
}
```

## Summary: When to Use Each Pattern

### ✅ Use `usePage()` Hook (in Components/Layouts):

**When:**
- Accessing page props (auth, flash, preferences, etc.)
- Displaying data from Inertia props
- Need React component state/hooks
- Building UI that depends on page data
- Working with reactive data that changes per page

**Examples:**
```typescript
// ✅ Flash messages in layout
const { props } = usePage()
const flash = props.flash
useEffect(() => {
  if (flash?.success) toast.success(flash.success)
}, [flash])

// ✅ Display user info
const { auth } = usePage().props
return <div>Welcome {auth.user.name}</div>

// ✅ Current page detection
const { url } = usePage()
const isActive = url === '/dashboard'
```

### ✅ Use `router.on()` Events (Outside Components):

**When:**
- Request middleware (modifying headers, adding auth)
- Global loading indicators (body classes, progress bars)
- Side effects outside component tree
- Performance tracking/analytics
- Global error handling
- Doesn't need component state or props

**Examples:**
```typescript
// ✅ JWT token injection (middleware-like)
router.on('before', (event) => {
  const token = localStorage.getItem('auth_token')
  if (token) {
    event.detail.visit.headers = {
      ...event.detail.visit.headers,
      'Authorization': `Bearer ${token}`,
    }
  }
})

// ✅ Global loading indicator
router.on('start', () => {
  document.body.classList.add('loading')
})

router.on('finish', () => {
  document.body.classList.remove('loading')
})

// ✅ Analytics tracking
router.on('success', (event) => {
  analytics.track('page_view', { url: event.detail.page.url })
})

// ✅ Error logging
router.on('error', (error) => {
  console.error('Navigation error:', error)
  Sentry.captureException(error)
})
```

### ✅ Use `router.get/post/etc()` (Navigation):

**When:**
- Navigating between pages
- Submitting forms
- Making Inertia requests with options

**Examples:**
```typescript
// ✅ Navigation
router.get('/users')

// ✅ Form submission
router.post('/users', formData)

// ✅ With options
router.get('/users', { search: 'john' }, {
  preserveState: true,
  only: ['users'],
})
```

## Our Codebase Architecture

### Current Implementation (All Correct ✅):

1. **Flash Messages** → `usePage()` in `AppLayout` layout
   - Uses React hooks and component state
   - Reactive to prop changes
   - Standard Inertia pattern

2. **JWT Token Injection** → `router.on('before')` event
   - Modifies request headers before sending
   - Middleware-like behavior
   - No component needed

3. **Global Loading Indicator** → `router.on('start'/'finish')` events
   - Adds/removes body class for loading state
   - Global UI concern
   - Simpler than component approach

### Why This Architecture:

**Flash Messages use `usePage()`:**
- ✅ Standard Inertia.js pattern (official docs)
- ✅ React-like and declarative
- ✅ Easy to test and maintain
- ✅ Leverages Inertia's built-in reactivity
- ✅ Layout persists across navigations

**JWT & Loading use `router.on()`:**
- ✅ Global concerns (not page-specific)
- ✅ No component state needed
- ✅ Request middleware pattern
- ✅ Works outside component tree
- ✅ Simpler and more efficient

## Decision Matrix

| Use Case | Use `usePage()` | Use `router.on()` | Use `router.get()` |
|----------|----------------|-------------------|-------------------|
| Display page data | ✅ | ❌ | ❌ |
| Flash messages | ✅ | ❌ | ❌ |
| User info display | ✅ | ❌ | ❌ |
| Auth token injection | ❌ | ✅ | ❌ |
| Loading indicators | ❌ | ✅ | ❌ |
| Analytics tracking | ❌ | ✅ | ❌ |
| Navigation | ❌ | ❌ | ✅ |
| Form submission | ❌ | ❌ | ✅ |

---

**Date:** 2025-10-20
**Architecture:** Persistent Layout with `usePage()` + Router Events for Middleware
**Status:** ✅ Codebase is consistent and follows best practices
