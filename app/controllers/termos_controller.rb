class TermosController < ApplicationController

  layout "default"

  # GET /termos
  # GET /termos.xml
  def index
    @termos = Termo.all

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
        flash[:notice] = 'Termo was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @termo, :status => :created, :location => @termo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @termo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /termos/1
  # PUT /termos/1.xml
  def update
    @termo = Termo.find(params[:id])

    respond_to do |format|
      if @termo.update_attributes(params[:termo])
        flash[:notice] = 'Termo was successfully updated.'
        format.html { redirect_to(@termo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @termo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /termos/1
  # DELETE /termos/1.xml
  def destroy
    @termo = Termo.find(params[:id])
    @termo.destroy

    respond_to do |format|
      format.html { redirect_to(termos_url) }
      format.xml  { head :ok }
    end
  end
end
