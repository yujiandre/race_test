require 'spec_helper'
require_relative '../../lib/racer_stats'

RSpec.describe RacerStats, type: :model do
  let!(:result) do
    [{:code=>38, :name=>"F.MASSA", :lap=>1, :duration=>"1:02.852", :speed=>"44,275", :end_at=>"23:49:08.277"},
     {:code=>33, :name=>"R.BARRICHELLO", :lap=>1, :duration=>"1:04.352", :speed=>"43,243", :end_at=>"23:49:10.858"},
     {:code=>2, :name=>"K.RAIKKONEN", :lap=>1, :duration=>"1:04.108", :speed=>"43,408", :end_at=>"23:49:11.075"},
     {:code=>23, :name=>"M.WEBBER", :lap=>1, :duration=>"1:04.414", :speed=>"43,202", :end_at=>"23:49:12.667"},
     {:code=>15, :name=>"F.ALONSOi", :lap=>1, :duration=>"1:18.456", :speed=>"35,47", :end_at=>"23:49:30.976"},
     {:code=>38, :name=>"F.MASSA", :lap=>2, :duration=>"1:03.170", :speed=>"44,053", :end_at=>"23:50:11.447"},
     {:code=>33, :name=>"R.BARRICHELLO", :lap=>2, :duration=>"1:04.002", :speed=>"43,48", :end_at=>"23:50:14.860"},
     {:code=>2, :name=>"K.RAIKKONEN", :lap=>2, :duration=>"1:03.982", :speed=>"43,493", :end_at=>"23:50:15.057"},
     {:code=>23, :name=>"M.WEBBER", :lap=>2, :duration=>"1:04.805", :speed=>"42,941", :end_at=>"23:50:17.472"},
     {:code=>15, :name=>"F.ALONSO", :lap=>2, :duration=>"1:07.011", :speed=>"41,528", :end_at=>"23:50:37.987"},
     {:code=>38, :name=>"F.MASSA", :lap=>3, :duration=>"1:02.769", :speed=>"44,334", :end_at=>"23:51:14.216"},
     {:code=>33, :name=>"R.BARRICHELL", :lap=>3, :duration=>"1:03.716", :speed=>"43,675", :end_at=>"23:51:18.576"},
     {:code=>2, :name=>"K.RAIKKONEN", :lap=>3, :duration=>"1:03.987", :speed=>"43,49", :end_at=>"23:51:19.044"},
     {:code=>23, :name=>"M.WEBBER", :lap=>3, :duration=>"1:04.287", :speed=>"43,287", :end_at=>"23:51:21.759"},
     {:code=>15, :name=>"F.ALONSO", :lap=>3, :duration=>"1:08.704", :speed=>"40,504", :end_at=>"23:51:46.691"},
     {:code=>11, :name=>"S.VETTEL", :lap=>1, :duration=>"3:31.315", :speed=>"13,169", :end_at=>"23:52:01.796"},
     {:code=>38, :name=>"F.MASS", :lap=>4, :duration=>"1:02.787", :speed=>"44,321", :end_at=>"23:52:17.003"},
     {:code=>33, :name=>"R.BARRICHELLO", :lap=>4, :duration=>"1:04.010", :speed=>"43,474", :end_at=>"23:52:22.586"},
     {:code=>2, :name=>"K.RAIKKONEN", :lap=>4, :duration=>"1:03.076", :speed=>"44,118", :end_at=>"23:52:22.120"},
     {:code=>23, :name=>"M.WEBBER", :lap=>4, :duration=>"1:04.216", :speed=>"43,335", :end_at=>"23:52:25.975"},
     {:code=>15, :name=>"F.ALONSO", :lap=>4, :duration=>"1:20.050", :speed=>"34,763", :end_at=>"23:53:06.741"},
     {:code=>11, :name=>"S.VETTEL", :lap=>2, :duration=>"1:37.864", :speed=>"28,435", :end_at=>"23:53:39.660"},
     {:code=>11, :name=>"S.VETTEL", :lap=>3, :duration=>"1:18.097", :speed=>"35,633", :end_at=>"23:54:57.757"}]
  end

  context "from a valid hash" do
    subject { described_class.new(result) }

    describe "#racers" do
      it "returns an Array" do
        expect(subject.racers).to be_kind_of(Array)
      end

      it "returns a Hash with racers result stats" do
        racer = subject.racers.first

        expect(racer).to be_kind_of(Hash)

        expect(racer[:code]).to     eq(38)
        expect(racer[:name]).to     eq("F.MASSA")
        expect(racer[:laps_qty]).to eq(4)
        expect(racer[:duration]).to eq(251578)
        expect(racer[:position]).to eq(1)
      end
    end
  end
end
