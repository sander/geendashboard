class DocsController < ApplicationController
  def index
    @docs = Doc.all
  end

  def show
    @doc = Doc.find params[:id]
  end

  def edit
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new doc_params
    @doc.user = current_user

    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end
  end

  private
  def doc_params
    params.require(:doc).permit :title, :body
  end
end
