import * as React from 'react'
import { router } from '@inertiajs/react'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { SUPPORTED_LANGUAGES, type LanguageCode } from '@/lib/i18n'

interface LanguageSelectorProps {
  selectedLanguage?: LanguageCode
}

export function LanguageSelector({ selectedLanguage = 'en' }: LanguageSelectorProps) {
  const currentLanguage = SUPPORTED_LANGUAGES[selectedLanguage]

  const handleLanguageChange = (langCode: string) => {
    router.post('/language/select', { language: langCode })
  }

  return (
    <Select value={selectedLanguage} onValueChange={handleLanguageChange}>
      <SelectTrigger className="w-[140px]">
        <SelectValue>
          <div className="flex items-center gap-2">
            <span className="text-sm">{currentLanguage.nativeName}</span>
          </div>
        </SelectValue>
      </SelectTrigger>
      <SelectContent>
        {Object.values(SUPPORTED_LANGUAGES).map((language) => (
          <SelectItem key={language.code} value={language.code}>
            <div className="flex items-center gap-2">
              <span>{language.nativeName}</span>
            </div>
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  )
}
