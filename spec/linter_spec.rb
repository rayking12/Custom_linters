require_relative '../lib/check_error.rb'

describe Error do
  let(:checks) { Error.new('new.rb') }

  describe '#trailing_spaces' do
    it 'should return trailing space error' do
      checks.trailing_spaces
      expect(checks.errors[0]).to eql('line:3:32: Error: Trailing whitespace detected.')
    end
  end

  describe '#trailing_spaces' do
    it 'should not return trailing space error' do
      checks.trailing_spaces
      expect(checks.errors[0]).to_not eql('line:2:32: Error: Trailing whitespace detected.')
    end
  end

  describe '#check_indentation' do
    it 'should return indentation space error on line 3' do
      checks.check_indentation
      expect(checks.errors[0]).to eql('line:3 Indentation Error: Use 2 spaces for indentation.')
    end
  end
  describe '#end_error' do
    it 'returns missing/unexpected end' do
      checks.end_error
      expect(checks.errors[0]).to eql("Missing 'end'")
    end
  end

  describe '#empty_line_error' do
    it 'returns empty line error' do
      checks.empty_line_error
      expect(checks.errors[0]).to eql('line:5 Extra empty line detected at block body end')
    end
  end
end
