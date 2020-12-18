require_relative '../lib/check_error.rb'

describe Error do
  let(:checks) { Error.new('new.rb') }

  describe '#trailing_spaces' do
    context 'when trailing spaces are found'
    it 'should return trailing space error' do
      checks.trailing_spaces
      expect(checks.errors[0]).to eql('line:3:22: Error: Trailing whitespace detected.')
    end

    context 'when trailing spaces are not found'
    it 'should not return trailing space error' do
      checks.trailing_spaces
      expect(checks.errors[0]).to_not eql('line:2:32: Error: Trailing whitespace detected.')
    end
  end

  describe '#check_indentation' do
    context 'when indentaton space is not correctly spaced'
    it 'should return indentation space error on line 3' do
      checks.check_indentation
      expect(checks.errors[0]).to eql('line:10 Indentation Error: Use 2 spaces for indentation.')
    end

    context 'when indentaton space is correctly spaced'
    it 'should not return indentation space error on line 3' do
      checks.check_indentation
      expect(checks.errors[0]).to_not eql('line:2 Indentation Error: Use 2 spaces for indentation.')
    end
  end

  describe '#end_error' do
    context "when there's an unexpected end"
    it 'returns missing/unexpected end' do
      checks.end_error
      expect(checks.errors[0]).to eql("Missing 'end'")
    end

    context "when there's an expected end"
    it ' Does not returns missing/unexpected end' do
      checks.end_error
      expect(checks.errors[4]).to_not eql("Missing 'end'")
    end
  end

  describe '#empty_line_error' do
    context "when there's an empty line"
    it 'returns empty line error' do
      checks.empty_line_error
      expect(checks.errors[0]).to eql('line:5 Extra empty line detected at block body end')
    end

    context "when there's no empty line"
    it ' does not returns empty line error' do
      checks.empty_line_error
      expect(checks.errors[0]).to_not eql('line:4 Extra empty line detected at block body end')
    end
  end
end
