require 'spec_helper'
require 'environmenter/loader'

RSpec.describe Environmenter::Loader, 'with rails' do
  before do
    skip 'Skipping rails test in no-rails example' unless Bundler.environment.dependencies.any? { |d| d.name == 'rails' }
  end

  describe '#load!' do
    context 'without config' do
      subject(:loader) { Environmenter::Loader.new }

      it 'loads Rails' do
        expect {
          loader.load!
        }.to change { defined?(Rails) }.from(nil).to('constant')
      end
    end

    context 'with config' do
      subject(:loader) { Environmenter::Loader.new(config) }

      context 'with no requirements' do
        let(:config) { double(require: []) }

        it 'does not explode' do
          loader.load!
          expect(defined?(FIRST)).to be nil
          expect(defined?(SECOND)).to be nil
        end
      end

      context 'including require method' do
        let(:config) { double(require: ['spec/fixtures/first', 'spec/fixtures/second']) }

        it 'requires all files' do
          loader.load!
          expect(FIRST).to be true
          expect(SECOND).to be true
        end
      end

      context 'that is a stringified hash' do
        let(:config) { { 'require' => ['spec/fixtures/first', 'spec/fixtures/second'] } }

        it 'requires all files' do
          loader.load!
          expect(FIRST).to be true
          expect(SECOND).to be true
        end
      end

      context 'that is a symbolic hash' do
        let(:config) { { require: ['spec/fixtures/first', 'spec/fixtures/second'] } }

        it 'requires all files' do
          loader.load!
          expect(FIRST).to be true
          expect(SECOND).to be true
        end
      end
    end
  end
end

RSpec.describe Environmenter::Loader, 'without rails' do
  subject(:loader) { Environmenter::Loader.new(config) }
  let(:config) { double }

  before do
    skip 'Skipping no-rails test in rails example' if Bundler.environment.dependencies.any? { |d| d.name == 'rails' }
  end

  describe '#load!' do
    it 'does not explode' do
      expect {
        loader.load!
      }.not_to raise_error
    end
  end
end
