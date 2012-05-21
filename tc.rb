require 'rubygems'
require 'twitter'
require 'classifier'

def get_timeline(username)

  timeline = Twitter.user_timeline(username)
  all_text = ""
  unless timeline.empty?
    last_id = timeline[0].id
    timeline.each do|st|
      all_text = all_text + "#{st.text}"
      # puts "#{st.text}"
    end
  end
  return all_text
end

def clear_punc (arr)
  toReturn = []
  arr.each { |elem| toReturn.push(elem.gsub!(/[^0-9a-z]*/i, '')) }
  return toReturn
end

def count_words ( arr )
  words = Hash.new
  arr.each {
    |word|
    if (words.has_key?(word))
      
      val = words[word]
      val += 1
      words[word] = val
      # puts "word repeated " + word + "( " + val.to_s() + " )"
    else 
      # puts "new word " + word
      words[word] = 1
    end
  }
  return words
end

def print_stats (word_counts)
  to_return = ""
  top_words = Hash[*word_counts.sort_by { |k,v| -v }[0..9].flatten]
  puts top_words
  top_words.sort{|a,b| -(a[1]<=>b[1])}.each { |elem|
    to_return = to_return + "#{elem[1]} -> #{elem[0]}<br>"
  }
  # puts to_return
  return to_return
end

print "Enter Twitter username: "
username = gets.chomp
#username = "BillLaboon"

timeline_text = get_timeline(username)


b = Classifier::Bayes.new 'Professional', 'Unprofessional'

# Professional
b.train_professional "Indeed, this is a very fine day"
b.train_professional "if young graduates want to build a future in the Big Data Era, I have one word for you (OK, two): Machine Learning"
b.train_professional "Catholics File Suits on Contraceptive Coverage"
b.train_professional "Seattle officials have a kinder and gentler way of dealing with storm water. But will residents buy it?"
b.train_professional "very interesting thought here. kill PA property taxes, increase sales and income tax?"
b.train_professional "A New Obstacle For Professional Women: The Glass Escalator"
b.train_professional "Simulations show launch ok with bad valve. Still, better to stop & fix. Recalling rockets after launch is not an option."
b.train_professional "House raises small business contracting goal to 25%"
b.train_professional "Westinghouse adds partners for small reactor project"
b.train_professional "Search in Gmail gets better with improved autocomplete predictions"
b.train_professional "Are you a Tech Wizard looking to give back to the community? Applications for our HandsOn Tech VISTA program due..."
b.train_professional "The Caucus: Following Booker Criticisms, a Struggle to Define What's Fair Game"
b.train_professional "Navigating the Ever-Changing Local Search Marketing Space"
b.train_professional "NATO Formally Agrees to Transition on Afghan Security"
b.train_professional "Today, Larry announced that we're giving Cornell space in our NY HQ while they build their NYC tech campus"
b.train_professional "SpaceX launch attempt is set for 3:44 AM ET on Tuesday, May 22nd. Live launch webcast at 3:00 AM ET on"
b.train_professional "These people are convinced the first thing they have to do is learn how to write code"

# Unprofessional
b.train_unprofessional "lyk dis if u cry evry tiem"
b.train_unprofessional "Got ma braces all red white and blue for da jubilee, and cos yolo"
b.train_unprofessional "Eh, I'm 18. Imma go like it's casual. YOLO."
b.train_unprofessional "Bitch IDGAF if u Beez in da trap ...this dick ain't gon suck itself ...yo head need to Beez in my lap"
b.train_unprofessional "Lmao you aint shit my gf dont compare to you, I swear."
b.train_unprofessional "i can't say it enough... BE HUMBLE BITCHS. talking like ur the shit makes u looook like shit"
b.train_unprofessional "Niggas be on twitter talkin reckless but won't say half the shit in person."
b.train_unprofessional "By the time I have a kid therell b all that cool Jetson-esque equipment 2 wash it clean it, feed it & shit Who's smug now eh? Life is good"
b.train_unprofessional "Y is it when u hit ur toe on something it feels like u broke ur whole dam foot"
b.train_unprofessional "DAM RIGHT! lol My bestie is a rapper lol I could never betray the team lol"
b.train_unprofessional "Bad as I wanna look gud...pretend I dont give a dam. I wanna say what is left here....even if its crumbs of a romance"
b.train_unprofessional "going over details for this baby shower now my dam phone dead n i forgot my charger!!!"
b.train_unprofessional "Just Left Crib We Was Speakin Some Real Shyt That Some Niggaz Wont Understand"
b.train_unprofessional "If idk U or U Dnt Rep. Dnt Tlk to Me Unless U Got 50k+ Followers Doe Cuhz Det Lil Shyt Stoppin'.. Keep My Dick Out Ya'll Mouf doe"
b.train_unprofessional "Niqqaz be saying the same shyt nawadayz, u can't even figure out who's serious anymore"
b.train_unprofessional "Lil dry stank pussy: EveryGirl be fake horny wen it rain knowin that shyt don't rain"

puts b.classify(timeline_text)
puts b.classifications(timeline_text)