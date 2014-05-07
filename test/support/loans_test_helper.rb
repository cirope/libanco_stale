module LoansTestHelper
  def create_loans(start_date = Date.today, end_date = Date.today)
    loans = []

    (start_date.beginning_of_month.to_date..end_date.end_of_month.to_date).
      select { |d| d.day == 1 }.each do |created_at|

      loans << Loan.create!(
        amount: 10000,
        rate_id: rates(:rate_1),
        rate_set_id: rate_sets(:private_rate_set),
        job: jobs(:private),
        user: users(:franco),
        created_at: created_at
      )
    end

    loans
  end
end
