require 'spec_helper'

describe 'ApplicationHelper' do
  it 'cleanup_links_list should remove nil links' do
    links = ['www.ya.ru', nil]
    expect(cleanup_links_list(links)).to eq(['www.ya.ru'])
  end
end
