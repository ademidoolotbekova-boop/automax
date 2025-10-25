# Starter Base - Project Gotchas

> **Project-specific antipatterns and reference files. Read global ~/.claude/CLAUDE.md first.**

## Stack
Rails 8.0.2.1 + Ruby 3.3.6 | Vite + Inertia + React + TS | Tailwind v4 | shadcn Premium | ActiveInteraction | Pundit | pagy | RSpec + Vitest + Playwright

---

<critical_requirement type="testing">
## Testing (NON-NEGOTIABLE)

**Feature is NOT complete without ALL three test types:**

1. **Backend (RSpec)** - models, services, policies, request specs
   *Why: Ensures business logic, authorization, and API contracts work correctly*

2. **Frontend (Vitest)** - `.test.tsx` for EVERY page and component
   *Why: Catches UI bugs, validates form behavior, prevents regressions*

3. **E2E (Playwright)** - smoke test in `e2e/` for main user workflow
   *Why: Verifies the complete user journey works end-to-end*

**Verification:** `npm run test:all` must show 100% pass (Vitest + RSpec + Playwright)

**If ANY test type is missing or failing, feature is INCOMPLETE.**
</critical_requirement>

---

## Critical Rules

- Be consistent with the codebase and implement items as detailed as existing ones
- Study reference files before implementing similar features
- Keep the new feature's UI consistent with the existing UI: no horizontal overflows from components, tables, etc. Set gradient background in components if necessary

---

<antipattern type="service_objects">
## Service Objects (ActiveInteraction)

**Pattern violations that cause errors:**

- ❌ `Services::Auth::JwtService` → ✅ `Auth::JwtService`
  *Why: Directory structure is `app/services/auth/`, NOT `app/services/services/auth/`. Wrong namespace = constant not found error*

- ❌ `object :user` → ✅ `object :user, class: User`
  *Why: ActiveInteraction requires explicit class for object filters or validation fails*

- ❌ `date :start_date` → ✅ `string :start_date`
  *Why: HTML forms send strings. Using `date` filter causes type mismatch errors*

**Example:**
```ruby
# ✅ Correct pattern
class Auth::Login < ActiveInteraction::Base
  object :user, class: User
  string :email
  string :password
  string :start_date, default: nil  # forms send strings

  def execute
    # implementation
  end
end
```

Reference: `app/services/auth/login.rb`, `app/services/invitations/send_invitation.rb`
</antipattern>

---

<antipattern type="inertia">
## Inertia.js

**Test failures caused by incorrect patterns:**

- ❌ `inertia.props[:stats]` → ✅ `inertia.props["stats"]`
  *Why: Inertia Rails serializes to JSON, creating string keys. Symbol access returns nil, causing test failures*

- ❌ `describe "GET /admin" do` → ✅ `describe "GET /admin", inertia: true do`
  *Why: Without `inertia: true` flag, Inertia matchers (render_component, include_props) are not available*

- ❌ `auth_headers(user)` or manually building headers → ✅ `auth_headers(user, inertia: true)`
  *Why: **CRITICAL** - Helper provides JWT + X-Inertia + dynamic version from InertiaRails.configuration.version. Manual headers with hardcoded '1.0' cause 409 Conflict BEFORE authentication (Inertia checks version first)*

- Create `_props` helper methods in controllers for consistent serialization

**Example:**
```ruby
# ✅ Controller with _props pattern
def index
  render inertia: 'Admin/Users/Index', props: index_props
end

private

def index_props
  {
    users: users_data,
    stats: { total: @users.count }
  }
end

# ✅ Test with string keys and helper
RSpec.describe "Admin::Users", inertia: true do
  it "includes stats" do
    get admin_users_path, headers: auth_headers(admin_user, inertia: true)
    expect(inertia.props["stats"]["total"]).to eq(10)  # string keys
  end
end

# ❌ WRONG - hardcoded version causes 409 BEFORE authentication
get admin_users_path, headers: {
  'Authorization' => "Bearer #{token}",
  'X-Inertia' => 'true',
  'X-Inertia-Version' => '1.0'  # ← 409 Conflict, never reaches 401
}
```

Reference: `app/controllers/admin/users_controller.rb`, `spec/requests/admin/users_spec.rb:38-94`
</antipattern>

---

<antipattern type="frontend">
## Frontend

**UI violations that break user experience:**

- ❌ `window.location.href = '/foo'` → ✅ `router.visit('/foo')`
  *Why: Inertia SPA navigation. window.location causes full page reload, breaking SPA experience*

- ❌ `window.confirm()` → ✅ `<AlertDialog>`
  *Why: Browser defaults don't match shadcn design system, look unprofessional*

- ❌ `<input type="date">` → ✅ `<Calendar>`
  *Why: Native inputs have inconsistent styling across browsers*

- ❌ `<select>` → ✅ shadcn `<Select>`
  *Why: Native selects cannot be styled to match design system*

**Testing patterns:**

- ❌ `import { render } from '@testing-library/react'` (for pages) → ✅ `import { render } from '@/test/utils'`
  *Why: Pages use SidebarProvider context. Tests fail without custom render that includes provider*

- ✅ `import { render } from '@testing-library/react'` OK for simple components
  *Why: Simple components don't need provider context*

- Must mock Inertia: `vi.mock('@inertiajs/react')`
  *Why: Inertia router not available in test environment without mock*

**Example:**
```tsx
// ✅ Correct page test pattern
import { render } from '@/test/utils'  // includes SidebarProvider
import { vi } from 'vitest'

vi.mock('@inertiajs/react', () => ({
  router: { visit: vi.fn() },
  usePage: () => ({ props: mockProps })
}))

test('navigates on button click', () => {
  const { getByRole } = render(<UsersIndex {...props} />)
  fireEvent.click(getByRole('button', { name: /new user/i }))
  expect(router.visit).toHaveBeenCalledWith('/admin/users/new')
})
```

Reference: `app/frontend/pages/Admin/Users/New.tsx`, `app/frontend/components/delete-confirmation-dialog.tsx`
</antipattern>

---

<antipattern type="e2e">
## E2E (Playwright)

**Test stability issues:**

- E2E server: port 3002 (test DB with RAILS_ENV=test)
  *Why: Isolated from dev server (port 3001) so tests don't corrupt dev database*

- RSpec needs CLEAN DB (factories) | E2E needs SEED data (admin@example.com, user1-5@example.com)
  *Why: RSpec isolation requires no seed data. E2E needs real users to login*

- ❌ `db:drop db:create db:migrate` → ✅ `db:drop && db:create && db:migrate`
  *Why: Rails doesn't support chained task syntax. Single command fails silently*

- ❌ `await page.goto('/login')` → ✅ `await page.goto(/\/login/)`
  *Why: Exact string match breaks when query params present. Regex handles ?param=value*

- ❌ `await page.getByText('Successfully created')` → ✅ `await page.getByText(/successfully created/i)`
  *Why: Case-sensitive exact match brittle. Regex with /i flag more flexible*

- ❌ Hardcode user names → ✅ Use emails from seed data
  *Why: Names can change, emails are stable identifiers*

- ✅ Use `.first()` when selectors match multiple elements
  *Why: Multiple matches cause "strict mode violation" errors*

**Example:**
```typescript
// ✅ Correct E2E pattern
test('user can create task', async ({ page }) => {
  await loginAsUser(page, 'admin@example.com')  // seed email
  await page.goto(/\/tasks/)  // regex for URL
  await page.getByRole('button', { name: /new task/i }).first().click()
  await page.fill('input[name="title"]', 'Test Task')
  await page.getByRole('button', { name: /save/i }).click()
  await expect(page.getByText(/successfully created/i)).toBeVisible()  // regex toast
})
```

Reference: `e2e/smoke.spec.ts`, `e2e/fixtures/auth.ts`
</antipattern>

---

## Auth
- JWT-based (NOT cookies) - tokens in localStorage for iframe compatibility
  *Why: Iframe restrictions block cookie access, breaking auth*
- Reference: `app/controllers/sessions_controller.rb`, `app/controllers/concerns/authenticatable.rb`

---

## MCP Shadcn Premium
**Before building UI, search MCP first:** `mcp__shadcn__search_items_in_registries`
**Priority:** `@ss-blocks` > `@ss-components` > `@ss-themes` > `@shadcn`
Adapt premium components, don't build from scratch.
**CRITICAL** Always use shadcn components, no browser defaults

---

## Reference Files (Study Before Implementing)

### CRUD + Authorization
- `app/controllers/admin/users_controller.rb` - Controller with _props methods
- `app/policies/user_policy.rb` - Pundit policy
- `app/frontend/pages/Admin/Users/` - Full CRUD UI

### Services + Email
- `app/services/invitations/` - Service object patterns
- `app/controllers/invitations_controller.rb` - Public pages
- `app/mailers/user_mailer.rb` - ActionMailer

### Forms + Uploads
- `app/frontend/pages/Profile/Edit.tsx` - React Hook Form + Zod + file upload
- `app/controllers/profiles_controller.rb` - ActiveStorage

### Components
- `app/frontend/components/app-header.tsx` - Top navigation bar with breadcrumbs
- `app/frontend/components/delete-confirmation-dialog.tsx` - AlertDialog pattern
- `app/frontend/components/app-sidebar.tsx` - Sidebar layout

### Tests (with line numbers)
- `spec/requests/admin/users_spec.rb:38-94` - Pagination/search
- `spec/requests/admin/users_spec.rb:141-172,209-239` - Error handling
- `spec/requests/admin/users_spec.rb:210-221` - Flash messages
- `spec/requests/invitations_spec.rb:24-45` - Props testing
- `spec/requests/admin/console_spec.rb` - Basic Inertia spec
- `spec/support/authentication_helpers.rb` - Auth helper
- `app/frontend/pages/Admin/Users/New.test.tsx` - Form + validation
- `app/frontend/pages/Dashboard.test.tsx` - Page with data
- `app/frontend/components/ui/button.test.tsx` - Simple component
- `app/frontend/test/utils.tsx` - Custom render with providers
- `e2e/smoke.spec.ts` - All E2E patterns

---

<verification_protocol>
## Verification Protocol (Run Before Marking Complete)

**Step 1: Run full test suite**
```bash
npm run test:all
```

**Step 2: Verify output shows ALL THREE test types passing**
```
✅ Vitest: X passed, 0 failed
✅ RSpec: X examples, 0 failures
✅ Playwright: X passed
```

**Step 3: Confirm feature completeness**
- [ ] All UI pages/components exist and render without errors
- [ ] E2E smoke test covers main user workflow (create → view → edit → delete)
- [ ] NO deferred implementations (no TODO, FIXME, or "will implement later" comments)
- [ ] UI consistency: no horizontal overflows, matches existing page layouts

**If ANY step fails → Feature is INCOMPLETE**
</verification_protocol>
