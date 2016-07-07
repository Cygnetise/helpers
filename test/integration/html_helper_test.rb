require 'test_helper'

describe 'Html helper' do
  before do
    @book   = Book.new('The Work of Art in the Age of Mechanical Reproduction')
    @actual = Books::Show.render(format: :html, book: @book)
  end

  it 'renders the generated html' do
    @actual.must_match("<div>\n<h1>The Work of Art in the Age of Mechanical Reproduction</h1>\n</div>")
  end

  it 'raises an error when referencing an unknown local variable' do
    lambda do
      Books::Error.render(format: :html, book: @book)
    end.must_raise NoMethodError
  end
end
