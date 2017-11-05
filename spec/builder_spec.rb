require 'spec_helper'
require 'builder'
describe Builder do

 subject(:builder) { described_class.new("Jane")}

  describe "#initialize" do
    it "initilizes with name" do
      expect(builder.name).to eq "Jane"
    end
  end

  describe "#is_a" do
    it "responds to is_a method" do
      expect{ builder.is_a }.not_to raise_error
    end
  end

  describe "#woman?" do
    context "when the subject is not defined as woman" do
      before do
        builder.is_a.woman
      end
      it "returns true" do
        expect(builder.woman?).to eq(true)
      end
    end

    context "when subject is not woman" do
      it "returns false" do
        expect(builder.woman?).to eq(false)
      end
    end
  end

  describe "#is_not_a" do

    context "when subject defined as not woman" do
      before do
        builder.is_not_a.woman
      end

      it "returns false" do
        expect(builder.woman?).to eq(false)
      end
    end
  end

end
