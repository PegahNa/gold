class PhoneNumberCrawler
    def initialize(diary)
        @diary = diary 
    end

    def extract_numbers
        numbers = []
        @diary.entries.each do |entry|
            numbers += entry.contents.scan(/\b\d{9}\b/)
        end
        numbers.uniq
    end

    private
    def extract_numbers_from_entry(entry)
        return entry.contents.scan(/07[0-9]{9}/)
    end
end
