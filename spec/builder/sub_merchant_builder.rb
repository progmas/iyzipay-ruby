# coding: utf-8

require_relative '../spec_helper'

module Builder
  class SubMerchantBuilder

    def create_sub_merchant(options)
      random_number = Random.rand(11**11).to_s
      request = {
          locale: Iyzipay::Model::Locale::TR,
          conversationId: '123456789',
          subMerchantExternalId: 'B' + random_number,
          subMerchantType: Iyzipay::Model::SubMerchantType::PERSONAL,
          address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
          contactName: 'John',
          contactSurname: 'Doe',
          email: random_number + '@email.com',
          gsmNumber: '+905350000000',
          name: 'John\'s market',
          iban: 'TR180006200119000006672315',
          identityNumber: random_number,
          currency: Iyzipay::Model::Currency::TRY
      }
      sub_merchant = Iyzipay::Model::SubMerchant.new.create(request, options)
      JSON.parse(sub_merchant)
    end
  end
end
