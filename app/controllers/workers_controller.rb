class WorkersController < ApplicationController
  before_action :set_worker, only: %i[ show edit update destroy ]

  # CONTANTS
  TAX_RULES = {
    salary_range: [0, 2_112.00, 2_826.65, 3_751.05, 4_664.68, Float::INFINITY],
    percent_tax: [0, 7.5, 15, 22.5, 27.5]
  }.freeze

  # GET /workers or /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1 or /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers or /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to worker_url(@worker), notice: "Worker was successfully created." }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1 or /workers/1.json
  def update
    UpdateWorkersJob.perform_now @worker.id, params[:worker]

##
#    respond_to do |format|
#
#      if @worker.update(worker_params)
#        format.html { redirect_to worker_url(@worker), notice: "Worker was successfully updated." }
#        format.json { render :show, status: :ok, location: @worker }
#      else
#        format.html { render :edit, status: :unprocessable_entity }
#        format.json { render json: @worker.errors, status: :unprocessable_entity }
#      end
#    end
    redirect_to workers_path
  end

  # DELETE /workers/1 or /workers/1.json
  def destroy
    @worker.destroy

    respond_to do |format|
      format.html { redirect_to workers_url, notice: "Worker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def inss_descount
    descount = calculate_inss_descount(params[:salary])

    respond_to do |format|
      format.json {
        render status: :ok,
               json: { tax: descount.round(2) }
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worker_params
      params.require(:worker).permit(:name, :cpf, :birthdate, :personal_phone, :salary, :reference_phone, :street, :number, :district, :city, :state, :zip_code)
    end

    def calculate_inss_descount(salary)
      salary = salary.to_f

      taxes = TAX_RULES[:percent_tax]
      salaries = TAX_RULES[:salary_range]

      desc = 0.0
      taxes.each_with_index do |tax, i|
        min_sal = salaries[i]
        max_sal = salaries[i+1]

        desc += ([max_sal, salary].min - min_sal) * tax / 100 if salary > min_sal
      end

      desc
    end
end
