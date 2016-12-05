# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should initialize bkm' do
    buyer = {
        id: 'BY789',
        name: 'John',
        surname: 'Doe',
        gsmNumber: '+905350000000',
        email: 'email@email.com',
        identityNumber: '74300864791',
        lastLoginDate: '2015-10-05 12:43:35',
        registrationDate: '2013-04-21 15:12:09',
        registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        ip: '85.34.78.112',
        city: 'Istanbul',
        country: 'Turkey',
        zipCode: '34732'
    }
    address = {
        contactName: 'Jane Doe',
        city: 'Istanbul',
        country: 'Turkey',
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        zipCode: '34732'
    }

    item1 = {
        id: 'BI101',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.3'
    }
    item2 = {
        id: 'BI102',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: Iyzipay::Model::BasketItemType::VIRTUAL,
        price: '0.5'
    }
    item3 = {
        id: 'BI103',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.2'
    }
    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        price: '1',
        basketId: 'B67832',
        paymentGroup: Iyzipay::Model::PaymentGroup::PRODUCT,
        callbackUrl: 'https://www.merchant.com/callback',
        enabledInstallments: [2, 3, 6, 9],
        buyer: buyer,
        billingAddress: address,
        shippingAddress: address,
        basketItems: [item1, item2, item3]
    }
    bkm_initialize = Iyzipay::Model::BkmInitialize.new.create(request, @options)

    begin
      $stderr.puts bkm_initialize.inspect

      bkm_initialize_dict = JSON.parse(bkm_initialize)
      unless bkm_initialize_dict['htmlContent'].nil?
        $stderr.puts Base64.decode64(bkm_initialize_dict['htmlContent']).inspect
      end
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should retrieve bkm result' do
    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        token: 'token'
    }
    bkm = Iyzipay::Model::Bkm.new.retrieve(request, @options)
    begin
      $stderr.puts bkm.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end