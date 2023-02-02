# frozen_string_literal: true

Dir[File.join(__dir__, 'seeds', '*.rb')].each { |file| require file }

BandsSeeds.new.perform