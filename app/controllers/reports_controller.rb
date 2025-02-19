class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]
  before_action :check_if_theres_lawsuits, only: %i[new create]

  # GET /reports or /reports.json
  def index
    return @reports = Report.all.reverse  if current_user.role == 'developer'
    @reports = Report.joins(:lawsuit).where(lawsuits: { tenancy_id: current_user.tenancy_id }).reverse
  end

  # GET /reports/1 or /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    current_user.role == 'developer' ?
      @lawsuits = Lawsuit.all :
      @lawsuits = Lawsuit.where(tenancy: current_user.tenancy)
  end

  # GET /reports/1/edit
  def edit
    current_user.role == 'developer' ?
    @lawsuits = Lawsuit.all :
    @lawsuits = Lawsuit.where(tenancy: current_user.tenancy)
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)
    @report.created_by = current_user.id


    respond_to do |format|
      if @report.save
        format.html { redirect_to report_url(@report), notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    if params[:report][:files].present?
      @report.files.attach(params[:report][:files])
    end

    respond_to do |format|
      if @report.update(report_params.except(:files))
        format.html { redirect_to report_url(@report), notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy!

    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_file
    report = Report.find(params[:id])
    report.files.find(params[:file]).purge

    redirect_to report_path(report), notice: 'File was successfully removed.'
  end

  private
    def check_if_theres_lawsuits
      unless current_user.role == 'developer'
        redirect_to new_lawsuit_path, alert: 'Não existem processos para associar a um informe. Por favor, crie seu primeiro processo.' if Lawsuit.where(tenancy: current_user.tenancy).empty?
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:title, :content, :published, :lawsuit_id, files: [])
    end
end
