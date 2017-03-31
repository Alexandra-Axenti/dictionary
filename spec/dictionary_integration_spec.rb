require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dictionary verification path', {:type => :feature}) do
  it('redirects the user to the form that adds new entries to the dictionary') do
    visit('/')
    click_link('Add New Word')
    expect(page).to have_content("Please input a word and its definition:")
  end

  it("redirects the user to display page that lists all the dictionary's entries") do
    visit('/')
    click_link('View Current Entries')
    expect(page).to have_content("All dictionary entries:")
  end

  it('processes the user input and displays a new word') do
    visit('/words/new')
    fill_in('word', :with => 'jenga code')
    fill_in('definition', :with => 'when the whole app collapses after one alters just a single block of code')
    click_button('Go')
    expect(page).to have_content("jenga code - when the whole app collapses after one alters just a single block of code")
  end
end
