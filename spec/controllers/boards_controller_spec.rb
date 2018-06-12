require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  let ( :valid_attributes) {
    {name: 'Swimming'}
  }

  let (:invalid_attributes) {
    {name: ''}
  }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns SHOW success" do
        get :show, params: {id: Board.ids }   ##########
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns edit success" do
        board = Board.create! valid_attributes
        get :edit, params: { id: board.id}
        expect(response).to be_successful
      end
    end
    
    describe "POST #create" do
    context "with valid params" do
      it "create a new board" do
        expect {
          post :create, params: {board: valid_attributes }
        }.to change(Board, :count).by(1)
      end
    end
  end

  it "redirects to the created board" do
    post :create, params: { board: valid_attributes }
    expect(response).to redirect_to(Board)
  end


  context "with invalid params" do
    it "does not create a new BOARD" do
      expect {
        post :create, params: { board: invalid_attributes }
      }.to change(Board, :count).by(0)
    end
  end


  it "returns a success (display new template)" do
    post :create, params: { board: invalid_attributes }
    expect(response).to be_successful
  end


  describe "PUT #update" do
  let(:new_attributes) {
    {  name: 'Baking' }
  }


  context "with valid params" do
    it "UPDATE the requested BOARD" do
      board = Board.create! valid_attributes
      put :update, params: { id: board.id, board: new_attributes }
      board.reload
      expect(board.name).to eq(new_attributes[:name])
    end
  end



    it "redirects to the Board#index" do
      board = Board.create! valid_attributes
      put :update, params: { id: board.id, board: new_attributes }
      expect(response).to redirect_to(board)
      end
    end
  


  context "with invalid params" do
    it 'does not update the BOARD' do
      board = Board.create! valid_attributes
      put :update, params: { id: board.id, board: invalid_attributes }

      board.reload
      expect(board.name).to_not eq(invalid_attributes[:name])
    end
  end
#============
    
      it 'returns a success (edit template)' do
        board = Board.create! valid_attributes
        put :update, params: { id: board.id, board: invalid_attributes }
        expect(response).to be_successful
      end
    
  

  # describe "DELETE #destroy" do
  #   it "destroys the requested bank account" do
  #     bank_account = @user.bank_accounts.create! valid_attributes
  #     expect {
  #       delete :destroy, params: { id: bank_account.id }
  #     }.to change(BankAccount, :count).by(-1)
  #   end

  #   it "redirects to the bank accounts list" do
  #     bank_account = @user.bank_accounts.create! valid_attributes
  #     delete :destroy, params: { id: bank_account.id }
  #     expect(response).to redirect_to(bank_accounts_url)
  #   end
  # end
end
