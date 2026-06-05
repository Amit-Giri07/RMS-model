class DiningTablesController < ApplicationController
  def index
    @dining_tables = DiningTable.all
  end

  def new
    @dining_table = DiningTable.new
  end

  def create
    @dining_table = DiningTable.new(dining_table_params)

    if @dining_table.save
      redirect_to dining_tables_path, notice: "Table created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dining_table = DiningTable.find(params[:id])
  end

  def update
    @dining_table = DiningTable.find(params[:id])

    if @dining_table.update(dining_table_params)
      redirect_to dining_tables_path, notice: "Table Updated Successfully"
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @dining_table = DiningTable.find(params[:id])
    @dining_table.destroy

    redirect_to dining_tables_path, notice: "Table Deleted Successfully"
  end

  private

  def dining_table_params
    params.require(:dining_table)
          .permit(:table_number, :status, :restaurant_id)
  end
end
