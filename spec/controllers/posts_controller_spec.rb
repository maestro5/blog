require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe "GET #index" do
    it "render :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  decribe "GET #show " do
    it "renders the :show view" do
      get :show, id: 1
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns the requested post to new post" do
      expect(assigns(:post)).to be_new_record
    end
    
    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new object" do
        expect{
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(1)
      end

      it "redirects to index path" do
        post :creaate, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to posts_path
      end
  end

  describe "GET #edit" do
    it "renders the :edit view" do
      get :edit, id: 1
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates object" do
        expect{
          path :update, id: 1, post: { title: 'new_post' }
        }.to change { .reload.name }.to('new_post')
      end

      it "redirects to index path" do
        path :update, id: 1, post: { title: 'new_post' }
        expect(response).to redirect_to posts_path
      end
  end

  describe "DELETE #destroy" do
    before(:each) { @post = FactoryGirl.create :post }

    it "deletes the post" do
      expect {
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it "redirects to posts#index" do
      delete :destroy, id: @post
      expect(response).to redirect_to posts_path
    end
  end

end #RSpec