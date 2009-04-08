class TermosController < ApplicationController

  layout "default"

  # GET /termos
  # GET /termos.xml
  def index
    @termos = Termo.find(:all, :order => :nome)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @termos }
    end
  end

  # GET /termos/new
  # GET /termos/new.xml
  def new
    @termo = Termo.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @termo }
    end
  end

  # GET /termos/1/edit
  def edit
    @termo = Termo.find(params[:id])
  end

  # POST /termos
  # POST /termos.xml
  def create
    @termo = Termo.new(params[:termo])
    respond_to do |format|
      if @termo.save
        flash[:notice] = 'Termo cadastrado!'
        format.html { redirect_to :controller => "bingo", :action => "index" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /termos/1
  # PUT /termos/1.xml
  def update
    @termo = Termo.find(params[:id])
    respond_to do |format|
      if @termo.update_attributes(params[:termo])
        flash[:notice] = 'Termo atualizado!'
format.html { redirect_to :controller => "bingo", :action => "index" }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /termos/1
  # DELETE /termos/1.xml
  def destroy
=begin
    @termo = Termo.find(params[:id])
    @termo.destroy
    respond_to do |format|
      format.html { redirect_to(termos_url) }
      format.xml  { head :ok }
    end
=end
  end
end
