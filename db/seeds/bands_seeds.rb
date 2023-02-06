# frozen_string_literal: true

class BandsSeeds
  BANDS = [
    { title: 'TOTO', foundation_year: 1977 },
    { title: 'Queen', foundation_year: 1970 },
    { title: 'Led Zeppelin', foundation_year: 1968 },
    { title: 'Genesis', foundation_year: 1967 },
    { title: 'The Beatles', foundation_year: 1960 },
    { title: 'The Who', foundation_year: 1964 },
    { title: 'Pink Floyd', foundation_year: 1965 },
    { title: 'AC/DC', foundation_year: 1973 },
    { title: "Guns N' Roses", foundation_year: 1985 },
    { title: 'Black Sabbath', foundation_year: 1968 },
    { title: 'Deep Purple', foundation_year: 1968 },
    { title: 'The Police', foundation_year: 1992 },
    { title: 'Rammstein', foundation_year: 1994 }
  ].freeze

  def perform
    BANDS.each do |band|
      created_band = Band.create!(title: band[:title], foundation_year: band[:foundation_year])
      rand(5..10).times do
        created_band.ratings.create!(owner_number: Faker::PhoneNumber.cell_phone_in_e164, score: rand(3..5))
      end

    end
  end
end
