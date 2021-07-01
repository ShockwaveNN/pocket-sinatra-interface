# frozen_string_literal: true

require 'spec_helper'

describe 'My Sinatra Application' do
  it 'allows accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end
end
