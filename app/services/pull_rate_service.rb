# frozen_string_literal: true

require 'net/http'

# Pulls a currency rate, saves and broadcasts to a websocket.
class PullRateService
  RATES_SOURCE_URL = 'http://www.cbr.ru/scripts/XML_daily.asp'
  CURRENCY_CODE = 'USD'
  CHANNEL = 'rate'

  def self.call
    new.call
  end

  def initialize
    @xml = Net::HTTP.get(URI(RATES_SOURCE_URL))
    @last_rate = Rate.last
  end

  def call
    return if @last_rate&.forced?

    parse
    build_rate

    return if rate_equal_last_rate?

    save_rate
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
    @rate = Rate.new(value: value * nominal)
  end

  def value
    @attributes['Value'].tr!(',', '.').to_f
  end

  def nominal
    @attributes['Nominal'].to_i
  end

  def rate_equal_last_rate?
    @rate.value == @last_rate&.value
  end

  def save_rate
    ActiveRecord::Base.transaction do
      @rate.save!
      notify
    end
  end

  def notify
    ActionCable.server.broadcast(CHANNEL, @rate.value)
  end
end
