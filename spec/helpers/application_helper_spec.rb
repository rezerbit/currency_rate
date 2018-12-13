# frozen_string_literal: true

RSpec.describe ApplicationHelper, type: :helper do
  describe '#component' do
    before { allow(helper).to receive(:render) }

    it 'render a component' do
      expect(helper).to receive(:render).with('components/page/page', {})
      helper.component('page')
    end

    context 'when the path with a namespace' do
      it 'render a component' do
        expect(helper).to receive(:render).with('components/admin/admin_page', {})
        helper.component('admin_page')
      end
    end
  end

  describe '#с' do
    before { allow(helper).to receive(:render) }

    it 'render a component' do
      expect(helper).to receive(:render).with('components/page/page', {})
      helper.c('page')
    end
  end
end
