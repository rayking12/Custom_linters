require_relative '../lib/check_error.rb'

describe Error do
  let(:checks) { Error.new('new.rb') }

  describe '#trailing_spaces' do
    it 'should return trailing space error' do
      checks.trailing_spaces
      expect(checks.errors[0]).to eql('line:2:23: Error: Trailing whitespace detected.')
    end
  end

  describe '#check_indentation' do
    it 'should return indentation space error on line 2' do
      checks.check_indentation
      expect(checks.errors[0]).to eql('line:2 Indentation Error: Use 2 spaces for indentation.')
    end
  end
end
