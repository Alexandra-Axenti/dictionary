require('rspec')
require('word')
require('definition')

describe('word') do
  before() do
    Word.clear()
  end

describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

 describe("#save") do
    it("adds a word to the dictionary") do
      test_word = Word.new("jenga code")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('#definitions') do
    it("initially returns an empty array for the word definitions") do
      test_word = Word.new("PEBKAC")
      expect(test_word.definitions()).to(eq([]))
    end
  end

 describe(".clear") do
    it("empties out all of the saved words") do
      Word.new("heisenbug").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of a word") do
      test_word = Word.new("heisenbug")
      test_word.save()
      expect(test_word.id()).to(eq(0))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("yoda conditions")
      test_word.save()
      test_word2 = Word.new("unicorny")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#add_definition') do
    it("adds a new definition for a word") do
      test_word = Word.new("jenga code")
      test_definition = Definition.new("when the whole app collapses after one alters just a single block of code")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end
