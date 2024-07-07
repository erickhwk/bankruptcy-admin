class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  # GET /companies or /companies.json
  def index
    return @companies = Company.all.reverse if current_user.role == 'super_admin'
    @companies = Company.joins(:lawsuits).where(lawsuits: {tenancy: current_user.tenancy}).reverse
  end

  # GET /companies/1 or /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    current_user.role == 'super_admin' ?
      @lawsuits = Lawsuit.all :
      @lawsuits = Lawsuit.where(tenancy: current_user.tenancy)
  end

  # GET /companies/1/edit
  def edit
    current_user.role == 'super_admin' ?
    @lawsuits = Lawsuit.all :
    @lawsuits = Lawsuit.where(tenancy: current_user.tenancy)
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    @company.created_by = current_user.id

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:legal_name, :cnpj, lawsuit_ids: [])
    end
end
