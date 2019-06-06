require 'rails_helper'

describe 'RailsModelConcern' do
  let(:klass) { RailsModelConcern }
  describe :valid! do
    let(:method_name) { :valid! }
    context :invalid_argument do
      let :args do
        %w(controller controller#action controller#action-)
      end
      it :should_raise do
        args.each { |arg| expect { klass.send(method_name, arg) }.to raise_error }
      end
    end

    context :valid_argument do
      it :nothing_raise do
        expect(klass.valid!('controller#action-model')).to eq('controller#action-model')
      end
    end
  end
end
