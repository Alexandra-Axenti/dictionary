require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dictionary verification path', {:type => :feature}) do
  it('processes the user input and displays a new word') do
    visit('/words/new')
    fill_in('word', :with => 'jenga code')
    fill_in('definition', :with => 'when the whole app collapses after one alters just a single block of code')
    click_button('Go')
    expect(page).to have_content("jenga code - when the whole app collapses after one alters just a single block of code")
  end
end
