# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'sandbox-wWhcq20IuWvDsLNjfbTLq84GXUKrjt40'
    @options.secret_key = 'sandbox-y8oXzpVZso1Nr5n6ER3Tegt9rWNRqytV'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should test api' do
    api_test = Iyzipay::Model::ApiTest.new.retrieve(@options)
    begin
      $stderr.puts api_test.inspect
      api_test =  JSON.parse(api_test)
      expect(api_test['status']).to eq('success')
      expect(api_test['locale']).to eq('tr')
      expect(api_test['systemTime']).not_to be_nil
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end