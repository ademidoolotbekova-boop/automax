# Search Input Focus Fix

## Problem
Input fields were losing focus while typing in search/filter forms, making it impossible to type more than one character at a time.

## Root Cause
**InertiaThemeSync component wrapper** was using `usePage()` hook, which subscribes to ALL page prop changes. This caused the entire component tree to re-render on every Inertia request, including search requests, breaking input focus.

## Solution
Two-part fix (one CRITICAL, one REQUIRED):

### 1. Removed InertiaThemeSync Wrapper (CRITICAL - The Real Culprit)
- **Before:** Every page was wrapped with `<InertiaThemeSync>` in `resolve()` function
- **After:** Pages rendered directly without wrapper
- **Impact:** Eliminated the re-renders that were breaking focus
- **Alternative:** Theme/preferences now initialized once in setup() function

### 2. Use 'only' Parameter in Filter Requests (REQUIRED)
- **Location:** All router.get() calls in filter handlers (search, pagination, sorting)
- **Example:**
  ```typescript
  router.get('/admin/users', params, {
    preserveState: true,
    preserveScroll: true,
    only: ['users', 'pagination', 'filters'], // Exclude shared props
  })
  ```
- **Why:** Even with InertiaThemeSync removed, updating shared props during typing can cause re-renders
- **Impact:** Ensures `auth`, `preferences`, `flash` don't update during filter operations

### Additional Changes (OPTIONAL - For Consistency)
- **Removed React.StrictMode** - Not necessary (only affects development), but removed to match temp-starter-base
- **Using eager loading** - Could switch to lazy loading if code splitting is preferred

## Implementation Details

### Key Files Modified:
1. `app/frontend/entrypoints/inertia.tsx`
   - Removed InertiaThemeSync wrapper from resolve()
   - Added theme initialization to setup()
   - Added comprehensive documentation

2. `app/frontend/pages/Admin/Users/Index.tsx`
   - Added `only` parameter to all filter handlers
   - Added documentation explaining the pattern

3. `app/frontend/components/inertia-theme-sync.tsx`
   - Added warning comment explaining why NOT to use it

4. `app/frontend/vite-env.d.ts` (NEW)
   - Added Vite types for TypeScript

### Backend (Unchanged - Working as Expected):
- `app/controllers/application_controller.rb` - Shares auth/preferences/flash globally
- `app/controllers/admin/users_controller.rb` - Uses Ransack for search
- `app/models/user.rb` - Defines ransackable_attributes for security

## Best Practices Followed

✅ **Simple debounced search** - setTimeout in useEffect (300ms)
✅ **Ransack for backend search** - Secure, whitelisted attributes only
✅ **Minimal component tree** - No unnecessary wrappers
✅ **Explicit prop updates** - Using `only` parameter where needed
✅ **Clear documentation** - Comments explain WHY decisions were made
✅ **TypeScript safety** - Proper type definitions

## Pattern for Future Pages with Filters

When implementing search/filter functionality:

```typescript
// 1. Debounced search state
const [searchTerm, setSearchTerm] = useState(filters.search || '')

// 2. Debounce with useEffect
useEffect(() => {
  const timer = setTimeout(() => {
    const currentFilter = filters.search || ''
    if (searchTerm !== currentFilter) {
      handleSearch(searchTerm)
    }
  }, 300)
  return () => clearTimeout(timer)
}, [searchTerm])

// 3. Use 'only' parameter to exclude shared props
const handleSearch = (search: string) => {
  router.get('/route', { search }, {
    preserveState: true,
    preserveScroll: true,
    only: ['data', 'pagination', 'filters'], // ← KEY!
  })
}
```

## DO NOT

❌ **Wrap pages with components that use `usePage()` hook** - This was THE culprit causing focus loss
❌ **Forget the `only` parameter in filter requests** - Prevents unnecessary prop updates during typing
❌ **Use browser dialogs** (`confirm()`, `alert()`, `prompt()`) - Use styled components instead

## OPTIONAL (Not Required, But We Chose To)

⚠️ **No React.StrictMode** - Only causes double-renders in development (production is fine), but we removed it for consistency with temp-starter-base
⚠️ **Eager loading** - Using `{ eager: true }` loads all pages at once; could use lazy loading instead for code splitting

## Additional Improvements

### Delete Confirmation Dialog
Replaced browser `confirm()` with a styled AlertDialog component from Shadcn Studio.

**Component:** `app/frontend/components/delete-confirmation-dialog.tsx`

**Usage:**
```typescript
const [deleteDialogOpen, setDeleteDialogOpen] = useState(false)
const [itemToDelete, setItemToDelete] = useState<Item | null>(null)

const handleDeleteClick = (item: Item) => {
  setItemToDelete(item)
  setDeleteDialogOpen(true)
}

const handleDeleteConfirm = () => {
  if (itemToDelete) {
    router.delete(`/items/${itemToDelete.id}`)
    setItemToDelete(null)
  }
}

// In JSX:
<DeleteConfirmationDialog
  open={deleteDialogOpen}
  onOpenChange={setDeleteDialogOpen}
  onConfirm={handleDeleteConfirm}
  title="Delete Item"
  description={`Are you sure you want to delete ${itemToDelete?.name}?`}
/>
```

## Testing Checklist

- [x] Search input maintains focus while typing
- [x] Debouncing works (waits 300ms before searching)
- [x] Role filter works without losing search
- [x] Pagination works
- [x] Sorting works
- [x] Can navigate between pages
- [x] Theme persists across navigation
- [x] No TypeScript errors
- [x] No infinite loops
- [x] No console errors
- [x] Delete confirmation uses styled dialog (no browser confirm)

---

**Date Fixed:** 2025-10-20
**Claude Instance:** This fix should be immediately understandable to future Claude instances
