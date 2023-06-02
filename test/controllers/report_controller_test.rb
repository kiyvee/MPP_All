require 'rails_helper'

RSpec.describe ReportDownloadController, type: :controller do
  let(:library) { create(:library) }
  let(:user) { create(:user) }

  describe 'GET #export_general_pdf' do
    before { get :export_general_pdf }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a PDF file' do
      expect(response.content_type).to eq('application/pdf')
    end
  end

  describe 'GET #export_lib_general_csv' do
    before { get :export_lib_general_csv, format: :csv }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a CSV file' do
      expect(response.content_type).to eq('text/csv')
    end
  end

  describe 'GET #export_lib_pdf' do
    before { get :export_lib_pdf, params: { id: library.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a PDF file' do
      expect(response.content_type).to eq('application/pdf')
    end
  end

  describe 'GET #export_user_pdf' do
    before { get :export_user_pdf, params: { id: user.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a PDF file' do
      expect(response.content_type).to eq('application/pdf')
    end
  end
end