require 'rails_helper'

RSpec.describe NonRepeatingController, type: :controller do
  describe 'POST /non_repeating_char' do
    it 'returns the first non-repeating character if there is one' do
      @expected = { 'non_repeating' => 'h' }
      @test = 'hello'

      test_string
    end

    it 'returns the first if there are no repeating characters' do
      @expected = { 'non_repeating' => 'd' }
      @test = 'daniel'

      test_string
    end

    it 'returns nil if there all characters repeat' do
      @expected = { 'non_repeating' => nil }
      @test = 'tteesstt'

      test_string
    end

    it 'returns nil if string is empty' do
      @expected = { 'non_repeating' => nil }
      @test = ''

      test_string
    end
  end

  private def test_string
    post :find, params: { string: @test }
    parsed_body = JSON.parse(response.body)
    expect(parsed_body).to eq(@expected)
  end
end
