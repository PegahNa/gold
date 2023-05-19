{{PROBLEM}} Multi-Class Planned Design Recipe

1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

2. Design the Class System

Class Diary
def add(entry)
end

def entries
#returns A list of diaryEntries
end
end

class DiaryEntry
def initialize(title, contents)
end

def title
#return title
end

def contents
#return contacts
end
end

Class PhoneNumberCrawler
def initialize(diary)
#diary is an intance of diary
end

def extract_numbers
#returns a list of strings phone numbers
#gathered across all diary contacts
end
end

Class DiaryReader
def initialize
#wpm is a number , how many words a reader can read in 1 minute
#diary is an intance of duary
end

def find_most_readable_in_time(time)
end
end

Class TrackList
def add(task)
end

def all
end
end

Class Task
def initialize(title)
end

def title
end
end

3. Create Examples as Integration Tests

## 1 fits exactly

diary = Diary.new
entry_1 = DiaryEntry.new("my title", "my contents")
entry_2 = DiaryEntry.new("my title two", "my contents two")
diary.add(entry_1)
diary.add(entry_2)
expect(diary.entries).to eq [entry_1, entry_2]

## 2 fits exactly

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

## 3 does not fit exactly

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

## 4 nothing readable

diary = Diary.new
reader = DiaryReader.new(2, diary)
entry_5 = DiaryEntry.new("title1", "one two three four five")
diary.add(entry_1)
expect(reader.find_most_readable_in_time(2)).to eq nil

## 5 nothing at all

diary = Diary.new
reader = DiaryReader.new(2, diary)
expect(reader.find_most_readable_in_time(2)).to eq nil

## 4 wpm involved

diary = Diary.new
DiaryEntry.new(0, diary)

## 5

track_list = TrackList.new
track_1 = Track.new("walk the dog")
track_2 = Track.new("walk the cat")
track_list.add(task_1)
track_list.add(task_2)
expect(task_list).to eq [task_1, task_2]

## 6

diary = Diary.new
phone_book = PhoneBookCrawler.new(diary)
diary.add(DiaryEntry.new("titile1", "my firend 078000000 is nice"))
diary.add(DiaryEntry.new("titile1", "my firend 078000000, 078000001, and 078000002, are nice"))
expect(phone_book.extract_numbers).to eq ["078000000", "078000001", "078000002"]

4. Create Examples as Unit Tests

5. Implement the Behaviour
   After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
