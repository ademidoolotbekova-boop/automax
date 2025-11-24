import * as React from "react"
import {
  LayoutDashboardIcon,
  Car,
  MessageSquare,
  BookOpen,
  TrendingUp,
  ClipboardList,
} from "lucide-react"
import { Link } from "@inertiajs/react"

import { NavMain } from "@/components/nav-main"
import {
  Sidebar,
  SidebarContent,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from "@/components/ui/sidebar"

interface User {
  id: number
  name: string
  email: string
  admin: boolean
}

interface AppSidebarProps extends React.ComponentProps<typeof Sidebar> {
  user: User
}

export function AppSidebar({ user, ...props }: AppSidebarProps) {
  const navMain: Array<{
    title: string
    url: string
    icon: typeof LayoutDashboardIcon
    activePattern?: string
  }> = [
    {
      title: "Dashboard",
      url: "/dashboard",
      icon: LayoutDashboardIcon,
    },
    {
      title: "AI Assistant",
      url: "/ai-assistant",
      icon: MessageSquare,
    },
    {
      title: "Browse Lessons",
      url: "/lessons",
      icon: BookOpen,
    },
    {
      title: "Practice Tests",
      url: "/practice-tests",
      icon: ClipboardList,
    },
    {
      title: "My Progress",
      url: "/progress",
      icon: TrendingUp,
    },
  ]

  return (
    <Sidebar collapsible="icon" {...props}>
      <SidebarHeader>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton size="lg" asChild className="hover:bg-transparent active:bg-transparent data-[active=true]:bg-transparent">
              <Link href="/dashboard">
                <div className="flex aspect-square size-8 items-center justify-center rounded-lg bg-gradient-to-br from-blue-500 to-blue-600">
                  <Car className="size-4 text-white" />
                </div>
                <div className="grid flex-1 text-left text-sm leading-tight">
                  <span className="truncate font-semibold">AutoMax AI</span>
                </div>
              </Link>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarHeader>
      <SidebarContent>
        <NavMain items={navMain} />
      </SidebarContent>
    </Sidebar>
  )
}
