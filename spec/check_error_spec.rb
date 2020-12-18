require_relative '../lib/check_error.rb'

describe Error do
  let(:checks) { Error.new('new.rb') }

  describe '#trailing_spaces' do
    context 'when trailing spaces are found' do
      it 'should return trailing space error' do
        checks.trailing_spaces
        expect(checks.errors[0]).to eql('line:3:22: Error: Trailing whitespace detected.')
      end
    end

    context 'when trailing spaces are not found' do
      it 'should not return trailing space error' do
        checks.trailing_spaces
        expect(checks.errors[0]).to_not eql('line:2:32: Error: Trailing whitespace detected.')
      end
    end
  end

  describe '#check_indentation' do
    context 'when indentaton space is not correctly spaced' do
      it 'should return indentation space error on line 3' do
        checks.check_indentation
        expect(checks.errors[0]).to eql('line:10 Indentation Error: Use 2 spaces for indentation.')
      end
    end

    context 'when indentaton space is correctly spaced' do
      it 'should not return indentation space error on line 3' do
        checks.check_indentation
        expect(checks.errors[0]).to_not eql('line:2 Indentation Error: Use 2 spaces for indentation.')
      end
    end
  end

  describe '#end_error' do
    context "when there's an unexpected end" do
      it 'returns missing/unexpected end' do
        checks.end_error
        expect(checks.errors[0]).to eql("Missing 'end'")
      end
    end

    context "when there's an expected end" do
      it ' Does not returns missing/unexpected end' do
        checks.end_error
        expect(checks.errors[4]).to_not eql("Missing 'end'")
      end
    end
  end

  describe '#empty_line_error' do
    context "when there's an empty line" do
      it 'returns empty line error' do
        checks.empty_line_error
        expect(checks.errors[0]).to eql('line:5 Extra empty line detected at block body end')
      end
    end

    context "when there's no empty line" do
      it ' does not returns empty line error' do
        checks.empty_line_error
        expect(checks.errors[0]).to_not eql('line:4 Extra empty line detected at block body end')
      end
    end
  end
end
