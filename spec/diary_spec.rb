require 'diary'
"--color --format documentation"
RSpec.describe Diary do
    it "initiallyhas an empty list of entries" do
    diary = Diary.new 
        expect(diary.entries).to eq []
    end
end

  