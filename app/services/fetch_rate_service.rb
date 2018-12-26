# frozen_string_literal: true

require 'net/http'

# Fetches a currency rate, saves and broadcasts to a websocket.
class FetchRateService
  # ATTENTION: http://www.cbr.ru/scripts/XML_daily.asp not work on production.
  # Use mirror.
  RATES_SOURCE_URL = 'https://www.cbr-xml-daily.ru/daily.xml'
  CURRENCY_CODE = 'USD'

  def self.call
    new.call
  end

  def initialize
    @xml = Net::HTTP.get(URI(RATES_SOURCE_URL))
  end

  def call
    parse
    build_rate
    return if rate_equal_last_rate?

    @rate.save!
  end

  private

  # Returns currency attributes.
  #
  # Examples
  #
  #   PullRateervice.new.send(:parse)
  #   # => {
  #          "ID" => "R01235",
  #          "NumCode" => "840",
  #          "CharCode" => "USD",
  #          "Nominal" => "1",
  #          "Name" => "Доллар США",
  #          "Value" => "66,2550"
  #        }
  #
  # Returns a Hash of attributes.
  def parse
    @attributes = Hash.from_xml(@xml).dig('ValCurs', 'Valute').find { |item| item['CharCode'] == CURRENCY_CODE }
  end

  def build_rate
    @rate = FetchedRate.new(value: value * nominal, overridden: overridden?)
  end

  def value
    @attributes['Value'].tr!(',', '.').to_f
  end

  def nominal
    @attributes['Nominal'].to_i
  end

  def overridden?
    last_forced_rate = ForcedRate.last
    return false if last_forced_rate.nil?

    last_forced_rate.expires_at > Time.current
  end

  def rate_equal_last_rate?
    @rate.value == FetchedRate.last&.value
  end
end
