class BudgetTypesController < InheritedResources::Base

  private

    def budget_type_params
      params.require(:budget_type).permit(:name)
    end

end
