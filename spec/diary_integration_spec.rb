require 'diary'
require 'diary_entry'
require 'diary_reader'
require 'phone_number_crawler'

RSpec.describe "diary integration" do 
    it "adds diary entries to the list" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("my title", "my contents")
        entry_2 = DiaryEntry.new("my title two", "my contents two")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.entries).to eq [entry_1, entry_2]
    end

    describe "diary reading behavoiur" do
        context "where is the perfect diary entry to read in the time" do
            it "finds that entry" do
                diary = Diary.new
                reader = DiaryReader.new(2, diary)
                entry_1 = DiaryEntry.new("title1", "one")
                entry_2 = DiaryEntry.new("title2", "one two")
                entry_3 = DiaryEntry.new("title3", "one two three")
                entry_4 = DiaryEntry.new("title4", "one two three four")
                entry_5 = DiaryEntry.new("title5", "one two three four five")
                diary.add(entry_1)
                diary.add(entry_2)
                diary.add(entry_3)
                diary.add(entry_4)
                diary.add(entry_5)
                expect(reader.find_most_readable_in_time(2)).to eq entry_4
            end
        end
    end

        context "where the best entry is a bit shorter than optimum" do
            it "finds that entry" do
                diary = Diary.new
                reader = DiaryReader.new(2, diary)
                entry_1 = DiaryEntry.new("title1", "one")
                entry_2 = DiaryEntry.new("title2", "one two")
                entry_3 = DiaryEntry.new("title3", "one two three")
                entry_4 = DiaryEntry.new("title4", "one two three four five")
                diary.add(entry_1)
                diary.add(entry_2)
                diary.add(entry_3)
                diary.add(entry_4)
                expect(reader.find_most_readable_in_time(2)).to eq entry_3
            end
        end

        context "where there is nothing readable" do
            it "returns nil" do
                diary = Diary.new
                reader = DiaryReader.new(2, diary)
                entry_1 = DiaryEntry.new("title1", "one two three four five")
                diary.add(entry_1)
                expect(reader.find_most_readable_in_time(2)).to eq nil
            end
        end

        context "with an empty diary" do
            it "returns nil" do
                diary = Diary.new
                reader = DiaryReader.new(2, diary)
                expect(reader.find_most_readable_in_time(2)).to eq nil
            end
        end

        context "where WPM is invalid" do
            it "fails" do
                diary = Diary.new
                expect { 
                    DiaryReader.new(0, diary)
                }.to raise_error "WPM must be above 0."
            end
        end

    describe "phone number behavoiur" do
            it "extraxts phone number from all diary entries" do
                diary = Diary.new
                phone_book = PhoneNumberCrawler.new(diary)
                diary.add(DiaryEntry.new("title0", "my friend is nice"))
                diary.add(DiaryEntry.new("title1", "my friend 078000000, 078000001, and 078000002, are nice"))
                diary.add(DiaryEntry.new("title2", "my friend 078000000, 078000001, and 078000002, are nice"))
                expect(phone_book.extract_numbers).to eq ["078000000", "078000001", "078000002"]
            end
        end

            it "doesnt extract invalid numbers" do
                diary = Diary.new
                phone_book = PhoneNumberCrawler.new(diary)
                diary.add(DiaryEntry.new("title0", "my friend is nice"))
                diary.add(DiaryEntry.new("title1", "my friend 07800000, 1780000000, is nice"))
                expect(phone_book.extract_numbers).to eq []
            end
end
                
            
        

       
