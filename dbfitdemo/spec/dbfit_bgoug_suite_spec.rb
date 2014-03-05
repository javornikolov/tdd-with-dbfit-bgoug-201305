require 'spec_helper'

describe "DbfitBgougSuite" do
  let(:fitnesse_return) { run_dbfit_suite() }
  it { fitnesse_return.exitstatus.should == 0 }
end

