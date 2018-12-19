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

  describe '#alert_class_for' do
    subject { helper.alert_class_for(flash_type) }

    context 'when the flash type is success' do
      let(:flash_type) { 'success' }
      it { is_expected.to eq 'is-success' }
    end

    context 'when the flash type is success' do
      let(:flash_type) { 'error' }
      it { is_expected.to eq 'is-danger' }
    end

    context 'when the flash type is success' do
      let(:flash_type) { 'alert' }
      it { is_expected.to eq 'is-warning' }
    end

    context 'when the flash type is success' do
      let(:flash_type) { 'notice' }
      it { is_expected.to eq 'is-info' }
    end
  end
end
