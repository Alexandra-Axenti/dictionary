require('rspec')
require('definition')

describe('definition') do
  before() do
    Definition.clear()
  end

describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

 describe("#save") do
    it("adds a definition to a dictionary word") do
      test_definition = Definition.new("jenga code")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

 describe(".clear") do
    it("empties out all of the saved definitions") do
      Definition.new("heisenbug").save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of a definition") do
      test_definition = Definition.new("heisenbug")
      test_definition.save()
      expect(test_definition.id()).to(eq(0))
    end
  end

  describe(".find") do
    it("returns a definition by its id number") do
      test_definition = Definition.new("yoda conditions")
      test_definition.save()
      test_definition2 = Definition.new("unicorny")
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_word))
    end
  end
end
