require 'spec_helper'

describe ProperNameFormatter do
  before(:each) do
    @name = ProperNameFormatter.new
  end

  it 'has a version number' do
    expect(ProperNameFormatter::VERSION).not_to be nil
  end

  it 'should initialize' do
    expect(@name.title).to eq ('')
  end

  it 'should handle title' do
    @name.full_name = 'peter cooper M.D.'
    expect(@name.capitalize).to eq('Peter Cooper M.D.')
  end

  it 'capitalize' do
    @name.full_name = 'peter cooper'
    expect(@name.capitalize).to eq('Peter Cooper')
  end

  it 'should handle middle initial' do
    @name.full_name = 'peter a cooper'
    expect(@name.capitalize).to eq('Peter A Cooper')
  end

  it 'should handle middle initial' do
    @name.full_name = 'peter a b cooper'
    expect(@name.capitalize).to eq('Peter A B Cooper')
  end

  it 'should handle middle initial' do
    @name.full_name = 'peter ALEX cooper'
    expect(@name.capitalize).to eq('Peter Alex Cooper')
  end
  it 'should handle title' do
    @name.full_name = 'peter cooper, MD'
    expect(@name.capitalize).to eq('Peter Cooper, M.D.')
  end
  it 'should handle title' do
    @name.full_name = 'peter cooper, DDS'
    expect(@name.capitalize).to eq('Peter Cooper, DDS')
  end
  it 'should handle title' do
    @name.full_name = 'peter cooper, M.D.'
    expect(@name.capitalize).to eq('Peter Cooper, M.D.')
  end

  it 'should handle middle initial' do
    @name.first_name = 'TIMOTHY A'
    @name.last_name = 'RICE'
    expect(@name.capitalize).to eq('Timothy A Rice')
  end
  it 'should handle clinic name' do
    @name.last_name = 'Daly City Hlth Svcs'
    @name.first_name = ''
    @name.title = ''
    expect(@name.capitalize).to eq('Daly City Hlth Svcs')
  end
  it 'should handle clinic name' do
    @name.last_name = ''
    @name.first_name = 'Daly City Hlth Svcs'
    @name.title = ''
    expect(@name.capitalize).to eq('Daly City Hlth Svcs')
  end
  it 'should handle just last name' do
    @name.last_name = 'LEUNG'
    expect(@name.capitalize).to eq('Leung')
  end
end
