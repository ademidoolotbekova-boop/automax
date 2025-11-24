import * as React from 'react'
import { Check } from 'lucide-react'
import { router } from '@inertiajs/react'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

export interface Country {
  code: string
  name: string
  flag: string
}

const COUNTRIES: Country[] = [
  { code: 'kg', name: 'Kyrgyzstan', flag: '🇰🇬' },
  { code: 'ru', name: 'Russia', flag: '🇷🇺' },
  { code: 'us', name: 'USA', flag: '🇺🇸' },
]

interface CountrySelectorProps {
  selectedCountry?: string
}

export function CountrySelector({ selectedCountry = 'kg' }: CountrySelectorProps) {
  const currentCountry = COUNTRIES.find(c => c.code === selectedCountry) || COUNTRIES[0]

  const handleCountryChange = (countryCode: string) => {
    // Send request to update country preference
    router.post('/country/select', { country: countryCode }, {
      preserveState: true,
      preserveScroll: true,
    })
  }

  return (
    <Select value={selectedCountry} onValueChange={handleCountryChange}>
      <SelectTrigger className="w-[160px]">
        <SelectValue>
          <div className="flex items-center gap-2">
            <span className="text-lg">{currentCountry.flag}</span>
            <span className="text-sm">{currentCountry.name}</span>
          </div>
        </SelectValue>
      </SelectTrigger>
      <SelectContent>
        {COUNTRIES.map((country) => (
          <SelectItem key={country.code} value={country.code}>
            <div className="flex items-center gap-2">
              <span className="text-lg">{country.flag}</span>
              <span>{country.name}</span>
            </div>
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  )
}

export { COUNTRIES }
