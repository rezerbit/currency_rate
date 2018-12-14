# frozen_string_literal: true

module Helpers
  def json_response
    obj = JSON.parse(response.body)
    case obj
    when Array
      obj.map(&:with_indifferent_access)
    else
      obj.with_indifferent_access
    end
  end

  def currency_rates_xml
    <<-XML
      <?xml version="1.0" encoding="windows-1251"?>
      <ValCurs Date="28.11.2018" name="Foreign Currency Market">
        <Valute ID="R01010">
          <NumCode>036</NumCode>
          <CharCode>AUD</CharCode>
          <Nominal>1</Nominal>
          <Name>Австралийский доллар</Name>
          <Value>48,2953</Value>
        </Valute>

        <Valute ID="R01235">
          <NumCode>840</NumCode>
          <CharCode>USD</CharCode>
          <Nominal>1</Nominal>
          <Name>Доллар США</Name>
          <Value>66,7800</Value>
        </Valute>

        <Valute ID="R01239">
          <NumCode>978</NumCode>
          <CharCode>EUR</CharCode>
          <Nominal>1</Nominal>
          <Name>Евро</Name>
          <Value>75,6217</Value>
        </Valute>
      </ValCurs>
    XML
  end
end
