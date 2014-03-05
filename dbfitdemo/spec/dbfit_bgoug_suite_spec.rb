require 'spec_helper'

describe "DbfitBgougSuite" do
  let(:fitnesse_return) { run_dbfit_suite() }
  it { expect(fitnesse_return.exitstatus).to eq 0 }
end

