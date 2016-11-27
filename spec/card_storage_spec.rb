# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should create user and add card' do
    card_information = {
        cardAlias: 'card alias',          
        cardHolderName: 'John Doe',
        cardNumber: '5528790000000008',
        expireYear: '2030',
        expireMonth: '12'
    }
    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        email: 'email@email.com',
        externalId: 'external id',
        card: card_information
    }
    card = Iyzipay::Model::Card.new.create(request, @options)
    begin
      $stderr.puts card.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end
  
  it 'should create card' do
      card_information = {
          cardAlias: 'card alias',          
          cardHolderName: 'John Doe',
          cardNumber: '5528790000000008',
          expireYear: '2030',
          expireMonth: '12'
      }
      request = {
          locale: Iyzipay::Model::Locale::TR,
          conversationId: '123456789',
          email: 'email@email.com',
          cardUserKey: 'card user key',
          card: card_information
      }
      card = Iyzipay::Model::Card.new.create(request, @options)
      begin
        $stderr.puts card.inspect
      rescue
        $stderr.puts 'oops'
        raise
      end
    end
    
    it 'should delete card' do
      request = {
          locale: Iyzipay::Model::Locale::TR,
          conversationId: '123456789',
          cardToken: 'card token',
          cardUserKey: 'card user key'
      }
      card = Iyzipay::Model::Card.new.delete(request, @options)
      begin
        $stderr.puts card.inspect
      rescue
        $stderr.puts 'oops'
        raise
      end
    end
    
    it 'should retrieve card' do
      request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        cardUserKey: 'card user key'
      }
      cardList = Iyzipay::Model::CardList.new.retrieve(request, @options)
      begin
        $stderr.puts cardList.inspect
      rescue
        $stderr.puts 'oops'
        raise
      end
    end 
    
  after :each do
  end
end