require 'spec_helper'
require_relative '../../lib/file_processor'

RSpec.describe FileProcessor, type: :model do
  context "#normalize_file" do
    context "when file is valid" do
      subject { described_class.new("race_log.txt") }

      it "should return an Array of hashes" do
        normalized_file = subject.normalize_file

        expect(normalized_file).to be_kind_of(Array)
        expect(normalized_file.first).to be_kind_of(Hash)
      end
    end

    context "when file is not valid" do
      subject { described_class.new("") }
      it "should raise an exception" do
        expect do
          subject.normalize_file
        end.to raise_error(Errno::ENOENT)
      end
    end
  end
end

