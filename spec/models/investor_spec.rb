require 'spec_helper'

describe Investor do
  describe(".invest") do
    before(:each) do
      @deal = FactoryGirl.build(:deal)
      @investor = FactoryGirl.build(:investor)
    end

    # Note that the rules say that investors making less than $100k can
    # invest 2k per year (on a rolling basis) or 5% of their income,
    # whichever is greater.  Investors making more than $100k annually can
    # invest up to 10% of their income, unless they're using the "accredited
    # investor" exemption, at which point they can dump as much money as
    # they like.

    # This effectively breaks unaccredited folks into three different brackets:
    #  1. People making $1 - $40k ($2k cap.)
    #  2. People making $40k - $100k (5% of income)
    #  3. People making > $100k (10% of income)

    # Under no circumstances do we allow investments <= 0
    it "does not allow investments of $0" do
      amount = 0
      lambda { @investor.invest(@deal, amount) }.should raise_error
    end

    it "does not allow negative investments" do
      amount = -1
      lambda { @investor.invest(@deal, amount) }.should raise_error
    end

    context "Investor makes less than 40k annually" do

      before (:each) do
        @investor.annual_income = 5000 # $5k
        @investor.save!
      end

      it "can invest <= $2k regardless of income" do
        amount = 2000 # $2000
        lambda { @investor.invest(@deal, amount) }.should_not raise_error
      end

      it "cannot invest > $2k" do
        amount = 2000.10 # $2000.10
        lambda { @investor.invest(@deal, amount) }.should raise_error
      end
    end

    context "Investor makes between $40k and $100k" do
      before (:each) do
        @investor.annual_income = 50000 # $50k
        @investor.save!
      end

      pending "should be able to invest up to 5% of their income" do
      end

      pending "should not be able to invest more than 5% of their income" do
      end
    end

    context "Investor makes more than $100k" do
      before (:each) do
        @investor.annual_income = 120000 # $120k
        @investor.save!
      end

      pending "should be able to invest up to 10% of their income" do
      end

      pending "should not be able to invest more than 10% of their income" do
      end

    end

  end

  describe(".annual_investment_total") do
    # This method should return the total of all investments the investor has
    # made over the past 12 months.
    pending "put actual tests here" do
      # NO REALLY, PUT ACTUAL TESTS HERE
    end
  end
end
