require 'spec_helper'
require_relative '../../lib/race'

RSpec.describe Race, type: :model do

  before do
    subject { described_class.new }
  end

  describe "#racers_result" do
    it "returns an Array" do
      expect(subject.racers_result).to be_kind_of(Array)
    end

    it "returns a Hash with racers result stats" do
      racer = subject.racers_result.first

      expect(racer).to be_kind_of(Hash)
      
      expect(racer[:code]).to     eq(38)
      expect(racer[:name]).to     eq("F.MASSA")
      expect(racer[:laps_qty]).to eq(4)
      expect(racer[:duration]).to eq(251578)
      expect(racer[:duration_time]).to eq("4 minutes, 11 seconds, 578 milliseconds")
      expect(racer[:position]).to eq(1)
    end
  end

  describe "#winner" do
    it "returns the race winner" do
      expect(subject.winner[:code]).to     eq(38)
      expect(subject.winner[:name]).to     eq("F.MASSA")
      expect(subject.winner[:laps_qty]).to eq(4)
      expect(subject.winner[:duration]).to eq(251578)
      expect(subject.winner[:duration_time]).to eq("4 minutes, 11 seconds, 578 milliseconds")
      expect(subject.winner[:position]).to eq(1)
    end
  end
end
